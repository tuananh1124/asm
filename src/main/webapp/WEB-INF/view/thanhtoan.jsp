<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Form</title>
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link rel="stylesheet" href="/css/register3.css">
<link rel="stylesheet" href="/css/accountEdit.css">

<style>
body {
	font-family: Arial, sans-serif;
}

.container {
	max-width: 600px;
	margin: auto;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 10px;
}

.container h2 {
	text-align: center;
}

.radio-group {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
}

.form-group input, .form-group select {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.checkbox-group {
	margin-bottom: 20px;
}

.summary {
	text-align: center;
	margin-bottom: 20px;
	background-color: white;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 100%;
}

.summary .total {
	font-size: 1.2em;
	color: red;
}

.btn-submit {
	display: block;
	width: 100%;
	padding: 10px;
	background-color: red;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 1.2em;
}

.btn-submit:hover {
	background-color: darkred;
}

.cart-container {
	margin-top: 20px;
}

.cart-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 20px;
	background-color: #fff;
	border-bottom: 1px solid #ddd;
}

.cart-item {
	background-color: #fff;
	margin-bottom: 10px;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 10px;
	display: flex;
	align-items: center;
}

.cart-item img {
	max-width: 100px;
	border-radius: 10px;
}

.cart-item-info {
	display: flex;
	align-items: center;
}

.cart-item-info h5 {
	margin: 0 20px;
}

.cart-item-actions {
	display: flex;
	align-items: center;
}

.cart-item-actions button {
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
	width: 30px;
	height: 30px;
}

.cart-summary {
	background-color: #fff;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 10px;
	text-align: center;
}

.cart-container {
	margin-top: 20px;
}

