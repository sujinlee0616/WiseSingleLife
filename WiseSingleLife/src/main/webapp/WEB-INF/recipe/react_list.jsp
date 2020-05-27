<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="app"></div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react-dom.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.23/browser.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/babel">
	class ButtonGroup extends React.Component {
		constructor(props) {
			super(props);
		}
		
		render() {
			return (
				<div className="container">
					<div className="row" style={{"marginBottom":"50px"}}>
						<div className="col-md-6">
							<button disabled={this.props.curpage>=this.props.totalpage} style={{"backgroundColor":"#F4D047"}} type="button" className="btn btn-block moreBtn"
								onClick={this.props.moreSearchResults}
							>
								{this.props.curpage>=this.props.totalpage ? (<span>마지막 페이지</span>) : (<span>▽ 더 보기 ( {this.props.curpage} / {this.props.totalpage} )</span>) }
							</button>
						</div>
						<div className="col-md-6">
							<button style={{"backgroundColor":"#F4D047"}} onclick="javascript:window.scrollTo({top:0,behavior:'smooth'})" type="button" className="btn btn-block moreBtn">맨 위로 △</button>
						</div>
					</div>
				</div>
			);
		}
	}
	
	class SearchResultDetail extends React.Component {
		constructor(props) {
			super(props);
		}

		render() {
			return (
				<div>{this.props.item.title}</div>
			);
		}
	}

	class SearchResultContainer extends React.Component {
		constructor(props) {
			super(props);
		}

		render() {
			let items=[];
			this.props.searchResults.map((item)=>{
				items.push(<SearchResultDetail item={item}/>);
			});

			return (<div>
				{items}
				</div>
			);
		}
	}
	
	class SearchBar extends React.Component {
		constructor(props) {
			super(props);
		}
		
		render() {
			return (
				<section className="ftco-search bg-light">
					<div className="container">
						<div className="row">
							<div className="col-md-12 search-wrap">
								<h2 className="heading h5 d-flex align-items-center pr-4"><span className="ion-ios-search mr-3"></span>상세검색</h2>
								<div className="row">
									<div className="col-md-2 pl-0">
										<div className="form-group">
											<div className="form-field">
												<div className="select-wrap">
													<select name="category" value={this.props.optionValue} onChange={this.props.setOptionValue} className="form-control">
														<option value="레시피">레시피</option>
														<option value="재료">재료</option>
														<option value="셰프">셰프</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<input className="img_slider_search" name="keyword" type="search" placeholder="검색어를 입력하세요." value={this.props.keyword} onChange={this.props.setKeyword}/>
									<button className="sliderBtn" onClick={this.props.setSearchResults}>검색</button>
								</div>
							</div>
						</div>
					</div>
				</section>
			);
		}
	}
	
	class App extends React.Component {
		constructor(props) {
			super(props);
			this.state = {
				optionValue:'레시피',
				keyword:'',
				curpage:0,
				totalpage:0,
				searchResults:[]
			}
			this.setOptionValue = this.setOptionValue.bind(this);
			this.setKeyword = this.setKeyword.bind(this);
			this.setSearchResults = this.setSearchResults.bind(this);
			this.moreSearchResults = this.moreSearchResults.bind(this);
		}

		moreSearchResults() {
			alert('more call...');
			axios.get("http://localhost:8081/web/recipe/search.do",{
				params: {
					category:this.state.optionValue,
					page:this.state.curpage+1,
					keyword:this.state.keyword
				}
			}).then((result)=>{
				this.setState({
					totalpage:result.data.totalpage,
					searchResults:this.state.searchResults.concat(result.data.list),
					curpage:this.state.curpage+1
				});
			});
		}

		setSearchResults() {
			this.setState({
				curpage:0,
				totalpage:0
			});			

			axios.get("http://localhost:8081/web/recipe/search.do",{
				params: {
					category:this.state.optionValue,
					page:this.state.curpage+1,
					keyword:this.state.keyword
				}
			}).then((result)=>{
				this.setState({
					totalpage:result.data.totalpage,
					searchResults:result.data.list,
					curpage:this.state.curpage+1
				});
			});
		}
		
		setKeyword(e) {
			this.setState({keyword:e.target.value});
		}
		
		setOptionValue(e) {
			this.setState({optionValue:e.target.value});
		}
		
		render() {
			return (
				<div>
					<SearchBar optionValue={this.state.optionValue} setOptionValue={this.setOptionValue} value={this.state.keyword} setKeyword={this.setKeyword} setSearchResults={this.setSearchResults}/>
					<SearchResultContainer searchResults={this.state.searchResults}/>
					{ this.state.totalpage===0 ? <br/> : <ButtonGroup curpage={this.state.curpage} totalpage={this.state.totalpage} moreSearchResults={this.moreSearchResults}/> }
				</div>
			);
		}
	}
	
	ReactDOM.render(<App />, document.getElementById('app'));
</script>
</body>
</html>