<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/search.css">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react-dom.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.23/browser.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/7.10.1/polyfill.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/react-vis/dist/dist.min.js"></script>
</head>
<body>
	<div id="root"></div>
	<script type="text/babel">
const URL = 'http://localhost:8079/web/'

const {
  XYPlot,
  XAxis,
  YAxis,
  VerticalGridLines,
  HorizontalGridLines,
  MarkSeries,
  MarkSeriesCanvas
} = reactVis

class Graph extends React.Component {
	constructor(props){
		super(props);
		this.state = {
    		data: []
		}
	}

	render() {
		const lm = this.props.martdata.data['lm'].map(m=>{
			return {
				x: m.price,
    			y: m.rate,
    			size: m.reviewcount,
    			color: '#ff5145',
    			opacity: 1
			}
		})
		const em = this.props.martdata.data['em'].map(m=>{
			return {
				x: m.price,
    			y: m.rate,
    			size: m.reviewcount,
    			color: '#ffef3b',
    			opacity: 1
			}
		})
		const hp = this.props.martdata.data['hp'].map(m=>{
			return {
				x: m.price,
    			y: m.rate/20,
    			size: m.reviewcount,
    			color: '#5465ff',
    			opacity: 1
			}
		})
		const cp = this.props.martdata.data['cp'].map(m=>{
			return {
				x: m.price,
    			y: m.rate,
    			size: m.reviewcount,
    			color: '#54ff8a',
    			opacity: 1
			}
		})
		
		const temp = [...lm,...em,...hp,...cp]

	    const markSeriesProps = {
	      animation: true,
	      className: 'mark-series-example',
	      sizeRange: [5, 15],
	      seriesId: 'my-example-scatterplot',
		  colorType: 'literal',
	      opacityType: 'literal',
	      data:temp
	    }
		
		return (
			<div className="canvas-wrapper">
		        <div className="canvas-example-controls">
		        <XYPlot
		          width={1200}
		          height={400}
		        >
		          <VerticalGridLines />
		          <HorizontalGridLines />
		          <XAxis />
		          <YAxis />
				  <MarkSeries {...markSeriesProps} />
		        </XYPlot>
			   </div>
			</div>
		)
	}
}

class Modal extends React.Component {
  