.cart-list {
	max-height: 400px; /* Thay đổi kích thước theo nhu cầu của bạn */
	overflow-y: auto; /* Thêm thanh cuộn dọc khi nội dung quá nhiều */
	border: 1px solid #ddd;
	border-radius: 10px;
	padding: 10px;
	background-color: #fff;
}
.box-input{
margin-bottom: 20px

}
.form-group{
margin-bottom: 20px}
</style>
<body>
	<%@include file="common/menu.jsp"%>

	<div class="container" style="margin-top: 80px;">
		<h2>THÔNG TIN SẢN PHẨM</h2>
		<table class="table">
			<thead>
				<tr class="text-center" style="padding: 20px;">
					<th class="col-5">Thông tin sản phẩm</th>
					<th class="col-3">Đơn giá</th>
					<th class="col-2" style="padding-right: 25px !important;">Số
						lượng</th>
					<th class="col-2" style="padding-right: 50px !important;">Tổng
						tiền</th>
				</tr>
			</thead>
		</table>

		<div class="cart-container">
			<div class="cart-list">
				<c:forEach var="product" items="${products1}">
					<div class="cart-item col text-center">
						<div class="cart-item-info col-3">
							<!-- Thêm thuộc tính onchange để gọi hàm toggleButton() khi checkbox thay đổi -->
							<label for="itemCheckbox${product.idCartProduct}"
								class="hidden-label">${product.idCartProduct}</label> <img
								src="/photo/${product.image}" alt="iPhone 13">
							<h5>${product.name}</h5>
						</div>
						<div class="cart-item-info col-2">
							<h5>${product.colorName}-${product.capacityName}GB</h5>
						</div>
						<div class="cart-item-actions col-3">
							<p style="width: 100%">
								<span class="text-danger" style="font-size: 20px">${product.priceNew}₫</span>
								<del>${product.priceOld}₫</del>
							</p>
						</div>
						<div class="col-2">
							<span style="font-size: 20px">${product.count}</span>
						</div>
						<div class="cart-item-actions col-2">
							<p style="width: 100%">
								<span class="text-danger"
									id="productSum${product.idCartProduct}" style="font-size: 28px">${product.sum}₫</span>
							</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<hr>
		<h2>THÔNG TIN KHÁCH HÀNG</h2>

		<form action="/layout/thanhtoan/success" method="post"
			modelAttribute="order">
			<div class="form-group col-6 float-start">
				<div class="box-input">
					<input class="box-input__main" name="name" id="name" placeholder=""
						maxlength="255" required autocomplete="off" /> <label for="name">NHẬP
						HỌ VÀ TÊN(*)</label>
					<div class="box-input__line"></div>
					<div class="box-input__err-validate"> </div>
				</div>
				<div class="form-group">
					<label for="district">Chọn quận/huyện</label> <select id="district"
						name="address">
						<option value="">Chọn quận/huyện</option>
						<option value="quan1">Quận 1</option>
						<option value="quan2">Quận 2</option>
						<option value="quan3">Quận 3</option>
						<option value="quan4">Quận 4</option>
						<option value="quan5">Quận 5</option>
						<option value="quan6">Quận 6</option>
						<option value="quan7">Quận 7</option>
						<option value="quan8">Quận 8</option>
						<option value="quan9">Quận 9</option>
						<option value="quan10">Quận 10</option>
						<option value="quan11">Quận 11</option>
						<option value="quan12">Quận 12</option>
						<!-- Add other options as needed -->
					</select>
				</div>
			</div>
			<div class="form-group col-6 float-end">
				<div class="box-input">
					<input class="box-input__main" type="text" id="phone" name="phone"
						placeholder="" maxlength="255" required autocomplete="off" /> <label
						for="phone">SỐ ĐIỆN THOẠI(*)</label>
					<div class="box-input__line"></div>
					<div class="box-input__err-validate"> </div>
				</div>
				<div class="form-group">
					<label for="city">TỈNH / THÀNH PHỐ</label> <select id="city"
						name="address">
						<option value="hcm">Hồ Chí Minh</option>
						<option value="hn">Hà Nội</option>
						<option value="hpg">Hải Phòng</option>
						<option value="dng">Đà Nẵng</option>
						<option value="cpt">Cần Thơ</option>
						<option value="angiang">An Giang</option>
						<option value="bariavungtau">Bà Rịa - Vũng Tàu</option>
						<option value="baclieu">Bạc Liêu</option>
						<option value="bacgiang">Bắc Giang</option>
						<option value="bacninh">Bắc Ninh</option>
						<option value="bentre">Bến Tre</option>
						<option value="binhduong">Bình Dương</option>
						<option value="binhdinh">Bình Định</option>
						<option value="binhphuoc">Bình Phước</option>
						<option value="binhthuan">Bình Thuận</option>
						<!-- Add other options as needed -->
					</select>
				</div>

			</div>
			<div class="form-group col-12 float-start" style="margin-top: -10px">
				<div class="box-input" style="margin-top: 0px">
					 <input class="box-input__main" type="text" id="soNha"
						name="address" placeholder="" maxlength="255" required
						autocomplete="off" /> <label for="soNha">Số nhà, tên
						đường</label>
					<div class="box-input__line"></div>
					<div class="box-input__err-validate"> </div>
				</div>
			</div>

			<input type="hidden" id="productIds" name="productIds" />

			<div class="summary">
				<p class="total">Tổng tiền tạm tính: ${allSUM}đ</p>
				<button type="submit" class="btn-submit">THANH TOÁN</button>
			</div>
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// Lấy form và nút submit
			var form = document.querySelector('form');
			var submitButton = document.querySelector('.btn-submit');

			// Thêm sự kiện khi nhấn nút thanh toán
			submitButton.addEventListener('click',
					function(event) {
						// Ngăn không cho form gửi dữ liệu ngay lập tức (để kiểm tra console log)

						// Lấy tất cả các label chứa ID sản phẩm
						var labels = document
								.querySelectorAll('.cart-item-info label');
						var ids = [];

						// Lặp qua các label và lấy giá trị ID
						labels.forEach(function(label) {
							var id = label.textContent.trim();
							if (id) {
								ids.push(id);
							}
						});

						// In các ID sản phẩm ra console
						console.log('Product IDs:', ids);

						// Cập nhật giá trị cho trường ẩn productIds
						document.getElementById('productIds').value = ids
								.join(',');

						// Gửi form sau khi kiểm tra console log
						form.submit();
					});
		});
	</script>
</body>
</html>
