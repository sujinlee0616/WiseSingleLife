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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.20.0/vis.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react-dom.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.23/browser.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> 
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <!-- ================================ NAVBAR ================================ -->
    <tiles:insertAttribute name="nav"/>
    <!-- END nav -->
	<div class="container" id="root"></div>
<!--      ================================== FILTERS AND SAVE BTN==================================	
 -->	<!-- <section class="ftco-search bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-12 search-wrap">
					<h2 class="heading h5 d-flex align-items-center pr-4"><span class="ion-ios-search mr-3"></span>상세검색</h2>
					<form action="#" class="search-property">
						<div class="row">
							<div class="col-md-2 pl-0">
								<div class="form-group">
									 <label for="#">정렬</label>
									<div class="form-field">
										<div class="select-wrap">
											<div class="icon"><span class="ion-ios-arrow-down"></span></div>
											<select name="" id="" class="form-control">
                                                <option value="pop">인기랭킹순</option>
												<option value="asc">가격낮은순</option>
												<option value="desc">가격높은순</option>
											</select>
										</div>
									</div>
 								</div> 	
							</div>
								<input class="img_slider_search" name="keyword" type="search" placeholder="검색어를 입력하세요.">
								<button class="sliderBtn">검색</button>
							<div class="col-md-2 align-self-end">
								<div class="form-group">
									<div class="form-field">
										<input type="submit" value="저장" class="form-control btn btn-primary">
									</div>
								</div>
							</div>
							
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
    
    ================================== CONTENTS==================================	    
    <section class="list-section mb-3 bg-light">
    	<div class="container">
			결과
			<div class="row">
				<table class="result">
					<tr class="mall_list">
						<td class="default">쇼핑몰 이름</td>
						<td class="td1">이마트</td>
						<td class="td2">롯데마트</td>
						<td class="td3">홈플러스</td>
						<td class="td4">쿠팡</td>
					</tr>
					============================== ITEM1 ==============================
					############################## Emart ROW ##########################
					<tr class="mall_result" id="product1">
						<td rowspan="2" class="product_name">바나나 우유</td>
						=============== 1.이마트 ===============
						<td class="emart">
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shopping-phinf.pstatic.net/main_2285035/22850351426.20200513172849.jpg?type=f300">
									</a>
								</div>
								<div class="info">
									<a href="#">
										<p class="product">매일유업 매일 바나나는 원래 하얗다 190ml</p>
										<p class="price">10,910원</p>
									</a>
								</div>
							</div>
							더보기 버튼: 컨텐츠가 3개 초과일 경우
							<button type="button" class="btn btn-block" id="">+ 더 보기</button>
							<button type="button" class="btn btn-block moreBtn" data-toggle="modal" data-target="#moreBtn">+ 더 보기</button>
						</td>
						=============== 2.롯데마트 ===============
						############################## Lotte ROW ##########################
						<td class="lotte">
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shop-phinf.pstatic.net/20200210_1/1581298075142K9f83_JPEG/18658813766617391_17493234.jpg?type=m510">
									</a>
								</div>
								<div class="info">
									<a href="#">
										<p class="product">매일유업 매일 바나나는 원래 하얗다 190ml</p>
										<p class="price">10,910원</p>
									</a>
								</div>
							</div>
						</td>
						=============== 3.홈플러스 ===============
						############################## HomePlust ROW ##########################
						<td class="homeplus">
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shop-phinf.pstatic.net/20200210_1/1581298075142K9f83_JPEG/18658813766617391_17493234.jpg?type=m510">
									</a>
								</div>
								<div class="info">
									<a href="#">
										<p class="product">매일유업 매일 바나나는 원래 하얗다 190ml</p>
										<p class="price">10,910원</p>
									</a>
								</div>
							</div>
						</td>
						=============== 4.쿠팡===============
						############################## Coupang ROW ##########################
						<td class="coupang">
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shop-phinf.pstatic.net/20200210_1/1581298075142K9f83_JPEG/18658813766617391_17493234.jpg?type=m510">
									</a>
								</div>
								<div class="info">
									<a href="#">
										<p class="product">매일유업 매일 바나나는 원래 하얗다 190ml</p>
										<p class="price">10,910원</p>
									</a>
								</div>
							</div>
						</td>
					</tr>
					============================== ITEM1 GRAPH ==============================
					<tr class="mall_result" id="graph1">
						<td class="graph_left"></td>
						<td colspan="4" class="graph_area"><img src="images/graph.png" style="width: 85%;"></td>
					</tr>
					============================== ITEM2 ==============================
					<tr class="mall_result" id="product1">
						<td rowspan="2" class="product_name">삼양 까르보 불닭볶음면</td>
						<td class="emart">
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shopping-phinf.pstatic.net/main_1304626/13046260762.20171221101956.jpg?type=f300">
									</a>
								</div>
								<div class="info">		
									<a href="#">
										<p class="product">삼양 까르보 불닭볶음면 130g</p>
										<p class="price">950원</p>
									</a>
								</div>
							</div>
						</td>
						<td class="lotte">
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shop-phinf.pstatic.net/20180912_218/syfood_153671034462456YVN_JPEG/19429203347270209_1392560495.jpg?type=m510">
									</a>
								</div>
								<div class="info">
									<a href="#">
										<p class="product">삼양 까르보불닭볶음면 큰컵 105gx16입</p>
										<p class="price">16,800원</p>
									</a>
								</div>
							</div>
						</td>
						<td class="homeplus">
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shop-phinf.pstatic.net/20200210_1/1581298075142K9f83_JPEG/18658813766617391_17493234.jpg?type=m510">
									</a>
								</div>
								<div class="info">
									<a href="#">
										<p class="product">매일유업 매일 바나나는 원래 하얗다 190ml</p>
										<p class="price">10,910원</p>
									</a>
								</div>
							</div>
						</td>
						<td class="coupang">
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shop-phinf.pstatic.net/20200210_1/1581298075142K9f83_JPEG/18658813766617391_17493234.jpg?type=m510">
									</a>
								</div>
								<div class="info">
									<a href="#">
										<p class="product">매일유업 매일 바나나는 원래 하얗다 190ml</p>
										<p class="price">10,910원</p>
									</a>
								</div>
							</div>
						</td>
					</tr>
					============================== ITEM2 GRAPH ==============================
					<tr class="mall_result" id="graph1">
						<td class="graph_left"></td>
						<td colspan="4" class="graph_area"><img src="images/graph.png" style="width: 85%;"></td>
					</tr>
				</table>
			</div>
			저장한 상품
			<div class="row">
				<div class="saved">
					<h5 class="saved_title">저장한 상품</h5>
				</div>
			</div>

			============================== 더보기 MODAL ==============================
			<div class="modal fade" id="moreBtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
				  <div class="modal-content">
					<div class="modal-header">
					  <h5 class="mb-0">[이마트] 바나나우유 전체보기</h5>
					  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					  </button>
					</div>
					<div class="modal-body">
						<section class="ftco-section py-2">
							<div class="container">
							<div class="row d-flex">
							  ========== Start of Modal Item ==========
							  MODAL ITEM 1
							  <div class="col-md-3 d-flex ftco-animate">
								<div class="blog-entry align-self-stretch">
								  <div class="img">
									<a href="#">
										<img class="product_img" src="https://shop-phinf.pstatic.net/20200210_1/1581298075142K9f83_JPEG/18658813766617391_17493234.jpg?type=m510">
									</a>
								  </div>
								  <div class="text mt-3 d-block">
									<a href="#">
										<p class="product">매일유업 매일 소화가 잘되는 우유 바나나 190ml</p>
										<p class="price">19,900원</p>
									</a>
								  </div>
								</div>
							  </div>
							  ========== End of Modal Item ==========
							</div>
							</div>
						</section>

					</div>
					<div class="modal-footer">
					  <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				  </div>
				</div>
			</div>

			

    	</div>
    </section> -->


    <!-- ================================== FOOTER ================================== -->
    <tiles:insertAttribute name="footer"/>

  <!-- loader -->
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
<!--   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
 -->  <script src="js/main.js"></script>
  <script type="text/babel">
 
