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
<script type="text/babel">
class App extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            martdata:[],
            keyword:[],
            //pop, asc, desc
            optionValue: "",
            //검색어 리스트 
            searchKeywordList : [],
            //저장된 상품  [ { }, { },]
            saveItems:[],
            tempItems:[],
            //추천레시피
            recipeRecommendList:[]
        };
        // 정렬 옵션 추가 
        this.setOptionValue = this.setOptionValue.bind(this);
        this.setKeywordList = this.setKeywordList.bind(this);
        this.setSaveItems = this.setSaveItems.bind(this);
        this.setRecipeRecommendList  = this.setRecipeRecommendList.bind(this);
    }

    //정렬 옵션 선택
    setOptionValue (){
        this.setState({optionValue:e.target.value});
    }

    setKeywordList() {
        this.setState({keyword:e.target.value});
    }

    setSaveItems (){
        this.setState({saveItems:})
    }
    setRecipeRecommendList () {

    }

    setKeywordList() {
        axios.get("http://localhost:8080/web/hp/search.do", {
            params: {
                keyword: keyword
            }.then(function(result) {
                const temp = { keyword:keyset, data:result.data};
                this.setstate({martdata:temp});
            })
        });
    }



    //처음 첫 검색어에 대한 state 생성
    componentDidMount() {
        var keyset = "${keyword}";
        axios
            .get("http://localhost:8081/web/searchrest.do", {
                params: { keyword: keyset }
            })
            .then(result => {
                //keyword : [ 시금치, 초코볼, 햇반 ]
                // data : object (object= value}
                //martdata : [ {keyword:시금치 , data: {hp:[],lm:[], cp:[],em:[]} ]
                //
                this.setState({keyword:keyset});
                //this.setState({martdata:result.data});
                const temp = { keyword:keyset, data:result.data};
                this.setstate({martdata:temp});
            });
    }
    render() {
        return (
            <section className="ftco-search bg-light">
                <div className="container">
                    <div className="row">
                        <SearchBar setKeywordList={this.state.keyword} optionValue={this.state.optionValue} save={}/>
                        <MartTable
                            rows = {this.state.martdata}
                        />
                        <Modal setKeywordList={this.state.keyword} mart={this.state.martdata.data.}/>
                        <SaveItems />
                        <RecipeRecommend />
                    </div>
                </div>
            </section>
        );
    }
}

class SaveItems extends React.Component {

    //아이템 삭제 이벤트
    rener() {
        return (
            <div className="row">
                <div className="saved">
                    <div className="title">
                        <h5 className="saved_title">저장한 상품</h5>
                    </div>
                    <div className="savedItemArea">

                        <div className="item">
                            <a href="#">
                                <p className="product">매일 소화가 잘되는 우유 바나나 190ml</p>
                                <p className="price mb-0">19,900원</p>
                            </a>
                        </div>

                        <div className="item">
                            <a href="#">
                                <p className="product">바나나맛 우유(240ml4개) 960ml</p>
                                <p className="price mb-0">4,580 원</p>
                            </a>
                        </div>

                        <div className="item">
                            <a href="#">
                                <p className="product">삼양 큰컵 까르보 불닭볶음면 105g</p>
                                <p className="price mb-0">15,680원</p>
                            </a>
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
                                    <img className="product_img"
                                         src="https://recipe1.ezmember.co.kr/cache/recipe/2015/09/21/8120c5f993593892442603f5e246eb671.jpg"/>
                                </a>
                            </div>
                            <a href="#">
                                <p className="product">까르보나라 떡볶이</p>
                                <p className="price mb-0">떡볶이,까르보나라</p>
                            </a>
                        </div>
                         <div className="item">
                            <div className="img">
                                <a href="#">
                                    <img className="product_img"
                                         src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F2038593F502C347533"/>
                                </a>
                            </div>
                            <a href="#">
                                <p className="product">든든한 영양 음료!! 바나나 미숫가루</p>
                                <p className="price mb-0">바나나,</p>
                            </a>
                        </div>
                        <!-- SAVED ITEM 3 -->
                        <div className="item">
                            <div className="img">
                                <a href="#">
                                    <img className="product_img"
                                         src="https://recipe1.ezmember.co.kr/cache/recipe/2018/01/31/755216f43214f5ef82bfdcb05d934d311.png"/>
                                </a>
                            </div>
                            <a href="#">
                                <p className="product">불닭 까르보나라의 떡볶이 Ver. 매까떡!</p>
                                <p className="price mb-0">까르보나라 불닭볶음면</p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        )
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
                        <MartRow />
                    </div>
                </div>
            </section>
        );
    }
}

