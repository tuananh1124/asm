<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

<link href="/css/thongke.css" rel="stylesheet">

<style>
.vertical-align-middle {
	vertical-align: middle; /* Căn giữa hàng dọc */
}

.table-fixed>thead {
	position: sticky;
	top: 0;
	z-index: 1;
	background-color: #fff; /* Màu nền của thead */
}

.thead-fixed th {
	background-color: #fff;
}

.tab-pane {
	padding: 20px;
	margin-top: 10px;
	border-radius: 10px;
}

.product-options {
	margin-bottom: 15px;
}

.form-label {
	font-weight: bold;
}

.btn-danger {
	background-color: red;
	border-color: red;
}

.form-control, .form-select {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border-radius: 5px;
	border: 1px solid #ced4da;
}

.text-center span {
	font-size: 1.2em;
	font-weight: bold;
}
</style>
</head>
<body>
	<%@include file="common/menu.jsp"%>

	<div class="container"
		style="margin-top: 100px; max-width: 92% !important;">
		<div class="sidebar col-3">

			<a href="/layout/index" class="active bi bi-house-door-fill"
				style="font-size: 40px;"> <span style="padding-left: 10px;">Trang
					chủ</span>
			</a> <a href="/layout/login" class="bi bi-person-circle
			"
				style="font-size: 25px;"> <span style="padding-left: 10px;">Thông
					tin tài khoản</span>



			</a><a href="/layout/lichsumuahang" class="bi bi-person-circle
			"
				style="font-size: 25px;"> <span style="padding-left: 10px;">Lịch
					sử mua hàng</span>



			</a><a href="/layout/thongke" class="bi bi-graph-up-arrow
			"
				style="font-size: 25px;" ${!userAdmin ? 'hidden' : ''}> <span
				style="padding-left: 10px;">Thống kê</span>


			</a> <a href="/layout/login" class="bi bi-folder-plus 
			"
				style="font-size: 25px;" ${!userAdmin ? 'hidden' : ''}> <span
				style="padding-left: 10px;">Thêm sản phẩm</span>


			</a> <a href="/layout/login" class="bi bi-person-lines-fill
			"
				style="font-size: 25px;" ${!userAdmin ? 'hidden' : ''}> <span
				style="padding-left: 10px;">Quản lý người dùng</span>


			</a> <a href="/logout" class="bi bi-box-arrow-right"
				style="font-size: 25px;"> <span style="padding-left: 10px;">
					Đăng xuất</span>
			</a>
		</div>

		<div class="main-content " style="height: 100%;">
			<div class="user-info" style="height: 100%;">
				<div class="row">
					<div class="col">
						<!-- Thanh tab -->
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="tab1-tab" data-bs-toggle="tab"
									data-bs-target="#tab1" type="button" role="tab"
									aria-controls="tab1" aria-selected="false">Lịch sử mua
									hàng</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link active" id="tab2-tab"
									data-bs-toggle="tab" data-bs-target="#tab2" type="button"
									role="tab" aria-controls="tab2" aria-selected="true">Chi
									tiết đơn hàng</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="tab3-tab" data-bs-toggle="tab"
									data-bs-target="#tab3" type="button" role="tab"
									aria-controls="tab3" aria-selected="false">Đơn hàng đã
									giao</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="tab4-tab" data-bs-toggle="tab"
									data-bs-target="#tab4" type="button" role="tab"
									aria-controls="tab4" aria-selected="false">Đơn hàng đã
									hủy</button>
							</li>
						</ul>
						<!-- Nội dung của tab -->
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade " id="tab1" role="tabpanel"
								aria-labelledby="tab1-tab">
								<!-- Nội dung của tab 1 -->
								<div class="row col"
									style="padding: 20px; margin-top: 10px; border-radius: 10px">
									<div style="height: 400px; overflow-x: auto;">
										<table class="table table-hover table-fixed">
											<thead class="thead-fixed">
												<tr class="text-center">
													<th class="col"></th>
													<th class="col">Sản phẩm</th>
													<th class="col">Số lượng</th>
													<th class="col">Ngày đặt</th>
													<th class="col">Địa chỉ</th>
													<th class="col">Tổng tiền</th>
													<th class="col">Trạng thái</th>
													<th class="col">Thao Tác</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="thongke3" items="${thongkeTungSP}">
													<tr class="" style="line-height: 40px;">
														<td class="col vertical-align-middle"
															style="text-align: left;"><img alt=""
															src="/photo/${thongke3.image}"
															style="width: 80px; height: 70px;"></td>
														<td class="col vertical-align-middle text-center">${thongke3.ProductName}</td>
														<td class="col vertical-align-middle text-center">${thongke3.quantity}</td>
														<td class="col vertical-align-middle"
															style="text-align: left;">${thongke3.formattedOrderDate}</td>
														<td class="col vertical-align-middle"
															style="text-align: left;">${thongke3.address}</td>
														<td class="col vertical-align-middle"
															style="text-align: left;">${thongke3.sumPrice}đ</td>
														<td class="col vertical-align-middle"
															style="text-align: left;">
															<button type="button" 
    class="btn 
        ${thongke3.status.equals("Đã đặt hàng") ? "btn-outline-primary" : 
          (thongke3.status.equals("Đã giao") ? "btn-outline-success" : 
           (thongke3.status.equals("Đã hủy") ? "btn-outline-danger" : ""))}" 
    style="width: 100%"  disabled="disabled">${thongke3.status}</button>
														</td>
														<td class="col vertical-align-middle"
															style="text-align: left;"><a
															href="/layout/chitiet?id=${thongke3.id}">
																<button type="button" class="btn btn-outline-primary"
																	style="width: 100%">Xem chi tiết</button>
														</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>


							<!-- Nội dung của tab 2 -->
							<div class="tab-pane fade show active" id="tab2" role="tabpanel"
								aria-labelledby="tab2-tab">
								<c:forEach var="orderdetail" items="${orderdetails}">

									<div
										style="padding: 20px; margin-top: 10px; border-radius: 10px">
										<div class="row">
											<div
												class="col-5 d-flex align-items-center justify-content-center">
												<img src="/photo/${orderdetail.product.image}"
													alt="iPhone Image" style="width: 100%; max-width: 300px;">
											</div>
											<div class="col-7"
												style="border-radius: 20px; padding: 10px; border: 1px solid gray;">
												<h1 class="text-center">${orderdetail.product.name}</h1>
												<br>
												<div class="row col-6"
													style="padding: 10px; margin-bottom: -40px">
													<table class="table table-borderless">

														<thead>
															<tr>
																<th scope="col" style="width: 100%"><span
																	style="font-size: 20px">Dung lượng: </span></th>
																<th scope="col" style="text-align: left"><span
																	style="font-size: 20px">${orderdetail.capacity.detail}GB</span></th>


															</tr>
														</thead>


													</table>

												</div>
												<div class="row col-6"
													style="padding: 10px; margin-bottom: -40px">
													<table class="table table-borderless">

														<thead>
															<tr>
																<th scope="col" style="width: 100%"><span
																	style="font-size: 20px">Màu sắc: </span></th>
																<th scope="col" style="text-align: left"><span
																	style="font-size: 20px">${orderdetail.color.name}</span></th>


															</tr>
														</thead>


													</table>

												</div>
												<div class="row col-6"
													style="padding: 10px; margin-bottom: -40px">
													<table class="table table-borderless">

														<thead>
															<tr>
																<th scope="col" style="width: 100%"><span
																	style="font-size: 20px">Ngày đặt: </span></th>
																<th scope="col" style="text-align: left"><span
																	style="font-size: 20px">${orderdetail.order.dateFormat}</span></th>


															</tr>
														</thead>


													</table>

												</div>
												<div class="row" style="padding: 10px; margin-top: 20px">
													<table
														class="table text-center table-hover vertical-align-middle ">

														<thead>
															<tr>
																<th scope="col"><span style="font-size: 20px">Số
																		lượng</span></th>
																<th scope="col"><span style="font-size: 20px">Giảm
																		giá</span></th>
																<th scope="col"><span style="font-size: 20px">Đơn
																		giá</span></th>

															</tr>
														</thead>

														<tbody>
															<tr>
																<td><span style="font-size: 25px">${orderdetail.quantity}</span></td>
																<td><span style="font-size: 25px">${orderdetail.product.sale}%</span></td>
																<td><label for="recipient" style="margin-left: 10px">
																		<span class="float-start"
																		style="color: red; font-size: 28px">${orderdetail.product.sum}đ</span>
																		 <span
																		class="old-price float-end"
																		style="color: gray; margin-left: 5px; text-decoration: line-through;">${orderdetail.product.priceOld}đ</span>
																		</label></td>
															</tr>
														</tbody>
													</table>

												</div>
											</div>
										</div>
										<div class="col-12" style="margin-top: 20px;">
											<h2 class="text-center">THÔNG TIN KHÁCH HÀNG</h2>
											<div class="col-6 float-start" style="margin-top: 20px;">

												<form
													style="background: #f8f9fa; padding: 20px; border-radius: 10px;">
													<div class="mb-3">
														<label for="name" class="form-label">Người Nhận</label> <input
															type="text" class="form-control" id="name" required
															disabled="disabled" style="width: 100%;" value="${orderdetail.order.name}">
													</div>
													<div class="mb-3">
														<label for="phone" class="form-label">Số điện
															thoại</label> <input type="text" class="form-control" id="phone"
															required disabled="disabled" style="width: 100%;"value="${orderdetail.order.phone}">
													</div>
													<div class="mb-3 vertical-align-middle">
														<label for="address" class="form-label">Tổng tiền
															tạm tính:</label> <span class="float-end"
															style="color: red; font-size: 28px">${orderdetail.product.allSUM}đ</span>
													</div>
												</form>

											</div>
											<div class="col-6 float-end" style="margin-top: 20px;">

												<form
													style="background: #f8f9fa; padding: 20px; border-radius: 10px;">

													<div class="mb-3">
														<label for="address" class="form-label">Địa chỉ
															nhận hàng</label> <input type="text" class="form-control"
															id="address" style="width: 100%;" disabled="disabled"value="${orderdetail.order.address}">
													</div>

													<div class="mb-3">
    <label for="address" class="form-label">Trạng thái đơn hàng</label>
    <button type="button" class="btn 
        ${orderdetail.order.status.equals("Đã đặt hàng") ? "btn-outline-primary" : 
          (orderdetail.order.status.equals("Đã giao") ? "btn-outline-success" : 
           (orderdetail.order.status.equals("Đã hủy") ? "btn-outline-danger" : ""))}" 
        style="width: 100%" 
        disabled="${orderdetail.order.status.equals("Đã hủy") ? "disabled" : ""}">
        ${orderdetail.order.status}
    </button>