class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      coupang: [],
      emart: [],
      homeplus: [],
      lottemart: [],
      keyword: "",
      search_options: ""
    };
    this.onUserInput2 = this.onUserInput2.bind(this);
  }

  onUserInput2(keyword) {
    axios.get("http://localhost:8080/web/hp/search.do", {
      params: {
        keyword: keyword
      }.then(function(result) {
        this.setState({ homeplus: result.data });
      })
    });

    this.setState({ keyword: keyword });
  }

  componentDidMount() {
    var keyset = "${keyword}";
    axios
      .get("http://localhost:8081/web/searchrest.do", {
        params: { keyword: keyset }
      })
      .then(result => {
        console.log(result.data.hp);
        this.setState({ coupang: result.data.cp });
        this.setState({ emart: result.data.em });
        this.setState({ homeplus: result.data.hp });
        this.setState({ lottemart: result.data.lm });
        this.setState({ keyword: keyset });
      });
  }
  render() {
    return (
	<section className="ftco-search bg-light">
		<div className="container">
	      <div className="row">
	        <SearchOptions />
	        <MartTable
	          homeplus={this.state.homeplus}
	          emart={this.state.emart}
	          coupang={this.state.coupang}
	          lottemart={this.state.lottemart}
	          keyword={this.state.keyword} 
	        /> 
	
	      </div>
		</div>
		</section>
    );
  }
}

