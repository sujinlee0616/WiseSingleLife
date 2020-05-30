<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.20.0/vis.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react-dom.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.23/browser.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> 
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div id="root"></div>
<script type="text/babel">
const URL = 'http://localhost:8080/web/'

class MartRow extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            kw_data : this.props.kw_data.map((m)=>
                <td><ItemList martname={m}/></td>
            )
        }
   }
    render() {

        return (
                <tr className="mall_result" id="product1">
                    <td rowSpan="2" className="product_name">
                        {this.props.kw_data.keyword}
                    </td>
                    {this.props.kw_data}
                 </tr>
        )
    }
}

class MartTable extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            martRows: this.props.martdata.map((m) => <tr><MartRow kw_data={m}/></tr> )
        }
    }

    render() {
        return (
            <section className="list-section mb-3 bg-light">
                <div className="container">
                    <div className="row">
                        <table className="result">
                            <tr className="mall_list">
                                <td className="default">쇼핑몰 이름</td>
                                <td className="td1">롯데마트</td>
                                <td className="td2">이마트</td>
                                <td className="td3">홈플러스</td>
                                <td className="td4">쿠팡</td>
                            </tr>
                            {this.state.martRows}
                        </table>
                    </div>
                </div>
            </section>
        )
    }
}

class SearchBar extends React.Component {
	constructor(props) {
        super(props);
        this.state = {
            keyword:''
        }
    }

    render() {
		let keywordListHtml = this.props.searchKeywordList.map( m =>
									<li className="selected">
										{m}
										<span className="xBtn" data-keyword={m} onClick={(e)=>{this.props.removeFromSearchKeywordList(e)}}>X</span>
									</li>
								)

        return (
            <section className="ftco-search bg-light">
                <div className="container">
                    <div className="row">
                        <div className="col-md-12 search-wrap">
                                <div className="row">
                                    <div className="col-md-2 pl-0">
                                        <div className="form-group">
                                            <div className="form-field">
                                                <div className="select-wrap">
                                                    <div className="icon">
                                                        <span className="ion-ios-arrow-down"/>
                                                    </div>
                                                    <select
                                                        value={this.props.optionValue}
                                                        onChange={this.props.setOptionValue}
                                                        className="form-control"
                                                    >
                                                        <option value="pop">인기랭킹순</option>
                                                        <option value="asc">가격낮은순</option>
                                                        <option value="desc">가격높은순</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="col-md-8 pl-0">
										<ul className="searchInputLikeUl mb-0">
											{keywordListHtml}
											<li className="current">
												<input
													onKeyDown={(e)=>{e.stopPropagation();if(e.keyCode==13){this.props.addToSearchKeywordList(this.state.keyword);this.setState({keyword:''})}}}
													onChange={(e)=>{this.setState({keyword:e.target.value})}}
													value={this.state.keyword}
													className="hidden_input" tabIndex="1" autoComplete="off" autoCorrect="off" autoCapitalize="off" spellCheck="false" role="textbox" ariaAutocomplete="list" placeholder=""
												/>
											</li>
										</ul>
										<button onClick={()=>{this.props.setMartData()}} className="sliderBtn pl-0">검색</button>
									</div>
                                    <div className="col-md-2 align-self-end">
                                        <div className="form-group">
                                            <div className="form-field">
                                                <input
                                                    onClick={()=>{}}
                                                    type="text"
                                                    value="저장"
                                                    className="form-control btn btn-primary"
                                                />
                                            </div>
                                        </div>
                                    </div>
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
            martdata: [],
            optionValue: 'pop',
            searchKeywordList: [],
            saveItems: [],
            tempItems: [],
            recipeRecommendList: []
        };
        this.setOptionValue = this.setOptionValue.bind(this);
        this.addToSearchKeywordList = this.addToSearchKeywordList.bind(this);
        this.setSaveItems = this.setSaveItems.bind(this);
        this.setRecipeRecommendList = this.setRecipeRecommendList.bind(this);
        this.setMartData = this.setMartData.bind(this);
		this.removeFromSearchKeywordList = this.removeFromSearchKeywordList.bind(this);
	}

	componentDidMount() {
		var keyset = '${keyword}'
		var temp = []
		temp.push(keyset)
		this.setState({searchKeywordList:temp})
		this.setMartData()
	}
	
	removeFromSearchKeywordList(e) {
		var keyword = e.target.dataset.keyword
		var temp = []
		this.state.searchKeywordList.map((m)=>{
			if(m!=keyword) temp.push(m)
		})
		this.setState({searchKeywordList:temp})
	}

    addToSearchKeywordList(keyword) {
		var temp = this.state.searchKeywordList
		temp.push(keyword)
        this.setState({searchKeywordList:temp})
    }

    setOptionValue(e) {
        this.setState({optionValue: e.target.value});
    }

    setSaveItems(e) {
        this.setState({saveItems: e})
    }

    setRecipeRecommendList() {

    }

    setMartData() {
		let temp = []
		this.state.searchKeywordList.map((keyword)=>{
			axios.get(URL+'searchrest.do',{
				params : { keyword:keyword }
			}).then((res)=>{
				var keyword_data = {
					keyword:keyword,
					data:res.data
				}
				temp.push(keyword_data)
			})
		})
		this.setState({martdata:temp})
    }

    render() {
        return (
            <section className="ftco-search bg-light">
                <div className="container">
                    <div className="row">
						<SearchBar
                            optionValue={this.state.optionValue} setOptionValue={this.setOptionValue}
                            searchKeywordList={this.state.searchKeywordList}
							addToSearchKeywordList={this.addToSearchKeywordList}
							removeFromSearchKeywordList={this.removeFromSearchKeywordList}
                            setSaveItems={this.setSaveItems} setMartData={this.setMartData}
                        />
						<MartTable martdata={this.state.martdata}/>
                    </div>
                </div>
            </section>
        );
    }
}

ReactDOM.render(<App />, document.getElementById("root"));
</script>
</body>
</html>