<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/search.css">
<title>Insert title here</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.20.0/vis.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react-dom.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.23/browser.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/7.10.1/polyfill.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> 
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div id="root"></div>
<script type="text/babel">
const URL = 'http://localhost:8080/web/'



class RecipeRecommend extends React.Component {
  render() {
    return (
      <div className="row">
        <div className="saved">
          <div className="title">
            <h5 className="saved_title">추천 레시피</h5>
          </div>
          <div className="savedItemArea">
            <div className="item">
              <div className="img">
                <a href="#">
                  <img
                    className="product_img"
                    src="https://recipe1.ezmember.co.kr/cache/recipe/2015/09/21/8120c5f993593892442603f5e246eb671.jpg"
                  />
                </a>
              </div>
              <a href="#">
                <p className="product">까르보나라 떡볶이</p>
                <p className="price mb-0">떡볶이,까르보나라</p>
              </a>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

class SaveItems extends React.Component {
  render() {
     const savedItems = this.state.saveItems.map((m) => (
       <div className="item">
        <a href="#">
           <p className="product">{m.name}</p>
           <p className="price mb-0">{m.price}</p>
         </a>
       </div>
     ));

    return (
      <div className="row">
        <div className="saved">
          <div className="title">
            <h5 className="saved_title">저장한 상품</h5>
          </div>
          <div className="savedItemArea">
			{savedItems}
			</div>
        </div>
      </div>
    );
  }
}

class Item extends React.Component {
  constructor(props) {
    super(props);
    this.onCheckItems = this.onCheckItems.bind(this);
  }

  onCheckItems(e) {
    var clsname = e.target.className;
    //props로
    var itemname = e.target.dataset.name;
    var itemprice = e.target.dataset.price;

    if ((clsname = "saveBtn on")) {
      e.taget.className = "saveBtn";
      const { tempItems } = this.state;
      this.setstate({
        tempItems: tempItems.filter((tempItems) => tempItems.name !== itemname),
      });
    } else {
      const { tempItems } = this.state;
      e.target.className = "saveBtn on";
      this.setState({
        tempItems: tempItems.concat({
          no: this.no++,
          name: itemname,
          price: itemprice,
        }),
      });
    }
  }

  render() {
    return (
      <div className="list_item">
        <div className="img">
          <a href="main/detail.do">
            <img
              className="product_img"
              alt="{this.props."
              src={this.props.item.img}
            />
          </a>
          <button
            type="button"
            className="saveBtn on"
            onClick={(e) => {
              this.onCheckItems(e);
            }}
            data-code={this.props.item.productcode}
            data-name={this.props.item.name}
            data-price={this.props.item.price}
          ></button>
        </div>
        <div className="info">
          <a href="main/detail.do">
            <p className="product">{this.props.item.name}</p>
            <p className="price">{this.props.item.price}</p>
          </a>
        </div>
      </div>
    );
  }
}

class ItemList extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      items: this.props.martitems.slice(0, 4).map((m) => <Item item={m} />),
    };
  }

  render() {
    return (
      <td className={this.props.martname}>
        {this.state.items}
        <button
          type="button"
          className="btn btn-block moreBtn"
          data-toggle="modal"
          data-target="#moreBtn"
          data-martname={this.props.key}
          data-keyword={this.props.keyword}
          onClick={(e)=>{showModalBtn(e);}}
        >
          + 더 보기
        </button>
      </td>
    );
  }
}

class MartRow extends React.Component {
  constructor(props) {
    super(props);
  }
  render() {
    return (
      <tr className="mall_result" id="product1">
        <td rowSpan="2" className="product_name">
          {this.props.kw_data.keyword}
        </td>
        
          <ItemList martitems={this.props.kw_data.data['lm']} keyword={this.props.kw_data.keyword} showModalBtn={this.props.kw_data.showModalBtn}/>
          <ItemList martitems={this.props.kw_data.data['hp']} keyword={this.props.kw_data.keyword} showModalBtn={this.props.kw_data.showModalBtn}/>
          <ItemList martitems={this.props.kw_data.data['em']} keyword={this.props.kw_data.keyword} showModalBtn={this.props.kw_data.showModalBtn}/>
          <ItemList martitems={this.props.kw_data.data['cp']} keyword={this.props.kw_data.keyword} showModalBtn={this.props.kw_data.showModalBtn}/>
      </tr>
    );
  }
}

class MartTable extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
		let html = this.props.martdata.map((m) => <MartRow kw_data={m}/> )

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
                            {html}
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
            recipeRecommendList: [],
        };
        this.setOptionValue = this.setOptionValue.bind(this);
        this.addToSearchKeywordList = this.addToSearchKeywordList.bind(this);
        this.setSaveItems = this.setSaveItems.bind(this);
        this.setRecipeRecommendList = this.setRecipeRecommendList.bind(this);
        this.setMartData = this.setMartData.bind(this);
		this.getJSON = this.getJSON.bind(this);
		this.removeFromSearchKeywordList = this.removeFromSearchKeywordList.bind(this);
	}

	componentWillMount() {
		var keyset = '${keyword}'
		var temp = []
		temp.push(keyset)
		this.setState({searchKeywordList:temp})
	}

	componentDidMount() {
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

	getJSON(keyword) {
		axios.get(URL+'searchrest.do',{
				params : { keyword:keyword }
			}).then((res)=>{
				let obj = { keyword:keyword, data:res.data }
				let temp = []
				temp = this.state.martdata
				temp.push(obj)
				this.setState({martdata:temp})
console.log(this.state.martdata)
			})
	}

    setMartData() {
		this.state.searchKeywordList.map(async(keyword)=>{
			await this.getJSON(keyword)
		})
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
						{this.state.saveItems.length!=0 ? <SaveItems /> : null }
						{this.state.recipeRecommendList.length!=0 ? <RecipeRecommend /> : null }
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