class MartTable extends React.Component {
  render() {
    let crows = [];
    let erows = [];
    let hrows = [];
    let lrows = [];

	crows = this.props.coupang.map(column => <CoupangRow coupang={column}  />);
 	erows = this.props.emart.map(column => <EmartRow emart={column}  />);
   	hrows = this.props.homeplus.map(column => <HomeplusRow homeplus={column} />);
   	lrows = this.props.lottemart.map(column => <LottemartRow lottemart={column} />);

    return (
	 <section className="list-section mb-3 bg-light">
        <div className="container">
          결과
          <div className="row">
            <table className="result">
              <tr className="mall_list">
                <td className="default">쇼핑몰 이름</td>
                <td className="td1">이마트</td>
                <td className="td2">롯데마트</td>
                <td className="td3">홈플러스</td>
                <td className="td4">쿠팡</td>
              </tr>
              <tr className="mall_result" id="product1">
                <td rowspan="2" className="product_name">
                  {this.props.keyword}
                </td>
                <td className="coupang">
					{crows.slice(0,3)}
			        <button
			          type="button"
			          className="btn btn-block moreBtn"
			          data-toggle="modal"
			          data-target="#moreBtn"
			        >
			          + 더 보기
			        </button>
                </td>
				 <td className="emart">
					{erows.slice(0,3)}
					<button
			          type="button"
			          className="btn btn-block moreBtn"
			          data-toggle="modal"
			          data-target="#moreBtn" 
			        >
			          + 더 보기
			        </button>
				 </td>
  				<td className="homeplus">
                	{hrows.slice(0,3)}
                	<button
			          type="button"
			          className="btn btn-block moreBtn"
			          data-toggle="modal"
			          data-target="#moreBtn"
			        >
			          + 더 보기
			        </button>
                </td>
 				<td className="lottemart">
					{lrows.slice(0,3)}
					<button
			          type="button"
			          className="btn btn-block moreBtn"
			          data-toggle="modal"
			          data-target="#moreBtn"
			        >
			          + 더 보기
			        </button>
				</td>
              </tr>
            </table>
          </div>
        </div>
      </section>
	);
  }
}
class SearchBar extends React.Component {
  constructor(props) {
    super(props);
    // / /이벤트 등록

    this.onClick = this.onClick.bind(this);
    // / /this.onUserInput = this.onUserInput.bind(this)
  }
  onClick(e) {
    var elem = document.getElementById("keyword").value;
    var temp = elem;
    console.log(temp);
    this.props.onUserInput(elem.value);
  }
  render() {
    return (
      <div className="slider_search_area">
        <input
          className="img_slider_search"
          type="search"
          placeholder="리액트 검색어를 입력하세요."
          id="keyword"
        />
        <button className="sliderBtn" onclick="onClick">
          검색
        </button>
      </div>
    );
  }
}
class SearchOptions extends React.Component {
  constructor(props) {
    super(props);

    this.onSelect = this.onSelect.bind(this);
  }
  onSelect(e) {
    var selectOption = document.getElementById("searchlist");
    selectOption = selectOption.options[selectOption.selectedIndex].value;
    console.log(selectOption);
    this.props.onUserSelectOptions(e.target.value);
  }
  render() {
    return (
      <section className="ftco-search bg-light">
        <div className="container">
          <div className="row">
            <div className="col-md-12 search-wrap">
              <h2 className="heading h5 d-flex align-items-center pr-4">
                <span className="ion-ios-search mr-3" />
                상세검색
              </h2>
              <form action="#" className="search-property">
                <div className="row">
                  <div className="col-md-2 pl-0">
                    <div className="form-group">
                      <div className="form-field">
                        <div className="select-wrap">
                          <div className="icon">
                            <span className="ion-ios-arrow-down" />
                          </div>
                          <select
                            name="seachlist"
                            id="searchlist"
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
                  <input
                    className="img_slider_search"
                    name="keyword"
                    type="search"
                    placeholder="검색어를 입력하세요."
                  />
                  <button className="sliderBtn">검색</button>
                  <div className="col-md-2 align-self-end">
                    <div className="form-group">
                      <div className="form-field">
                        <input
                          type="submit"
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

class CoupangRow extends React.Component {
  render() {
    return (
       <div className="list_item">
          <div className="img">
            <a href="main/detail.do">
              <img
                className="product_img"
                alt="coupang"
                src={this.props.coupang.img}
              />
            </a>
          </div>
          <div className="info">
            <a href="main/detail.do">
              <p className="product">{this.props.coupang.name}</p>
              <p className="price">{this.props.coupang.baseprice}</p>
            </a>
          </div>
        </div>
    );
  }
}

class EmartRow extends React.Component {
  render() {
    return (
       <div className="list_item">
          <div className="img">
            <a href="main/detail.do">
              <img
                className="product_img"
                alt="emart"
                src={this.props.emart.img}
              />
            </a>
          </div>
          <div className="info">
            <a href="main/detail.do">
              <p className="product">{this.props.emart.name}</p>
              <p className="price">{this.props.emart.price}</p>
            </a>
          </div>
        </div>
    );
  }
}

class HomeplusRow extends React.Component {
  render() {
    return (
        <div className="list_item">
          <div className="img">
            <a href="main/detail.do">
              <img
                className="product_img"
                alt="homeplus"
                src={this.props.homeplus.img}
              />
            </a>
          </div>
          <div className="info">
            <a href="main/detail.do">
              <p className="product">{this.props.homeplus.name}</p>
              <p className="price">{this.props.homeplus.price}</p>
            </a>
          </div>
        </div>
    );
  }
}
	
class LottemartRow extends React.Component {
  render() {
    return (
        <div className="list_item">
          <div className="img">
            <a href="main/detail.do">
              <img
                className="product_img"
                alt="lottemart"
                src={this.props.lottemart.img}
              />
            </a>
          </div>
          <div className="info">
            <a href="main/detail.do">
              <p className="product">{this.props.lottemart.name}</p>
              <p className="price">{this.props.lottemart.price}</p>
            </a>
          </div>
        </div>

      );
  }
}
ReactDOM.render(<App />, document.getElementById("root"));

</script>
  
</body>
	<!-- <script type="text/babel" src="js/search_list_react.js"></script> -->
</html>