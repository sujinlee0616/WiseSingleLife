<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<!-- Basic -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/recipe_detail.css">
</head>

<body>
    
    <!-- ================================ NAVBAR ================================ -->
    <tiles:insertAttribute name="nav"/>
    <!-- END nav -->

    <!-- ================================ Start of recipe detail ================================ -->
    <div class="shop-detail-box-main">
        <div class="container">
            <div class="row">
                <div class="col-xl-5 col-lg-5 col-md-6">
                    <img class="d-block w-100" src="images/recipe_detail_thumb.jpg" alt="First slide"> 
                </div>
                <div class="col-xl-7 col-lg-7 col-md-6">
                    <div>
                        <h2>밥도둑 반찬 고추장 달걀조림 만들기!TV 알토란 레시피</h2>
                        <h2>${vo.title }</h2>
                        <h5 class="recipe_writer">레시피 공유자: 뽀유TV</h5>
                        <ul class="recipe_info">
                            <li><i class="fas fa-user"></i>3인분</li>
                            <li><i class="fas fa-clock"></i>20분 이내</li>
                            <li><i class="fas fa-star"></i>아무나</li>
                        </ul>
						<p>평소 간장을 베이스로 한 계란장조림을 만들어 먹는 편인데요. TV알토란에서 고추장을 베이스로 계란 장조림을 만들길래 저도 만들어 봤는데 우왕! 진짜 맛있어요. 뜨끈한 밥에 비벼 먹으니 밥도둑이 따로 없네요^^</p>
						<div class="add-to-btn">
							<div class="share-bar">
								<a class="btn hvr-hover" href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a>
								<a class="btn hvr-hover" href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a>
							</div>
						</div>
                    </div>
                </div>
            </div>
            
            <!-- ================================== 레시피 ================================== -->
			<div class="row recipe_area mt-5">
				<div class="card card-outline-secondary my-4">
					<div class="card-header">
						<h5 class="recipe_header mb-0">레시피</h5>
					</div>
					<div class="card-body">
						<div class="media mb-3">
							<div class="media-body">
								<p><pre class="recipe_desc">먼저 물에 소금1T,식초1T를 섞어 달걀을 7-8분 반숙으로 삶아 줍니다.
달걀이 삶아지는 동안 양파는 굵게 채 썰고 청양고추도 큼직큼직 썰어주셔요
달걀이 삶아지면 얼음물에 바로 행궈 껍질을 깔끔히 잘 벗겨 줍니다.
참기름과 깨를 제외한 모든 양념을 한곳에 미리 섞어주셔요.
평소 단 것 싫으시면 설탕, 물엿은 조금 줄이셔도 됩니다

냄비에 멸치육수를 넣고 양념을 잘 풀어 주신뒤 끓여줍니다.
양념이 끓기 시작하면 양파와 청양고추를 넣고 끓여줍니다.
양념이 반정도 졸아들었다 싶을때 반숙달걀을 투하 해줍니다.이대로 약 2분정도 더 끓여주시면서 달걀에 색이 입혀지게 국물을 끼얹어 주세요
마지막으로 참기름 2T와 깨1T를 넣고 잘섞어주시고 쪽파를 고명으로 올려주시면 끝!
밥도둑 반찬 알토란 임성근님의 고추장 달걀조림 완성입니다^^
한번 먹어보니 촉촉한 반숙달걀에 매콤달콤 양념이 어우려져 넘 맛있네요.꼭 떡볶이 양념같은게 은근 중독성 있고 정말 짱짱짱!뜨끈한 밥에 비벼 먹으면 밥 한공기 뚝딱 하게 됩니다^^
                                </pre></p>
							</div>
						</div>
					</div>
                  </div>
                  
                  <a href="#" class="btn listBtn">목록으로</a>
            </div>            
           

        </div>
    </div>
    <!-- End of recipe detail -->


    <!-- ================================== FOOTER ================================== -->
    <tiles:insertAttribute name="footer"/>
    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

    <!-- ALL JS FILES -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/jquery.superslides.min.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script src="js/inewsticker.js"></script>
    <script src="js/bootsnav.js."></script>
    <script src="js/images-loded.min.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/baguetteBox.min.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/custom.js"></script>
</body>

</html>