</div>

<div class="mb-3 text-center">
    <!-- Hiện nút thanh toán chỉ khi đơn hàng đã đặt mà chưa thanh toán -->
    <c:if test="${orderdetail.order.status.equals('Đã đặt hàng') && !orderdetail.order.pay}">
        <button type="submit" class="btn btn-danger" style="width: 100%;">
            Thanh toán
        </button>
    </c:if>

    <!-- Nút hiển thị nếu đơn hàng đã thanh toán -->
    <c:if test="${orderdetail.order.pay}">
        <button type="button" class="btn btn-success" style="width: 100%;" disabled>
            Đã thanh toán
        </button>
    </c:if>
</div>

												</form>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>

							<!-- Nội dung của tab 3 -->
							<div class="tab-pane fade" id="tab3" role="tabpanel"
								aria-labelledby="tab3-tab">
								<div class="row col"
									style="padding: 20px; margin-top: 10px; border-radius: 10px">
									<div style="height: 400px; overflow-x: auto;">
										<table class="table table-hover table-fixed">
											<thead class="thead-fixed">
												<tr class="text-center">
													<th class="col"></th>
													<th class="col">Sản phẩm</th>
													<th class="col">Số lượng</th>
													<th class="col">Ngày đặt</th>
													<th class="col">Địa chỉ</th>
													<th class="col">Tổng tiền</th>
													<th class="col">Trạng thái</th>
													<th class="col">Thanh toán</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="thongke3" items="${thongkeTungSP}">
													<tr class="" style="line-height: 40px;">
														<td class="col vertical-align-middle"
															style="text-align: left;"><img alt=""
															src="/photo/${thongke3.image}"
															style="width: 80px; height: 70px;"></td>
														<td class="col vertical-align-middle text-center">${thongke3.ProductName}</td>
														<td class="col vertical-align-middle text-center">${thongke3.quantity}</td>
														<td class="col vertical-align-middle"
															style="text-align: left;">${thongke3.formattedOrderDate}</td>
														<td class="col vertical-align-middle"
															style="text-align: left;">${thongke3.address}</td>
														<td class="col vertical-align-middle"
															style="text-align: left;">${thongke3.sumPrice}đ</td>
														<td class="col vertical-align-middle"
															style="text-align: left;">
															<button type="button"
																class="btn btn-${thongke3.status.equals(" Đã đặt
																hàng") ? "outline-primary" : "outline-success"}" style="width: 100%">${thongke3.status}</button>
														</td>
														<td class="col vertical-align-middle"
															style="text-align: left;">
															<button type="button"
																class="btn btn-${thongke3.pay ? 'outline-success' : 'outline-danger'}"
																style="width: 100%">${thongke3.pay ? 'Đã thanh toán' : 'Chưa thanh toán'}</button>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>

							<!-- Nội dung của tab 4 -->
							<div class="tab-pane fade" id="tab4" role="tabpanel"
								aria-labelledby="tab4-tab">
								<div
									style="padding: 20px; margin-top: 10px; border-radius: 10px">
									<div class="row">
										<div
											class="col-5 d-flex align-items-center justify-content-center">
											<img src="/photo/iphone-13_1.webp" alt="iPhone Image"
												style="width: 100%; max-width: 300px;">
										</div>
										<div class="col-7"
											style="border-radius: 20px; padding: 10px; border: 1px solid gray;">
											<h1 class="text-center">iPhone 13</h1>
											<br>
											<div class="row col-6"
												style="padding: 10px; margin-bottom: -40px">
												<table class="table table-borderless">

													<thead>
														<tr>
															<th scope="col" style="width: 100%"><span
																style="font-size: 20px">Dung lượng: </span></th>
															<th scope="col" style="text-align: left"><span
																style="font-size: 20px">256GB</span></th>


														</tr>
													</thead>


												</table>

											</div>
											<div class="row col-6"
												style="padding: 10px; margin-bottom: -40px">
												<table class="table table-borderless">

													<thead>
														<tr>
															<th scope="col" style="width: 100%"><span
																style="font-size: 20px">Màu sắc: </span></th>
															<th scope="col" style="text-align: left"><span
																style="font-size: 20px">Hồng</span></th>


														</tr>
													</thead>


												</table>

											</div>
											<div class="row col-6"
												style="padding: 10px; margin-bottom: -40px">
												<table class="table table-borderless">

													<thead>
														<tr>
															<th scope="col" style="width: 100%"><span
																style="font-size: 20px">Ngày đặt: </span></th>
															<th scope="col" style="text-align: left"><span
																style="font-size: 20px">30/07/2024</span></th>


														</tr>
													</thead>


												</table>

											</div>
											<div class="row" style="padding: 10px; margin-top: 20px">
												<table
													class="table text-center table-hover vertical-align-middle ">

													<thead>
														<tr>
															<th scope="col"><span style="font-size: 20px">Số
																	lượng</span></th>
															<th scope="col"><span style="font-size: 20px">Giảm
																	giá</span></th>
															<th scope="col"><span style="font-size: 20px">Đơn
																	giá</span></th>

														</tr>
													</thead>

													<tbody>
														<tr>
															<td><span style="font-size: 25px">1</span></td>
															<td><span style="font-size: 25px">10%</span></td>
															<td><label for="recipient"><span
																	class="float-end" style="color: red; font-size: 28px">13.680.000đ</span></label></td>
														</tr>
													</tbody>
												</table>

											</div>
										</div>
									</div>
									<div class="col-12" style="margin-top: 20px;">
										<h2 class="text-center">THÔNG TIN KHÁCH HÀNG</h2>
										<div class="col-6 float-start" style="margin-top: 20px;">

											<form
												style="background: #f8f9fa; padding: 20px; border-radius: 10px;">
												<div class="mb-3">
													<label for="name" class="form-label">Người Nhận</label> <input
														type="text" class="form-control" id="name" required
														disabled="disabled" style="width: 100%;">
												</div>
												<div class="mb-3">
													<label for="phone" class="form-label">Số điện thoại</label>
													<input type="text" class="form-control" id="phone" required
														disabled="disabled" style="width: 100%;">
												</div>
												<div class="mb-3 vertical-align-middle">
													<label for="address" class="form-label">Tổng tiền
														tạm tính:</label> <span class="float-end"
														style="color: red; font-size: 28px">13.680.000đ</span>
												</div>
											</form>

										</div>
										<div class="col-6 float-end" style="margin-top: 20px;">

											<form
												style="background: #f8f9fa; padding: 20px; border-radius: 10px;">

												<div class="mb-3">
													<label for="address" class="form-label">Địa chỉ
														nhận hàng</label> <input type="text" class="form-control"
														id="address" style="width: 100%;" disabled="disabled">
												</div>

												<div class="mb-3">
													<label for="address" class="form-label">Trạng thái
														đơn hàng</label>

													<button type="button" class="btn btn-outline-danger"
														disabled="disabled" style="width: 100%;">Đã hủy</button>
												</div>
												<div class="mb-3 text-center">
													<button type="submit" class="btn btn-danger"
														style="width: 100%;" disabled="disabled">THANH
														TOÁN</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>




						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<%@include file="common/footer.jsp"%>


	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</body>
</html>