  constructor(props){
    super(props);
  }
	render() {
		let key = this.props.modalItems.martname
		let martname = ''
		if(this.props.modalItems.martname==='lm')
			martname ='롯데마트'
		else if(this.props.modalItems.martname==='hp')
			martname = '홈플러스'
		else if (this.props.modalItems.martname==='em')
			martname = '이마트'
		else if (key==='cp')
			martname = '쿠팡'

		let html = this.props.modalItems.data.map((m)=>
			<div className="col-md-3 d-flex">
						<div className="blog-entry align-self-stretch">
							<div className="img">
								<a href="#">
									<img className="product_img" src={m.img}/>
								</a>
							</div>
						<div className="text mt-3 d-block">
						<a href="#">
							<p className="product">{m.name}</p>
							<p className="price">{m.price}</p>
						</a>
					</div>
				</div>
			 </div>
		)
	
		return (
			<div className="modal fade" id="moreBtn" tabIndex="-1" role="dialog" ariaLabelledby="exampleModalLabel" ariaHidden="false">
				<div className="modal-dialog modal-lg" role="document">
				  <div className="modal-content">
					<div className="modal-header">
					  <h5 className="mb-0">[{martname}] {this.props.modalItems.keyword} 전체보기</h5>
					  <button type="button" className="close" data-dismiss="modal" ariaLabel="Close">
						<span ariaHidden="false">&times;</span>
					  </button>
					</div>
					<div className="modal-body">
						<section className="ftco-section py-2">
							<div className="container">
								<div className="row d-flex">
							 		{html}
								</div>
							</div>
						</section>

					</div>
				  </div>
				</div>
			</div>
		)
	}
}

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
	constructor(props) {
		super(props);
	}
	
  render() {
     const savedItems = this.props.saveItems.map((m) => (
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
		this.state = {
			clsname : 'saveBtn'
		}
		this.toggleClsname = this.toggleClsname.bind(this)
  	}

	toggleClsname() {
		if(this.state.clsname!='saveBtn') this.setState({clsname:'saveBtn'})
		else this.setState({clsname:'saveBtn on'})
	}

  render() {
    return (
      <div className="list_item">
        <div className="img">
          <a href="main/detail.do">
            <img
              className="product_img"
              alt="{this.props.name"
              src={this.props.item.img}
            />
          </a>
          <button
            type="button"
            className={this.state.clsname}
            onClick={(e)=>{this.toggleClsname();this.props.setCheckItems(e);}}
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

  }

  render() {
	const html = this.props.martitems.slice(0,3).map((m) => <Item item={m} setCheckItems={this.props.setCheckItems}/>)

    return (
      <td className={this.props.martname}>
        {html}
        <button
          type="button"
          className="btn btn-block moreBtn"
          data-toggle="modal"
          data-target="#moreBtn"
          data-martname={this.props.key1}
          data-keyword={this.props.keyword}
          onClick={(e)=>{this.props.showModalBtn(e)}}
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
		<tbody>
      	<tr className="mall_result" id="product1">
        	<td className="product_name" rowSpan="2">
          		{this.props.kw_data.keyword}
        	</td>
          	<ItemList key1="lm" martitems={this.props.kw_data.data['lm']} keyword={this.props.kw_data.keyword} showModalBtn={this.props.showModalBtn} setCheckItems={this.props.setCheckItems}/>
          	<ItemList key1="hp" martitems={this.props.kw_data.data['hp']} keyword={this.props.kw_data.keyword} showModalBtn={this.props.showModalBtn} setCheckItems={this.props.setCheckItems}/>
          	<ItemList key1="em" martitems={this.props.kw_data.data['em']} keyword={this.props.kw_data.keyword} showModalBtn={this.props.showModalBtn} setCheckItems={this.props.setCheckItems}/>
          	<ItemList key1="cp" martitems={this.props.kw_data.data['cp']} keyword={this.props.kw_data.keyword} showModalBtn={this.props.showModalBtn} setCheckItems={this.props.setCheckItems}/>
		</tr>
		<tr className="mall_result" id="graph1">
			<td colSpan="4" className="graph_area"><Graph martdata={this.props.kw_data}/></td>
		</tr>
		</tbody>
    )
  }
}

class MartTable extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
		let html = this.props.martdata.map((m) => <MartRow kw_data={m} showModalBtn={this.props.showModalBtn} setCheckItems={this.props.setCheckItems}/> )
		const { martdata } = this.props.martdata
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
		let size = (5-this.props.searchKeywordList.length)*100+"px"

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
                                                    <select
                                                        value={this.props.optionValue}
                                                        onChange={(e)=>{this.props.setOptionValue(e)}}
                                                        className="form-control"
														id="selectbar"
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
													style={{"width": {size}}}
													/>
											</li>
										</ul>
										<button onClick={()=>{this.props.setMartData()}} className="sliderBtn pl-0">검색</button>
									</div>
                                    <div className="col-md-2 align-self-end">
                                        <div className="form-group">
                                            <div className="form-field">
                                                <input
                                                    onClick={this.props.setSaveItems}
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
			test : "0",
            martdata: [],
            optionValue: 'pop',
            searchKeywordList: [],
            saveItems: [],
            tempItems: [],
            recipeRecommendList: [],
			modalItems : {},
			visible : false,
			saveVisible: false
        };
        this.setOptionValue = this.setOptionValue.bind(this);
        this.addToSearchKeywordList = this.addToSearchKeywordList.bind(this);
        this.setSaveItems = this.setSaveItems.bind(this);
        this.setRecipeRecommendList = this.setRecipeRecommendList.bind(this);
        this.setMartData = this.setMartData.bind(this);
		this.getJSON = this.getJSON.bind(this);
		this.removeFromSearchKeywordList = this.removeFromSearchKeywordList.bind(this);
		this.showModalBtn = this.showModalBtn.bind(this);
		this.setCheckItems = this.setCheckItems.bind(this);
		this.setIncrement = this.setIncrement.bind(this);
		this.setOrder = this.setOrder.bind(this);
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

	setOrder(tempOV, temp) {

		if(tempOV=='pop') {
			temp.map( kw_data => {
				kw_data.data['lm'].sort((a,b)=>{
					if(a.rank > b.rank) {
						return 1;
					}
					if(a.rank < b.rank) {
						return -1;
					}
					return 0;
				})
				kw_data.data['em'].sort((a,b)=>{
					if(a.rank > b.rank) {
						return 1;
					}
					if(a.rank < b.rank) {
						return -1;
					}
					return 0;
				})
				kw_data.data['hp'].sort((a,b)=>{
					if(a.rank > b.rank) {
						return 1;
					}
					if(a.rank < b.rank) {
						return -1;
					}
					return 0;
				})
				kw_data.data['cp'].sort((a,b)=>{
					if(a.rank > b.rank) {
						return 1;
					}
					if(a.rank < b.rank) {
						return -1;
					}
					return 0;
				})
			})
		} else if(tempOV=='asc') {
			temp.map( kw_data => {
				kw_data.data['lm'].sort((a,b)=>{
					if(a.price > b.price) {
						return 1;
					}
					if(a.price < b.price) {
						return -1;
					}
					return 0;
				})
				kw_data.data['em'].sort((a,b)=>{
					if(a.price > b.price) {
						return 1;
					}
					if(a.price < b.price) {
						return -1;
					}
					return 0;
				})
				kw_data.data['hp'].sort((a,b)=>{
					if(a.price > b.price) {
						return 1;
					}
					if(a.price < b.price) {
						return -1;
					}
					return 0;
				})
				kw_data.data['cp'].sort((a,b)=>{
					if(a.price > b.price) {
						return 1;
					}
					if(a.price < b.price) {
						return -1;
					}
					return 0;
				})
			})
		} else {
			temp.map( kw_data => {
				kw_data.data['lm'].sort((a,b)=>{
					if(a.price < b.price) {
						return 1;
					}
					if(a.price > b.price) {
						return -1;
					}
					return 0;
				})
				kw_data.data['em'].sort((a,b)=>{
					if(a.price < b.price) {
						return 1;
					}
					if(a.price > b.price) {
						return -1;
					}
					return 0;
				})
				kw_data.data['hp'].sort((a,b)=>{
					if(a.price < b.price) {
						return 1;
					}
					if(a.price > b.price) {
						return -1;
					}
					return 0;
				})
				kw_data.data['cp'].sort((a,b)=>{
					if(a.price < b.price) {
						return 1;
					}
					if(a.price > b.price) {
						return -1;
					}
					return 0;
				})
			})
		}
		return temp
	}


    setOptionValue(e) {
		var tempOV = e.target.value
		var temp = [].concat([...this.state.martdata])
		var temp1 = [].concat(this.setOrder(tempOV, temp))
		this.setState({martdata:temp1})
		this.setState({optionValue:tempOV})
    }

    setSaveItems() {
		let temp = this.state.tempItems.map(m=>m)
        this.setState({saveItems:temp})
    }

    setRecipeRecommendList() {

    }

	showModalBtn(e) {
		let keyword = e.target.dataset.keyword
		let martname = e.target.dataset.martname
		let temp = {}
		this.state.martdata.map((m)=>{
			if(m.keyword===keyword) temp = m
		})
		temp = temp.data[martname]
		this.state.modalItems = {
			keyword:keyword,
			martname:martname,
			data:temp
		}
		this.setState({visible:true})
	}

 	setCheckItems(e) {
    	var itemname = e.target.dataset.name;
    	var itemprice = e.target.dataset.price;
		var productcode = e.target.dataset.code;
	    	
		if (e.target.className=='saveBtn on') {
     		const { tempItems } = this.state;
      		this.setState({
        		tempItems: tempItems.filter((tempItems) => tempItems.name !== itemname)
     		 });
		
    	} else {
			const { tempItems } = this.state;
     		this.setState({
        		tempItems: tempItems.concat({
          			productcode: productcode,
          			name: itemname,
          			price: itemprice,
        		})
      		});
    	}
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
			})
	}

    setMartData() {
		this.setState({martdata:[]})
		this.state.searchKeywordList.map(async(keyword)=>{
			await this.getJSON(keyword)
		})
    }
	
	setIncrement(e) {
		this.setState({test : this.state.test+"1" });
	}
	

    render() {
		const { martdata } = this.state;
        return (
            <section className="ftco-search bg-light">
                <div className="container">
                    <div className="row">
						<SearchBar
                            optionValue={this.state.optionValue} 
                            searchKeywordList={this.state.searchKeywordList}
							addToSearchKeywordList={this.addToSearchKeywordList}
							removeFromSearchKeywordList={this.removeFromSearchKeywordList}
                            setSaveItems={this.setSaveItems} setMartData={this.setMartData}
							setOptionValue={this.setOptionValue}
							test={this.setIncrement}
                        />
						<MartTable martdata={this.state.martdata} showModalBtn={this.showModalBtn} setCheckItems={this.setCheckItems}/>
						{this.state.saveItems.length!=0 ? <SaveItems saveItems={this.state.saveItems} setSaveItems={this.setSaveItems}/> : null }
						{this.state.recipeRecommendList.length!=0 ? <RecipeRecommend /> : null }
						{this.state.visible ? <Modal modalItems={this.state.modalItems}/> : null }
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