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
            keyword:'',
            //pop, asc, desc
            optionValue: "",
            //검색어 리스트 
            searchKeywordList : [],
            //저장된 상품  [ { }, { },]
            saveItems:[],
            tempItems:[{
                no: "",
                name:"",
                price:"",
            }],
            //추천레시피
            recipeRecommendList:[]
        };
        // 정렬 옵션 추가 
        this.setOptionValue = this.setOptionValue.bind(this);
        this.setKeywordList = this.setKeywordList.bind(this);
        this.setSaveItems = this.setSaveItems.bind(this);
        this.setRecipeRecommendList  = this.setRecipeRecommendList.bind(this);
		
		// 검색 버튼 클릭 시 호출. state의 keywordList를 읽어서 axios 날아감. 가져온 데이터를 martdata에 setState.
		this.setMartData  = this.setMartData.bind(this);

        // 검색 input창 onKeyPress일 때 enter인지 체크해서 맞으면 e.target.value를 keywordList에 추가.
		this.setKeyword = this.setKeyword.bind(this);

		// 키워드의 X 버튼 클릭 시 e.target.value로 값을 읽어서 searchKeywordList에서 그 값을 삭제.(setState)
        //함수 작성 필요.
        
        //아이템 체크한 아이템 리스트 반환하는 함수
        this.onCheckItems = this.onCheckItems.bind(this);
    }

    // 정렬 옵션 선택. select 태그 변화 시 호출. 전체 데이터가 정렬됨.
	// pop : 인기순(랭크순), desc : 가격 높은 순, asc : 가격 낮은 순
    setOptionValue (e){
        this.setState({optionValue:e.target.value});
    }

    setSaveItems (e){
        this.setState({saveItems:e.target.value})
    }

    setRecipeRecommendList () {

    }

	// 검색 버튼 클릭 시 호출. state.keyword 읽고 axios 날려서 가져온 값을 martdata에 채움. 그리고 keywordList에 추가.
    setMardData() {
        
    }

    onCheckItems(e){
        var clsname = e.target.className;
        //props로 
        var itemname = document.getElementsByClassName("product");
        var itemprice = document.getElementsByClassName("price ");
        if(clsname="saveBtn on"){
            e.taget.className = "saveBtn"
            const {tempItems} = this.state;
            this.setstate({
                tempItems: tempItems.filter(tempItems=> tempItems.name !== itemname)
            })
        }else{
            const {tempItems} = this.state;
            e.target.className = "saveBtn on"
            this.setState({
                tempItems: tempItems.concat({no:this.no++, name:itemname, price:itemprice})
            })

        }
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
                        <SaveItems saveItems={this.state.saveItems}/>
                        <RecipeRecommend recipeRecommendList={this.state.recipeRecommendList}/>
                        <Modal />
                    </div>
                </div>
            </section>
        );
    }
}
class MartTable extends React.Component {
    constructor() {
        super();

        this.state = {
            martRows : this.props.martdata.map((m)=>
                    <MartRow kw_data={m}
                />)
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

class MartRow extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            kw_data : this.props.kw_data.map((m,key)=>
                <ItemList martname={m}/>
            )
        }
   }
    render() {

        return (
                <tr className="mall_result" id="product1">
                    <td rowSpan="2" className="product_name">
                        {this.props.kw_data.keyword}
                    </td>
                    {this.state.kw_data}
                 </tr>
        )
    }
}

class ItemList extends React.Component{
    //마트별 아이템들의 리스트를 받아야 한다.
    constructor() {
        super();

        this.state = {
            martname : this.props.martname.map((m)=>
                    <Item item={m}
                />)
        }
    }
    
    render(){
        return (
            <td className={this.props.martname}>
                {this.state.martname}
            <button
            type="button"
            className="btn btn-block moreBtn"
            data-toggle="modal"
            data-target="#moreBtn"
             >
            + 더 보기
            </button>
            </td>
        )
    }
}
class Item extends React.Component {

    //오른쪽 상단 버튼 이벤트
    render(){
        return (
            <div className="list_item">
                <div className="img" onClick={(e)=>{onCheckItems(e)}} data-code={this.props.item.productcode}
                data-name={this.props.item.name} data-price={this.props.item.price}
                >
                    <a href="main/detail.do">
                        <img
                            className="product_img"
                            alt="{this.props."
                            src={this.props.item.img}
                        />
                    </a>
                    <button type="button" className="saveBtn on" onClick={onCheckItems}></button>
                </div>
                <div className="info">
                    <a href="main/detail.do">
                        <p className="product">{this.props.item.name}</p>
                        <p className="price">{this.props.item.price}</p>
                    </a>
                </div>
            </div>
        )
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
                    </div>
                </div>
            </div>
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


/* class CoupangRow extends React.Component {
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
} */


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