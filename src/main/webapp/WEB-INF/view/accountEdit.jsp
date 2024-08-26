<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<title>Trang Người Dùng</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<%@include file="common/taglib.jsp"%>

<link href="/css/account2.css" rel="stylesheet">
<link rel="stylesheet" href="/css/register3.css">
<link rel="stylesheet" href="/css/accountEdit.css">


<style>
.box-input__main1:focus+label, .box-input__main1:not(:placeholder-shown)+label
	{
	top: -20px;
	left: 10px;
	color: #007bff;
	font-size: 12px;
}
</style>

</head>
<body>
	<%@include file="common/menu.jsp"%>

	<div class="container"
		style="margin-top: 100px; max-width: 92% !important;">
		<c:forEach var="user" items="${users}">

			<div class="sidebar col-3">

				<a href="/layout/index" class="active bi bi-house-door-fill"
					style="font-size: 40px;"> <span style="padding-left: 10px;">Trang
						chủ</span>
				</a> <a href="/layout/login" class="bi bi-person-circle
			"
					style="font-size: 25px;"> <span style="padding-left: 10px;">Thông
						tin tài khoản</span>


				</a><a href="/layout/thongke" class="bi bi-graph-up-arrow
			"
					style="font-size: 25px;" ${!user.admin ? 'hidden' : ''}> <span style="padding-left: 10px;" >Thống
						kê</span>


				</a> <a href="/layout/login" class="bi bi-folder-plus 
			"
					style="font-size: 25px;" ${!user.admin ? 'hidden' : ''}> <span style="padding-left: 10px;" >Thêm
						sản phẩm</span>


				</a> <a href="/layout/login" class="bi bi-person-lines-fill
			"
					style="font-size: 25px;"${!user.admin ? 'hidden' : ''}> <span style="padding-left: 10px;" >Quản
						lý người dùng</span>


				</a> <a href="/logout" class="bi bi-box-arrow-right"
					style="font-size: 25px;"> <span style="padding-left: 10px;">
						Đăng xuất</span>
				</a>
			</div>

			<div class="main-content">
				<h1 class="text-center">

					<input type="text" class="form-control" id="fullnameID"
						placeholder="Username, Email, họ tên" value="${user.fullname}">
				</h1>

				<div class="user-info">

					<div class="col-8 float-start" style="max-width: 100%">
						<div class="col-5 float-start">
							<ul class="menuInfo" style="margin-left: 10px;">
								<li><b>Họ tên:</b></li>
								<li><b>Email:</b></li>
								<li><b>Admin:</b></li>
								<li><b>Mật khẩu:</b></li>
								<li><b>Ngày sinh:</b></li>
								<li><b>Giới tính:</b></li>
								<li><b>Trạng thái:</b></li>

							</ul>

						</div>
						<div class="col-7 float-end">
							<ul class="menuInfo" style="margin-left: 10px;">
								<li><div class="col-sm-8">
										<!-- Điều chỉnh kích thước của input -->
										<input type="text" class="form-control" value=""
											placeholder="${user.fullname}" disabled="disabled">
									</div></li><li><div class="col-sm-8">
										<!-- Điều chỉnh kích thước của input -->
										<input type="text" class="form-control" value=""
											placeholder="${user.email}" >
									</div></li>
								<li>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio"
											name="inlineRadioOptions1" id="inlineRadio1_1" value="true"
											style="margin-top: 10px" ${user.admin ? 'checked' : ''}
											${!user.admin ? 'disabled' : ''}> <label
											class="form-check-label" for="inlineRadio1_1">true</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio"
											name="inlineRadioOptions1" id="inlineRadio2_1" value="false"
											style="margin-top: 10px" ${!user.admin ? 'checked' : ''}
											${!user.admin ? 'disabled' : ''}> <label
											class="form-check-label" for="inlineRadio2_1">false</label>
									</div>
								</li>
								<li>
									<div style="max-width: 100%">
										<!-- Điều chỉnh kích thước của input -->
										<!-- Button to Open the Modal -->
										<button class="btn btn-outline-primary" data-bs-toggle="modal"
											data-bs-target="#changePasswordModal">Đổi mật khẩu</button>

										<!-- Change Password Modal -->
										<div class="modal fade modal-slide-in-bottom"
											id="changePasswordModal" tabindex="-1"
											aria-labelledby="changePasswordModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content" style="width: 600px;">
													<div class="modal-header">
														<h1 class="modal-title fs-5" id="changePasswordModalLabel">
															<b><span class="bi bi-lock"
																style="color: blue; padding-right: 5px"></span>Đổi mật
																khẩu</b>
														</h1>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<span><b>Để xác thực dữ liệu, chúng tôi cần bạn
																cung cấp mật khẩu cũ trước khi thực hiện <span
																style="color: red;"><i>thay đổi mật khẩu</i></span>!
														</b></span>
														<div class="mt-4">
															<!-- Input for Current Password -->
															<div class="box-input">
																<input class="box-input__main box-input__main1"
																	name="currentPassword" id="currentPasswordInput"
																	placeholder="" maxlength="255" required
																	autocomplete="off" type="password" /> <label
																	for="currentPassword" id="currentPasswordLabel">
																	<i>Nhập mật khẩu hiện tại (*)</i>

																</label> <i class="bi bi-eye-slash" id="toggleOldPassword"
																	style="position: absolute; margin-left: -50px; cursor: pointer; margin-top: 11px !important;"></i>
																<div class="box-input__line" style="margin-top: 3px;"></div>
															</div>
															<div class="box-input mt-3"
																style="margin-top: 20px !important; margin-bottom: 5px">
																<input class="box-input__main box-input__main1"
																	name="newPassword" id="newPasswordInput" placeholder=""
																	maxlength="255" required autocomplete="off"
																	type="password" /> <label for="newPassword"
																	id="newPasswordLabel"> <i>Nhập mật khẩu mới
																		(*)</i></label> <i class="bi bi-eye-slash" id="toggleNewPassword"
																	style="position: absolute; margin-left: -50px; cursor: pointer; margin-top: 11px !important;"></i>
																<div class="box-input__line"
																	style="margin-top: 3px; margin-bottom: 5px;"></div>
															</div>




														</div>
													</div>
													<div class="modal-footer">

														<form id="uploadForm1" enctype="multipart/form-data">



															<button type="button" class="btn btn-outline-secondary"
																data-bs-dismiss="modal" id="closePassword">Đóng</button>
															<button type="button" class="btn btn-outline-success"
																id="changePasswordButton" onclick="checkPass()">Đổi
																mật khẩu</button>

														</form>

													</div>






												</div>
											</div>
										</div>

									</div>

								</li>


								<li><div class="col-sm-8">
										<!-- Điều chỉnh kích thước của input -->
										<input type="date" class="form-control"
											placeholder="Username, Email, họ tên" id="birthdayID"
											value="${user.birthday}">
									</div></li>
								<li>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio"
											name="inlineRadioOptions2" id="inlineRadio1_2" value="true"
											style="margin-top: 10px" ${user.gender ? 'checked' : ''}>
										<label class="form-check-label" for="inlineRadio1_2">Nam</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio"
											name="inlineRadioOptions2" id="inlineRadio2_2" value="false"
											style="margin-top: 10px" ${!user.gender ? 'checked' : ''}>
										<label class="form-check-label" for="inlineRadio2_2">Nữ</label>
									</div>
								</li>
								<li><span
									style="color: ${user.activated ? 'green' : 'red'};">${user.activateString}



										<button type="button" class="btn btn-outline-primary"
											data-bs-toggle="modal" data-bs-target="#exampleModal"
											${user.activated ? 'hidden' : ''}
											onclick="sendActivationCode()">Kích hoạt</button> <!-- Modal -->
								</span> <!-- Hiển thị button "Kích hoạt" nếu activateString không tồn tại hoặc là false -->



									<!-- Button trigger modal -->

									<div class="modal fade modal-slide-in-bottom" id="exampleModal"
										tabindex="-1" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content" style="width: 600px;">
												<div class="modal-header">
													<h1 class="modal-title fs-5" id="exampleModalLabel">
														<b><span class="bi bi-check-lg"
															style="color: green; padding-right: 5px"></span>Kích hoạt
															tài khoản</b>
													</h1>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<span><b>Chúng tôi đã gửi <span
															style="color: red;">mã xác nhận</span> đến email <i>${user.email}</i>,
															vui lòng nhập mã để kích hoạt tài khoản!
													</b></span>
													<div class="mt-4">
														<div class="box-input">
															<input class="box-input__main" name="fullname"
																id="activationCodeInput" placeholder="" maxlength="255"
																required autocomplete="off" /> <label for="name"
																id="activationCodeLabel"> <i>Nhập mã qua
																	email ${user.email} (*)</i></label>
															<div class="box-input__line"></div>
														</div>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-outline-secondary"
														data-bs-dismiss="modal" id="closeActivated">Đóng</button>
													<button type="button" class="btn btn-outline-success"
														id="activateButton">Kích hoạt</button>
												</div>
											</div>
										</div>
									</div></li>
							</ul>
						</div>
					</div>
					<div class="barcode text-center col-4 float-end"
						style="margin-left: 180px;">
						<img id="userPhoto" src="/photo/${user.photo}" alt="User Photo"
							style="width: 200px; height: 160px; border: black solid 2px; border-radius: 10px; padding: 5px;">

						<p style="color: gray; margin-top: 5px;">
							@<span id="usernameID">${user.username}</span>
						</p>

						<form id="uploadForm" enctype="multipart/form-data">
							<label for="file" class="btn btn-success" style="width: 200px;">
								Chọn file <input type="file" id="file" name="file"
								accept="image/*" onchange="uploadFile()" class="btn btn-success"
								style="display: none;">
							</label>

						</form>
					</div>

				</div>
				<div class="float-end">
					<form id="uploadForm2	" enctype="multipart/form-data">

						<button type="button" class="btn btn-success"
							onclick="validateForm()">Hoàn tất</button>
						<button type="button" class="btn btn-danger">Hủy bỏ</button>
					</form>
				</div>





				<!-- 			tiện ích: toask
 -->
				<div class="toast-container position-fixed bottom-0 end-0 p-3">
					<div id="liveToast" class="toast custom-toast" role="alert"
						aria-live="assertive" aria-atomic="true">
						<div class="toast-header">
							<img src="photo/qrcode.png" class="rounded me-2"
								style="width: 30px" /> <strong class="me-auto">Thông
								báo</strong> <small>1 giây trước</small>
							<button type="button" class="btn-close" data-bs-dismiss="toast"
								aria-label="Close" style="margin-top: 0px"></button>
						</div>
						<div class="toast-body" id="toast-content"
							style="font-size: larger;">Thêm vào giỏ hàng thành công!</div>
					</div>
				</div>
		</c:forEach>


		<br>
			<div class="section" style="margin-top: 30px;">
				<h2>Chương trình nổi bật</h2>
				<div id="highlightCarousel" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="d-flex justify-content-center">
								<div class="item">
									<img src="promo1.png" class="d-block w-100" alt="Promo 1">
									<p>Đặc Quyền CellphoneS</p>
									<p>OPPO Find X5 Pro</p>
									<p>Giá chỉ 17.89 Triệu</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="d-flex justify-content-center">
								<div class="item">
									<img src="promo2.png" class="d-block w-100" alt="Promo 2">
									<p>Thu cũ làm chủ 4G</p>
									<p>Trợ giá lên đến 400K</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="d-flex justify-content-center">
								<div class="item">
									<img src="promo1.png" class="d-block w-100" alt="Promo 1">
									<p>Đặc Quyền CellphoneS</p>
									<p>OPPO Find X5 Pro</p>
									<p>Giá chỉ 17.89 Triệu</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="d-flex justify-content-center">
								<div class="item">
									<img src="promo2.png" class="d-block w-100" alt="Promo 2">
									<p>Thu cũ làm chủ 4G</p>
									<p>Trợ giá lên đến 400K</p>
								</div>
							</div>
						</div>
						<!-- Thêm các mục khác nếu cần -->
					</div>
					<button class="carousel-control-prev " type="button"
						data-bs-target="#highlightCarousel" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#highlightCarousel" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>



			<div class="section">
				<h2>Chương trình nổi bật</h2>
				<div id="highlightCarousel" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="d-flex justify-content-center">
								<div class="item">
									<img src="promo1.png" class="d-block w-100" alt="Promo 1">
									<p>Đặc Quyền CellphoneS</p>
									<p>OPPO Find X5 Pro</p>
									<p>Giá chỉ 17.89 Triệu</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="d-flex justify-content-center">
								<div class="item">
									<img src="promo2.png" class="d-block w-100" alt="Promo 2">
									<p>Thu cũ làm chủ 4G</p>
									<p>Trợ giá lên đến 400K</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="d-flex justify-content-center">
								<div class="item">
									<img src="promo1.png" class="d-block w-100" alt="Promo 1">
									<p>Đặc Quyền CellphoneS</p>
									<p>OPPO Find X5 Pro</p>
									<p>Giá chỉ 17.89 Triệu</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="d-flex justify-content-center">
								<div class="item">
									<img src="promo2.png" class="d-block w-100" alt="Promo 2">
									<p>Thu cũ làm chủ 4G</p>
									<p>Trợ giá lên đến 400K</p>
								</div>
							</div>
						</div>
						<!-- Thêm các mục khác nếu cần -->
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#highlightCarouselPrev" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>

					<button class="carousel-control-next" type="button"
						data-bs-target="#highlightCarouselNext" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
	</div>

	<%@include file="common/footer.jsp"%>
	<script th:inline="javascript">
	
	let makichHoat = ''; // Khai báo biến ngoài hàm

	function sendActivationCode() {
	    // Gửi request POST đến endpoint "/sendActivationCode"
	    fetch('/sendActivationCode', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json'
	        }
	    })
	    .then(response => {
	        if (response.ok) {
	            return response.text(); // Trả về dữ liệu response dưới dạng text
	        }
	        throw new Error('Network response was not ok.');
	    })
	    .then(data => {
	        // Xử lý dữ liệu nhận được từ server (mã kích hoạt)
	        console.log('Received activation code:', data);
	        makichHoat = data; // Lưu giá trị vào biến ngoài

	    })
	    .catch(error => {
	        console.error('Error fetching activation code:', error);
	        // Xử lý lỗi nếu có
	    });
	}
	
	
	document.getElementById('activateButton').addEventListener('click', function() {
	    // Lấy giá trị từ input
	    let activationCodeInput = document.getElementById('activationCodeInput').value;
	    
	    // Mã kích hoạt cần kiểm tra (giả sử là mã ABC123)
	    let correctActivationCode = makichHoat;
	    
	    // So sánh mã nhập vào với mã chính xác
if (activationCodeInput != "" && activationCodeInput === correctActivationCode) {
    // Mã nhập vào đúng
    console.log('Mã kích hoạt đúng!');
    fetch('/activatedAccount', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => {
        if (response.ok) {
            return response.text(); // Trả về dữ liệu response dưới dạng text
        }
        throw new Error('Network response was not ok.');
    })
    .then(data => {
        // Chuyển hướng người dùng đến trang chỉnh sửa tài khoản
               var closeButton = document.getElementById('closeActivated');
               if (closeButton) {
                   closeButton.click(); // Tự động kích hoạt sự kiện click trên button "Đóng"
               }
    	toastOpen("Chúc mừng bạn đã kích hoạt tài khoản thành công!", 7000);
  
            
            setTimeout(function() {    

    	    setTimeout(function() {
    	        window.location.href = data; // data chứa đường dẫn cần chuyển hướng đến
    	    }, 500);
    	}, 3000);

        

    })
    .catch(error => {
        console.error('Error activating account:', error);
        // Xử lý lỗi nếu có
    });
} else {
	        // Mã nhập vào không đúng
	                    toastOpen("Mã xác nhận không đúng!",3000);


	        // Hiển thị thông báo hoặc xử lý khác tại đây
	    }
	});
	
	document.getElementById('activationCodeLabel').addEventListener('click', function() {
        document.getElementById('activationCodeInput').focus();
    });
	document.getElementById('currentPasswordLabel').addEventListener('click', function() {
        document.getElementById('currentPasswordInput').focus();
    });document.getElementById('newPasswordLabel').addEventListener('click', function() {
        document.getElementById('newPasswordInput').focus();
    });

	

	
	
	
	 function uploadFile() {
         var formData = new FormData($('#uploadForm')[0]);

         $.ajax({
             url: '/upload',
             type: 'POST',
             data: formData,
             enctype: 'multipart/form-data',
             processData: false,  // Không xử lý dữ liệu file
             contentType: false,  // Không thiết lập Content-Type
             success: function (data) {
            	 console.log("data:" +data.uploadIMG)
                  setTimeout(function() {
            $('#userPhoto').attr('src', '/photo/' + data.uploadIMG);
            toastOpen("Upload hình ảnh thành công!",5000);
        }, 500); // 3 giây
             },
             error: function () {
                 alert("Upload failed!");
             }
         });
     }
	
	 
	 var toastTimeout;
	 var toastContainer = document.querySelector('.toast-container');

	 function showToastTime(toastLiveExample) {
		    var startTime = new Date().getTime(); // Thời điểm bắt đầu hiển thị toast

		    function updateElapsedTime() {
		        var currentTime = new Date().getTime();
		        var elapsedTime = Math.floor((currentTime - startTime) / 1000); // Đổi thành giây

		        var toastTimes = toastLiveExample.querySelectorAll('.toast-time');
		        toastTimes.forEach(toastTime => {
		            toastTime.textContent = elapsedTime + ' giây trước';
		        });

		        requestAnimationFrame(updateElapsedTime); // Cập nhật thời gian mỗi frame
		    }

		    updateElapsedTime(); // Bắt đầu cập nhật thời gian
		}
	 
	

		function slideOutRight(element) {
		    element.style.transition = 'transform 0.3s ease';
		    element.style.transform = 'translateX(120%)';
		}
		function slideIntLeft(element) {
		    element.style.transition = 'transform 0.3s ease';
		    element.style.transform = 'translateX(0)';
		}
		


		function toastOpen(content, time) {
		    if (!toastContainer) {
		        toastContainer = document.createElement('div');
		        toastContainer.className = 'toast-container position-fixed bottom-0 end-0 p-3';
		        document.body.appendChild(toastContainer);
		    }

		    var toastLiveExample = document.createElement('div');
		    toastLiveExample.className = 'toast custom-toast hide';
		    toastLiveExample.setAttribute('role', 'alert');
		    toastLiveExample.setAttribute('aria-live', 'assertive');
		    toastLiveExample.setAttribute('aria-atomic', 'true');

		    var toastHeader = document.createElement('div');
		    toastHeader.className = 'toast-header';

		    var toastImg = document.createElement('img');
		    toastImg.src = '/photo/qrcode.png';
		    toastImg.className = 'rounded me-2';
		    toastImg.style.width = '30px';

		    var strong = document.createElement('strong');
		    strong.className = 'me-auto';
		    strong.textContent = 'Thông báo';

		    var small = document.createElement('small');
		    small.textContent = '1 giây trước';
		    small.className = 'toast-time';

		    var button = document.createElement('button');
		    button.className = 'btn-close';
		    button.setAttribute('data-bs-dismiss', 'toast');
		    button.setAttribute('aria-label', 'Close');
		    button.style.marginTop = '0px';

		    var toastBody = document.createElement('div');
		    toastBody.className = 'toast-body';
		    toastBody.id = 'toast-content';
		    toastBody.textContent = content;

		    toastHeader.appendChild(toastImg);
		    toastHeader.appendChild(strong);
		    toastHeader.appendChild(small);
		    toastHeader.appendChild(button);

		    toastLiveExample.appendChild(toastHeader);
		    toastLiveExample.appendChild(toastBody);

		    toastContainer.appendChild(toastLiveExample);

		    // Hiển thị toast và thực hiện animation trượt từ bên phải vào
		   	toastLiveExample.classList.remove('hide');

		     toastTimeout = setTimeout(function () {

	    		    slideIntLeft(toastLiveExample);
		    }, 1000);
		    
		 

		    var toastBootstrap = new bootstrap.Toast(toastLiveExample, {
		        animation: true,
		        autohide: true,
		        delay: time
		    });
		    toastBootstrap.show();

		    // Đặt timeout để ẩn toast và thực hiện animation trượt ra bên phải khi hết thời gian delay
		    if (toastTimeout) {
		        clearTimeout(toastTimeout);
		    }
		    toastTimeout = setTimeout(function () {
		        slideOutRight(toastLiveExample);
		        toastLiveExample.classList.add('hide');
		    }, time);

		    button.addEventListener('click', function () {
		    	  // Đặt timeout để ẩn toast và thực hiện animation trượt ra bên phải khi hết thời gian delay
			    if (toastTimeout) {
			        clearTimeout(toastTimeout);
			    }
			    toastTimeout = setTimeout(function () {
			        slideOutRight(toastLiveExample);
			        toastLiveExample.classList.add('hide');
			    }, 1000);		    });
		    
		    
		    // Cập nhật thời gian mỗi giây
		    showToastTime(toastLiveExample);
		}

		
		
		
		// show pass
			document.getElementById('toggleOldPassword').addEventListener('click', function () {
    var passwordInput = document.getElementById('currentPasswordInput');
    var icon = document.getElementById('toggleOldPassword');
    
    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        icon.classList.remove('bi-eye-slash');
        icon.classList.add('bi-eye');
    } else {
        passwordInput.type = 'password';
        icon.classList.remove('bi-eye');
        icon.classList.add('bi-eye-slash');
    }
});

		document.getElementById('toggleNewPassword').addEventListener('click', function () {
    var passwordInput = document.getElementById('newPasswordInput');
    var icon = document.getElementById('toggleNewPassword');
    
    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        icon.classList.remove('bi-eye-slash');
        icon.classList.add('bi-eye');
    } else {
        passwordInput.type = 'password';
        icon.classList.remove('bi-eye');
        icon.classList.add('bi-eye-slash');
    }
});
		
	
	         function checkPass() {
	        		let passwordMacDinh = ''; // Khai báo biến ngoài hàm

	     	    // Gửi request POST đến endpoint "/sendActivationCode"
	     	    fetch('/checkPass', {
	     	        method: 'POST',
	     	        headers: {
	     	            'Content-Type': 'application/json'
	     	        }
	     	    })
	     	    .then(response => {
	     	        if (response.ok) {
	     	            return response.text(); // Trả về dữ liệu response dưới dạng text
	     	        }
	     	        throw new Error('Network response was not ok.');
	     	    })
	     	    .then(data => {
	     	        // Xử lý dữ liệu nhận được từ server (mã kích hoạt)
	     	        console.log('Nhận được password:', data);
	     	       passwordMacDinh = data
	     	   // Lấy giá trị mật khẩu hiện tại từ người dùng
		     	    let currentPassword = document.getElementById('currentPasswordInput').value;
		     	    let newpass = document.getElementById('newPasswordInput').value;
		        	
	     	      // So sánh mật khẩu hiện tại với mật khẩu mặc định
	     	      if(newpass != null){
	     	    	 if (currentPassword === passwordMacDinh) {
		     	            // Nếu mật khẩu đúng, thực hiện request POST đến "/updatePassword"
		     	            fetch('/updatePassword', {
		     	                method: 'POST',
		     	                headers: {
		     	                    'Content-Type': 'application/json'
		     	                },
		     	                body: JSON.stringify({
		     	                    newPassword: document.getElementById('newPasswordInput').value
		     	                })
		     	            })
		     	            .then(response => {
		     	                if (response.ok) {
		     	                	
		     	                    // Xử lý khi cập nhật thành công
		     	                    
		     	                    
		     	                    
		     	                    console.log('Đã cập nhật mật khẩu thành công!');
		     	                    
		     	                   // Xóa nội dung của input
		     	                    document.getElementById('currentPasswordInput').value = '';
		     	                    document.getElementById('newPasswordInput').value = '';

		     	                   var closeButton = document.getElementById('closePassword');
		     	                  if (closeButton) {
		     	                      closeButton.click(); // Tự động kích hoạt sự kiện click trên button "Đóng"
		     	                  }
		     	                   toastOpen("Thay đổi mật khẩu thành công!! ",5000);
		     	                   
		     	                } else {
		     	                    throw new Error('Update password failed.');
		     	                }
		     	            })
		     	            .catch(error => {
		     	                console.error('Error updating password:', error);
		     	            });
		     	        } else {
	  	                   toastOpen("Mật khẩu hiện tại không đúng!! ",3000);

		     	        }
	     	      }else{
 	                   toastOpen("Mật khẩu mới không được bỏ trống!! ",3000);

	     	      }
	     	        
	     	       
	     	    })
	     	    .catch(error => {
	     	        console.error('Error fetching activation code:', error);
	     	        // Xử lý lỗi nếu có
	     	    });
	        		
	     	
	     	}
	         function validateForm() {
	        	 console.log("đã chạy vaildate form!");
	        	    let adminValue = document.querySelector('input[name="inlineRadioOptions1"]:checked').value;
	        	    let genderValue = document.querySelector('input[name="inlineRadioOptions2"]:checked').value;
		        	 console.log("admin: "+adminValue);
		        	 console.log("genderValue: "+genderValue);


	         fetch('/validateForm', {
	     	        method: 'POST',
	     	        headers: {
	     	            'Content-Type': 'application/json'
	     	        },
  	                body: JSON.stringify({
  	                    usernameID: document.getElementById('usernameID').innerText,
  	                    fullnameID: document.getElementById('fullnameID').value,
  	                    adminID: adminValue,
  	                    birthdayID: document.getElementById('birthdayID').value,
  	                    genderID: genderValue,
  	                    imgID: document.getElementById('userPhoto').src
  	                })
	     	    })
	     	    .then(response => {
	     	        if (response.ok) {
	     	            return response.text(); // Trả về dữ liệu response dưới dạng text
	     	        }
	     	        throw new Error('Network response was not ok.');
	     	    })
	     	    .then(data => {
	     	        console.log('Response from server:', data); // Log dữ liệu trả về từ server
	                   toastOpen("Cập nhật thông tin thành công! ",3000);

	     	       setTimeout(function() {    

	     	    	    setTimeout(function() {
	     	    	        window.location.href = "/layout/login"; // data chứa đường dẫn cần chuyển hướng đến
	     	    	    }, 500);
	     	    	}, 1000);

	     	   })
	     	    .catch(error => {
	     	        console.error('Error fetching activation code:', error);
	     	        // Xử lý lỗi nếu có
	     	    });
	         
	         
	         
	         
	         
	        		
	     	    }
	         
		





</script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</body>
</html>