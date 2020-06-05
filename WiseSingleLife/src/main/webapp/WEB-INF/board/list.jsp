<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- chat CSS -->
<link rel="stylesheet" href="css/chat.css">

</head>
<body>
<!--============================= IMAGE SWIPER =============================-->
    <div>
        <!-- Swiper -->
        <div class="swiper-container">
            <div class="swiper-wrapper">

                <div class="swiper-slide">
                    <a href="images/reserve-slide2.jpg" class="grid image-link">
                        <img src="images/reserve-slide2.jpg" class="img-fluid" alt="#">
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="images/reserve-slide1.jpg" class="grid image-link">
                        <img src="images/reserve-slide1.jpg" class="img-fluid" alt="#">
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="images/reserve-slide3.jpg" class="grid image-link">
                        <img src="images/reserve-slide3.jpg" class="img-fluid" alt="#">
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="images/reserve-slide1.jpg" class="grid image-link">
                        <img src="images/reserve-slide1.jpg" class="img-fluid" alt="#">
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="images/reserve-slide2.jpg" class="grid image-link">
                        <img src="images/reserve-slide2.jpg" class="img-fluid" alt="#">
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="images/reserve-slide3.jpg" class="grid image-link">
                        <img src="images/reserve-slide3.jpg" class="img-fluid" alt="#">
                    </a>
                </div>
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination swiper-pagination-white"></div>
            <!-- Add Arrows -->
            <div class="swiper-button-next swiper-button-white"></div>
            <div class="swiper-button-prev swiper-button-white"></div>
        </div>
    </div>
<!-- end Slider -->    
<section class="board-block light-bg">
  <!--=============== REACT CHAT COMPONENT ===============-->
  <div id="root">
	<p>REACT</p>
  </div>
  <div class="container">
    <div class="row justify-content-center pb-3">
		<div class="col-md-7 heading-section text-center ftco-animate">
		  <h2 class="mb-4">게시판</h2>
		</div>
	</div>
	<div class="py-3">
	  <div class="table-responsive">
	    <table class="table replyBoard reply_list" style="background-color: #FFFFFF;">
	      <thead>
	         <tr>
		        <th scope="col" style="width:7%; color: #212529;" class="text-center">No.</th>
			    <th scope="col" style="width:53%; color: #212529;" class="text-center">제목</th>
			    <th scope="col" style="width:15%; color: #212529;" class="text-center">이름</th>
			    <th scope="col" style="width:15%; color: #212529;" class="text-center">작성일</th>
			    <th scope="col" style="width:10%; color: #212529;" class="text-center">조회수</th>
	         </tr>
	      </thead>
	      <tbody>
	       <c:forEach var="vo" items="${list }">
	         <tr>
	      		<td class="text-center" style="color: #212529;">${vo.no }</td>
	      		<td style="color: #212529;">
	      		  <a href="board_detail.do?no=${vo.no }">${vo.title }<span class="cmtListCount">&nbsp;(${vo.replyCnt })</span></a>
	      		</td>
	      		<td class="text-center" style="color: #212529;">${vo.author }</td>
	      		<td class="text-center" style="color: #212529;">
	      		  <fmt:formatDate value="${vo.regdate }" pattern="yyyy.MM.dd hh:mm"/>
	      		</td>
	      		<td class="text-center" style="color: #212529;">${vo.hit }</td>
	      	 </tr>
	       </c:forEach>
	      </tbody>
	    </table>
	  </div>
	</div>
	<div class="row">
        <div class="col-md-12">
            <div class="inBtn pb-2">
            	<a class="insertBtn" href="board_insert.do">
                            글쓰기
            	</a>
        	</div>
    	</div>
    </div>
  </div>
  <!-- 페이지 들어가야함 -->
  <div class="mt-3">
	  <nav aria-label="...">
		<ul class="pagination justify-content-center">
			<c:if test="${startpage>1 }">
			    <li class="page-item">
			      <a class="page-link" aria-label="Previous" href="../web/board.do?page=${startpage-1 }">
			        <span aria-hidden="true">&laquo;</span>
			        <span class="sr-only">Previous</span>
			      </a>
			    </li>
			</c:if>
			<c:set var="type" value=""/>
			<c:forEach var="i" begin="${startpage }" end="${endpage }">
			  <c:if test="${curpage==i }">
			    <c:set var="type" value="class=\"page-item active\""/>
			  </c:if>
			  <c:if test="${curpage!=i }">
			    <c:set var="type" value="class=page-item"/>
			  </c:if>
			  <li ${type }>
			    <a class="page-link" href="../web/board.do?page=${i }">${i }</a>
			  </li>
			</c:forEach>
			<c:if test="${endpage<allpage }">
			  <li class="page-item">
				<a class="page-link" href="../web/board.do?page=${endpage+1 }" aria-label="Next"> 
				  <span aria-hidden="true">&raquo;</span> 
				  <span class="sr-only">Next</span>
				</a>
			  </li>
			</c:if>
		</ul>
	  </nav>
    </div>
</section>