class MartRow extends React.Component {
    constructor(props) {
        super(props);
    }

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
            <table className="result">
                <tr className="mall_list">
                    <td className="default">쇼핑몰 이름</td>
                    <td className="td1">이마트</td>
                    <td className="td2">롯데마트</td>
                    <td className="td3">홈플러스</td>
                    <td className="td4">쿠팡</td>
                </tr>
                <tr className="mall_result" id="product1">
                    <td rowSpan="2" className="product_name">
                        {this.props.keyword}
                    </td>
                    <td className="coupang">
                        {crows.slice(0, 3)}
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
                        {erows.slice(0, 3)}
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
                        {hrows.slice(0, 3)}
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
                        {lrows.slice(0, 3)}
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
        )
    }
}
class Modal extends React.Component {
    render(){
        return (
            <div className="modal fade" id="moreBtn" tabIndex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div className="modal-dialog modal-lg" role="document">
                    <div className="modal-content">
                        <div className="modal-header">
                            <h5 className="mb-0">[이마트] 바나나우유 전체보기</h5>
                            <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div className="modal-body">
                            <section className="ftco-section py-2">
                                <div className="container">
                                    <div className="row d-flex">
                                        <div className="col-md-3 d-flex ftco-animate">
                                            <div className="blog-entry align-self-stretch">
                                                <div className="img">
                                                    <a href="#">
                                                        <img className="product_img"
                                                             src="https://shop-phinf.pstatic.net/20200210_1/1581298075142K9f83_JPEG/18658813766617391_17493234.jpg?type=m510"/>
                                                    </a>
                                                </div>
                                                <div className="text mt-3 d-block">
                                                    <a href="#">
                                                        <p className="product">매일유업 매일 소화가 잘되는 우유 바나나 190ml</p>
                                                        <p className="price">19,900원</p>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

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
        )
    }
}

class SearchBar extends React.Component {
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
                                    <button className="sliderBtn" onClick={this.state}>검색</button>
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

class Items extends React.Component {

    //오른쪽 상단 버튼 이벤트
    onCheckItems(e){
        this.setState({tempItems:})
    }
    render(){
        return (
            <React.Fragment>
            <div className="img" onClick={this.onCheckItems}>
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
            </React.Fragment>
        )
    }
}

class CoupangRow extends React.Component {
    render() {
        return (
            <div className="list_item">
                <Item image={} name={} price{}/>
            </div>
        );
    }
}

class EmartRow extends React.Component {
    render() {
        return (
            <div className="list_item">
                <Item image={} name={} price={}/>
            </div>
        );
    }
}

class HomeplusRow extends React.Component {
    render() {
        return (
            <div className="list_item">
                <Item image={} name={} price={}/>
            </div>
        );
    }
}

class LottemartRow extends React.Component {
    render() {
        return (
            <div className="list_item">
                <Item image={} name={} price={}/>
            </div>

        );
    }
}


class SaveItems extends React.Component{
    render(){
        const savedItems = this.state.saveItems.map((m)=>{
            <div className="item">
                <a href="#">
                    <p className="product">{m.name}</p>
                    <p className="price mb-0">{m.price}</p>
                </a>
            </div>

        })

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
        )
    }
}
/*class SearchBar extends React.Component {
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
}*/
ReactDOM.render(<App />, document.getElementById("root"));
</script>
</body>
</html>