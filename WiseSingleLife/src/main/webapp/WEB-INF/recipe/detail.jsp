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
                    <img class="d-block w-100" src="${vo.poster }" alt="First slide"> 
                </div>
                <div class="col-xl-7 col-lg-7 col-md-6">
                    <div>
                        <h2>${vo.title }</h2>
                        <h5 class="recipe_writer">${vo.chef }</h5>
                        <ul class="recipe_info">
                            <li><i class="fas fa-user"></i>${vo.info1 }</li>
                            <li><i class="fas fa-clock"></i>${vo.info2 }</li>
                            <li><i class="fas fa-star"></i>${vo.info3 }</li>
                        </ul>
						<p>${vo.content }</p>
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
								<p><pre class="recipe_desc">${vo.foodmake }</pre></p>
							</div>
						</div>
					</div>
                  </div>
                  
                  <a href="recipe.do" class="btn listBtn">목록으로</a>
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