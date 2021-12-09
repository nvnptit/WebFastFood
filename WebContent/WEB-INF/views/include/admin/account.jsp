<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<button class="au-btn au-btn-icon au-btn--blue" onclick="location.href='${root}/home/index.htm';">
	<i class="zmdi zmdi-home"></i>Đến trang người dùng
</button>
<div class="header-button">

	<div class="noti-wrap">
		<div class="noti__item js-item-menu">
			<i class="zmdi zmdi-comment-more"></i> <span class="quantity">1</span>

			<div class="mess-dropdown js-dropdown">
				<div class="mess__title">
					<p>Bạn có 2 thông báo mới</p>
				</div>
				<div class="mess__item">
					<div class="image img-cir img-40">
						<img src="${root}/resources/images/icon/avatar-06.jpg"
							alt="Michelle Moreno" />
					</div>
					<div class="content">
						<h6>Michelle Moreno</h6>
						<p>Đã gửi cho bạn một ảnh</p>
						<span class="time">3 phút trước</span>
					</div>
				</div>
				<div class="mess__item">
					<div class="image img-cir img-40">
						<img src="${root}/resources/images/icon/avatar-04.jpg"
							alt="Diane Myers" />
					</div>
					<div class="content">
						<h6>Diane Myers</h6>
						<p>Bạn có một tin nhắn</p>
						<span class="time">Ngày hôm qua</span>
					</div>
				</div>
				<div class="mess__footer">
					<a href="#">Xem tất cả tin nhắn</a>
				</div>
			</div>
		</div>
		<div class="noti__item js-item-menu">
			<i class="zmdi zmdi-email"></i> <span class="quantity">1</span>
			<div class="email-dropdown js-dropdown">
				<div class="email__title">
					<p>Bạn có 3 Emails mới</p>
				</div>
				<div class="email__item">
					<div class="image img-cir img-40">
						<img src="${root}/resources/images/icon/avatar-06.jpg"
							alt="Cynthia Harvey" />
					</div>
					<div class="content">
						<p>Về đề xuất mới.</p>
						<span>Cynthia Harvey, 3 phút trước</span>
					</div>
				</div>
				<div class="email__item">
					<div class="image img-cir img-40">
						<img src="${root}/resources/images/icon/avatar-05.jpg"
							alt="Cynthia Harvey" />
					</div>
					<div class="content">
						<p>Về đề xuất mới.</p>
						<span>Cynthia Harvey, Ngày hôm qua</span>
					</div>
				</div>
				<div class="email__item">
					<div class="image img-cir img-40">
						<img src="${root}/resources/images/icon/avatar-04.jpg"
							alt="Cynthia Harvey" />
					</div>
					<div class="content">
						<p>Về đề xuất mới.</p>
						<span>Cynthia Harvey, April 12,,2018</span>
					</div>
				</div>
				<div class="email__footer">
					<a href="#">See all emails</a>
				</div>
			</div>
		</div>
		<div class="noti__item js-item-menu">
			<i class="zmdi zmdi-notifications"></i> <span class="quantity">3</span>
			<div class="notifi-dropdown js-dropdown">
				<div class="notifi__title">
					<p>Bạn có 3 thông báo mới</p>
				</div>
				<div class="notifi__item">
					<div class="bg-c1 img-cir img-40">
						<i class="zmdi zmdi-email-open"></i>
					</div>
					<div class="content">
						<p>bạn có thông báo Email</p>
						<span class="date">October 12, 2021 06:50</span>
					</div>
				</div>
				<div class="notifi__item">
					<div class="bg-c2 img-cir img-40">
						<i class="zmdi zmdi-account-box"></i>
					</div>
					<div class="content">
						<p>Tài khoản của bạn đã bị khoá</p>
						<span class="date">October 12, 2021 06:50</span>
					</div>
				</div>
				<div class="notifi__item">
					<div class="bg-c3 img-cir img-40">
						<i class="zmdi zmdi-file-text"></i>
					</div>
					<div class="content">
						<p>Bạn có dữ liệu mới</p>
						<span class="date">October 12, 2021 06:50</span>
					</div>
				</div>
				<div class="notifi__footer">
					<a href="#">Tất cả thông báo</a>
				</div>
			</div>
		</div>
	</div>
	<div class="account-wrap">
		<div class="account-item clearfix js-item-menu">
			<div class="image">
				<img src="${root}/resources/images/icon/avt.png" alt="${username}" />
			</div>
			<div class="content">
				<a class="js-acc-btn" href="#">
					${sessionScope['user1'].fullname} </a>
			</div>
			<div class="account-dropdown js-dropdown">
				<div class="info clearfix">
					<div class="image">
						<a href="#"> <img src="${root}/resources/images/icon/avt.png"
							alt="${username}" />
						</a>
					</div>
					<div class="content">
						<h5 class="name">
							<a href="">${sessionScope['user1'].phone}</a>
						</h5>
						<span class="email">${sessionScope['user1'].email}</span>
					</div>
				</div>
				<div class="account-dropdown__body">
					<div class="account-dropdown__item">
						<a href="#"> <i class="zmdi zmdi-account"></i>Tài khoản
						</a>
					</div>
					<div class="account-dropdown__item">
						<a href="#"> <i class="zmdi zmdi-settings"></i>Cài đặt
						</a>
					</div>
					<div class="account-dropdown__item">
						<a href="changepassword.htm"> <i class="zmdi zmdi-money-box"></i>Thay
							đổi mật khẩu
						</a>
					</div>
				</div>
				<div class="account-dropdown__footer">
					<a href="${root}/admin/logout.htm"> <i class="zmdi zmdi-power"></i>Đăng
						xuất
					</a>
				</div>
			</div>
		</div>
	</div>
</div>