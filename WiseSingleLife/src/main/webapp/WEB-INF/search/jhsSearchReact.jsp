<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
                            <form action="javascript:void(0)" className="search-property">
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
													onKeyDown={(e)=>{if(e.keyCode==13){this.props.addToSearchKeywordList(this.state.keyword);this.setState({keyword:''})}}}
													onChange={(e)=>{this.setState({keyword:e.target.value})}}
													value={this.state.keyword}
													className="hidden_input" tabIndex="1" autoComplete="off" autoCorrect="off" autoCapitalize="off" spellCheck="false" role="textbox" ariaAutocomplete="list" placeholder=""
												/>
											</li>
										</ul>
										<button onClick={this.props.setMartData} className="sliderBtn pl-0">검색</button>
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
                            </form>
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
            searchKeywordList: ['시금치'],
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
		alert('axios call...')
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