<!-- import REACT src -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.20.0/vis.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/react/16.13.1/umd/react.production.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.15/lodash.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/react-dom/16.13.1/umd/react-dom.production.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.23/browser.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/7.10.1/polyfill.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> 
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="https://unpkg.com/react-vis/dist/dist.min.js"></script>
<!-- <script src="/socket.io/socket.io.js"></script> -->
<!-- <script src="https://www.unpkg.com/browse/socket.io@2.3.0/"></script> -->
<script src="https://unpkg.com/socket.io-client@2.3.0/dist/socket.io.js"></script>
	
<script type="text/babel">
// chat-server.js에서 만든 socket과 연결
const socket=io.connect('http://211.238.142.193:7777');


// =================================== class App ===================================
class App extends React.Component {
  constructor(props) {
    super(props);
    this.state={
      logs:[] // logs: 채팅문자열. 채팅 로그.
    }
  }
  componentDidMount() {
    socket.on('chat_msg',(obj)=>{ // 서버가 보내준 obj를 받아서 (유저가 새로운 채팅을 입력하면)
      const log2=this.state.logs; // log2에 1) logs(기존에 있던 채팅대화)를 넣고
      log2.push(obj);  // log2에 2) 이번에 유저가 새로 입력한 채팅을 넣고
      this.setState({logs:log2}) // logs(이때까지의 채팅 대화 내역)에 log2('1)기존 대화'+'2)이번에 새로 입력한 채팅')을 넣는다.
    })

    $('div#chat').toggleClass('active');
    var $win = $(window);
    var top = $(window).scrollTop(); // 현재 스크롤바의위치값을 반환합니다.

    /*사용자 설정 값 시작*/
    var speed          = 1000;     // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)
    var easing         = 'linear'; // 따라다니는 방법 기본 두가지 linear, swing
    var $layer         = $('div#chat_container'); // 레이어셀렉팅
    var layerTopOffset = 0;   // 레이어 높이 상한선, 단위:px
    $layer.css('position', 'absolute');
    /*사용자 설정 값 끝*/

    // 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해
    if (top > 0)
      $win.scrollTop(layerTopOffset+top);
    else
      $win.scrollTop(0);

    //스크롤이벤트가 발생하면
    $(window).scroll(function(){
      var yPosition = $win.scrollTop()+600;
      if (yPosition< 0)
      {
        yPosition = $win.scrollTop()+600;
      }
      $layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false});
    });
  }

  render() {
    // return 안에는 for문 들어갈 수 없음 ==> 반복문 하려면 return 밖에서 html 생성해서 그걸 호출해야함. ==> const html=... 해서 호출하자.
   /* const html=this.state.movie.map((m)=>
        <div className="col-md-4">
          <div className="thumbnail">
            <img src={m.poster} alt="Lights" style={{"width": "100%"}}/>
            <div className="caption">
              <p>{m.title}</p>
            </div>
          </div>
        </div>
    )*/
    // [HTML 출력]
    // return 안에는 for문 들어갈 수 없음 ==> 반복문 하려면 return 밖에서 html 생성해서 그걸 호출해야함.
    return (
        <React.Fragment>
          {/*<div className={"row"}>*/}
           {/* {html}*/}
          {/*</div>*/}
          <ChatMain logs={this.state.logs}/>
          {/* App에서 props를 받았는데 ChatMain에서 출력해야함 ==> ChatMain에 props 값 넘겨준다. */}
        </React.Fragment>
    )
  }
}

// =================================== class ChatMain ===================================
class ChatMain extends React.Component{
  render() {
    const html=this.props.logs.map((m)=> // App에서 넘겨준 props로 logs 데이터 받은거 사용.
        <div className={"message right"}>
          <div className={"message-text"}>
            {m.message}
          </div>
        </div>
    )
    return (
        <div id={"chat_container"}>
          <div id={"chat"} className={"active"}>
            <header><h1>Chat</h1></header>
            <section className={"content"}>
              <div className={"message_content"}>
                {html}
              </div>
            </section>
            <ChatForm/>
          </div>
        </div>
    );
  }
}

// =================================== class ChatForm ===================================
class ChatForm extends React.Component{
  constructor(props) {
    super(props);
    this.state={
      message:''
    }
  }
  messageChange(e)
  {
    this.setState({message:e.target.value})
  }
  send(e)
  {
    if (e.key == 'Enter') {
      e.preventDefault(); // 이벤트 동작 정지
      // 메시지 전송
      socket.emit('chat_msg',{  // 엔터 누르면 소켓에 'chat_msg' 전송 ==> chat-server.js에서 '아 얘가 채팅 보냈군!'하고 그에 맞게 동작함
        message:this.state.message
      })
      this.setState({message:''}) // 엔터 누르면 채팅창에 메시지 비운다.
    }
  }
  render(){
    return(
        <form action={""}>
          <input id={"input_chat"} type={"text"}
            onChange={this.messageChange.bind(this)}
            onKeyPress={this.send.bind(this)}
                 value={this.state.message}
          />
        </form>
    )
  }
}


ReactDOM.render(<App />, document.getElementById("root"));
</script>
</body>
</html>