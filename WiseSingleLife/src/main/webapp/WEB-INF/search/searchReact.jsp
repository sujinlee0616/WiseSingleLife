<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>리액트</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/ionicons.min.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    <!-- SEARCH CSS -->
    <link rel="stylesheet" href="css/search.css">
    <link rel="stylesheet" href="css/main.css">
    
    <!-- react vis graph 그릴 CDN -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.20.0/vis.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/react/16.13.1/umd/react.production.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.15/lodash.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/react-dom/16.13.1/umd/react-dom.production.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.23/browser.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/7.10.1/polyfill.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> 
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="https://unpkg.com/react-vis/dist/dist.min.js"></script>
</head>
<body>
    <tiles:insertAttribute name="nav"/>
	<div class="container" id="root"></div>
    <tiles:insertAttribute name="footer"/>
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
  
  <script src="js/scrollax.min.js"></script>
  <!--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>-->
<script src="js/main.js"></script>
<script type="text/babel">
// 본인 서버 port 번호로 변경해야
const URL = 'http://211.238.142.186:8079/web/'

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
				opacity: 0.6
			}
		})
		const em = this.props.martdata.data['em'].map(m=>{
			return {
				x: m.price,
    			y: m.rate,
    			size: m.reviewcount,
    			color: '#ffef3b',
				opacity: 0.6
			}
		})
		const hp = this.props.martdata.data['hp'].map(m=>{
			return {
				x: m.price,
    			y: m.rate/20,
    			size: m.reviewcount,
    			color: '#5465ff',
				opacity: 0.6
			}
		})
		const cp = this.props.martdata.data['cp'].map(m=>{
			return {
				x: m.price,
    			y: m.rate,
    			size: m.reviewcount,
    			color: '#54ff8a',
				opacity: 0.6
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
	      data:temp,
		  onNearestXY: value => this.setState({value})
	    }
		
		return (
			<div className="canvas-wrapper" style={{"position":"relative","left":"50px"}}>
		        <div className="canvas-example-controls">
		        <XYPlot
		          width={850}
		          height={350}
		        >
		          <VerticalGridLines />
		          <HorizontalGridLines />
		          <XAxis tickLabelAngle={-30}/>
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
								<a href={"detail.do?productcode="+this.props.modalItems.productcode+"&codeno="+this.props.modalItems.codeno}>
									<img className="product_img" src={m.img}/>
								</a>
							</div>
						<div className="text mt-3 d-block">
						<a href={"detail.do?productcode="+this.props.modalItems.productcode+"&codeno="+this.props.modalItems.codeno}>
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
	constructor(props) {
		super(props)
		this.state = {
			count : 4
		}
		this.countIncrement=this.countIncrement.bind(this)
	}

	countIncrement() {
		this.setState({count:this.state.count+4})
	}

  render() {
	const html = this.props.list.slice(0,this.state.count).map(m=>
			<div className="item">
              <div className="img">
                <a href={"recipe_detail.do?no="+m.no}>
                  <img
                    className="product_img"
                    src={m.poster}
                  />
                </a>
              </div>
              <a href={"recipe_detail.do?no="+m.no}>
                <p className="product">{m.title}</p>
                <p className="price mb-0">{m.mname}</p>
              </a>
            </div>
	)

    return (
      <div className="row">
        <div className="saved my-5">
          <div className="title">
            <h5 className="saved_title">추천 레시피</h5>
          </div>
          <div className="savedItemArea">
            {html}
          </div>
			<div className="text-right">
				{ this.state.count>this.props.list.length ? null : <h6 className="btn btn-sm" onClick={this.countIncrement}><font color="white">+ 더 보기({this.state.count}/{this.props.list.length})&nbsp;&nbsp;</font></h6> }
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
      <div className="row mb-0">
        <div className="saved mt-5">
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
	const pcode = this.props.item.productcode
	console.log(pcode)
    return (
      <div className="list_item">
        <div className="img">
          <a href={"detail.do?productcode="+this.props.item.productcode+"&codeno="+this.props.item.codeno}>
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
          <a href={"detail.do?productcode="+this.props.item.productcode+"&codeno="+this.props.item.codeno}>
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
			<td colSpan="4">
				<span style={{"position":"relative","top":"20px","left":"20px"}}>평점</span>
				<span style={{"position":"relative","left":"880px","top":"335px"}}>가격</span>
				<span style={{"position":"relative","left":"30px","color":"#ff5145"}}>●&nbsp;<font color="black">롯데마트</font></span>
				<span style={{"position":"relative","left":"220px","color":"#ffef3b"}}>●&nbsp;<font color="black">이마트</font></span>
				<span style={{"position":"relative","left":"405px","color":"#5465ff"}}>●&nbsp;<font color="black">홈플러스</font></span>
				<span style={{"position":"relative","left":"595px","color":"#54ff8a"}}>●&nbsp;<font color="black">쿠팡</font></span>
				<Graph martdata={this.props.kw_data}/>
			</td>
		</tr>
		</tbody>
    );
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
            <section className="list-section mb-3">
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
							{JSON.stringify(martdata)}
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
		let size = (5-this.props.searchKeywordList.length)*60+"px"
		var acc
		var result
		var accum = new Array();
		var leng
		this.props.searchKeywordList.map( (m) =>{
								leng = m.length		
								accum.push(leng)
						})
		console.log(leng)
	 	console.log("누산기")	
		result = accum.reduce((acc, cur, i) => {
  			console.log(acc, cur, i);
  			return acc + cur;
		}, 0);

		console.log(result)
		let size2 = 350-(result*25)+"px"


        return (
            <section className="ftco-search">
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
													style={{"width": size2}}
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
		console.log(temp)
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
		const wordlist = encodeURIComponent(JSON.stringify(this.state.searchKeywordList));
		const wordlist2 = this.state.searchKeywordList
		let wordlist3 = JSON.stringify(this.state.searchKeywordList);
		
		axios.get(URL+'searchtest_insert.do',{
		params : {keyword: wordlist}
			});

		axios.get(URL+'jhsRecommend.do',{
			params :  {keyword: wordlist}
		}).then((res)=>{
			this.setState({recipeRecommendList:res.data})
		});
		
    }
	
	setIncrement(e) {
		this.setState({test : this.state.test+"1" });
	}
	componentDidMount() {
        var keyword = ""
		console.log('keyword')
		console.log('${keyword}')	
    	if( '${keyword}'==='null'){
			
			console.log('"empty String')
		}else {
			console.log('set keyword')
			keyword='${keyword}'
			this.addToSearchKeywordList(keyword);
		}
	}

    render() {
		const { searchKeywordList } = this.state;
        return (
        	  <div>
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
						{this.state.recipeRecommendList.length!=0 ? <RecipeRecommend list={this.state.recipeRecommendList}/> : null }
						{this.state.visible ? <Modal modalItems={this.state.modalItems}/> : null }
          	</div>
        );
    }
}

ReactDOM.render(<App />, document.getElementById("root"));
</script>
  
</body>
	<!-- <script type="text/babel" src="js/search_list_react.js"></script> -->
</html>