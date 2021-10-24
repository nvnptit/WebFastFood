<%@ page pageEncoding="utf-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en">
    <c:set var="root" value="${pageContext.servletContext.contextPath}" />

    <head>
      <!-- Required meta tags-->
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

      <!-- Title Page-->
      <title>Dashboard</title>

      <!-- Fontfaces CSS-->
      <link href="${root}/resources/css/font-face.css" rel="stylesheet" media="all" />
      <link href="${root}/resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all" />
      <link href="${root}/resources/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all" />
      <link href="${root}/resources/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet"
        media="all" />

      <!-- Bootstrap CSS-->
      <link href="${root}/resources/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all" />

      <!-- Vendor CSS-->
      <link href="${root}/resources/vendor/animsition/animsition.min.css" rel="stylesheet" media="all" />
      <link href="${root}/resources/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet"
        media="all" />
      <link href="${root}/resources/vendor/wow/animate.css" rel="stylesheet" media="all" />
      <link href="${root}/resources/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all" />
      <link href="${root}/resources/vendor/slick/slick.css" rel="stylesheet" media="all" />
      <link href="${root}/resources/vendor/select2/select2.min.css" rel="stylesheet" media="all" />
      <link href="${root}/resources/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all" />

      <!-- Main CSS-->
      <link href="${root}/resources/css/theme.css" rel="stylesheet" media="all" />
    </head>

    <body class="animsition">
      <%
		Cookie[] cks = request.getCookies();
		if (cks != null) {
			for (int i = 0; i < cks.length; i++) {
				String name = cks[i].getName();
				String value = cks[i].getValue();
				if (name.equals("authadmin")) {
					break; // exit the loop and continue the page
				}
				if (i == (cks.length - 1)) // if all cookie are not valid redirect to error page
				{
					response.sendRedirect("login.htm");
					return; // to stop further execution
				}
				i++;
			}
		} else {
			response.sendRedirect("login.htm");
			return; // to stop further execution
		}
	%>

        <div class="page-wrapper">
          <!-- MENU SIDEBAR-->
          <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
              <a href="#">
                <img src="${root}/resources/images/logo.png" alt="Cool Admin" />
              </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
              <nav class="navbar-sidebar">
                <ul class="list-unstyled navbar__list">
                  <li>
                    <a class="js-arrow" href="index.htm">
                      <i class="fas fa-tachometer-alt"></i>Biểu đồ
                    </a>
                  </li>
                  <li class="has-sub">
                    <a class="js-arrow" href="#">
                      <i class="fas fa-table active"></i>Dữ liệu
                    </a>
                    <ul class="list-unstyled navbar__sub-list js-sub-list">
                      <li><a href="user.htm">Dữ liệu người dùng</a></li>
                      <li><a href="product.htm">Dữ liệu sản phẩm</a></li>
                    </ul>
                  </li>
                  <li class="has-sub">
                    <a class="js-arrow" href="#">
                      <i class="fa fa-cog fa-spin fa-sm fa-fw"></i>Chức năng
                    </a>
                    <ul class="list-unstyled navbar__sub-list js-sub-list">
                      <li><a href="form_user.htm">Người dùng</a></li>
                      <li><a href="form_product.htm">Sản phẩm</a></li>
                    </ul>
                  </li>
                </ul>
              </nav>
            </div>
          </aside>
          <!-- END MENU SIDEBAR-->

          <!-- PAGE CONTAINER-->
          <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
              <div class="section__content section__content--p30">
                <div class="container-fluid">
                  <div class="header-wrap">
                    <div class="form-header">
                      <input class="au-input au-input--xl" type="text" name="search"
                        placeholder="Tìm kiếm dữ liệu và báo cáo" />
                      <button class="au-btn--submit" type="submit">
                        <i class="zmdi zmdi-search"></i>
                      </button>
                    </div>
                    <div class="header-button">
                      <div class="noti-wrap">
                        <div class="noti__item js-item-menu">
                          <i class="zmdi zmdi-comment-more"></i>
                          <span class="quantity">1</span>
                          <div class="mess-dropdown js-dropdown">
                            <div class="mess__title">
                              <p>Bạn có 2 thông báo mới</p>
                            </div>
                            <div class="mess__item">
                              <div class="image img-cir img-40">
                                <img src="${root}/resources/images/icon/avatar-06.jpg" alt="Michelle Moreno" />
                              </div>
                              <div class="content">
                                <h6>Michelle Moreno</h6>
                                <p>Đã gửi cho bạn một ảnh</p>
                                <span class="time">3 phút trước</span>
                              </div>
                            </div>
                            <div class="mess__item">
                              <div class="image img-cir img-40">
                                <img src="${root}/resources/images/icon/avatar-04.jpg" alt="Diane Myers" />
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
                          <i class="zmdi zmdi-email"></i>
                          <span class="quantity">1</span>
                          <div class="email-dropdown js-dropdown">
                            <div class="email__title">
                              <p>Bạn có 3 Emails mới</p>
                            </div>
                            <div class="email__item">
                              <div class="image img-cir img-40">
                                <img src="${root}/resources/images/icon/avatar-06.jpg" alt="Cynthia Harvey" />
                              </div>
                              <div class="content">
                                <p>Về đề xuất mới.</p>
                                <span>Cynthia Harvey, 3 phút trước</span>
                              </div>
                            </div>
                            <div class="email__item">
                              <div class="image img-cir img-40">
                                <img src="${root}/resources/images/icon/avatar-05.jpg" alt="Cynthia Harvey" />
                              </div>
                              <div class="content">
                                <p>Về đề xuất mới.</p>
                                <span>Cynthia Harvey, Ngày hôm qua</span>
                              </div>
                            </div>
                            <div class="email__item">
                              <div class="image img-cir img-40">
                                <img src="${root}/resources/images/icon/avatar-04.jpg" alt="Cynthia Harvey" />
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
                          <i class="zmdi zmdi-notifications"></i>
                          <span class="quantity">3</span>
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
                              ${sessionScope['user1'].fullname}
                            </a>
                          </div>
                          <div class="account-dropdown js-dropdown">
                            <div class="info clearfix">
                              <div class="image">
                                <a href="#">
                                  <img src="${root}/resources/images/icon/avt.png" alt="${username}" />
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
                                <a href="#">
                                  <i class="zmdi zmdi-account"></i>Tài khoản
                                </a>
                              </div>
                              <div class="account-dropdown__item">
                                <a href="#">
                                  <i class="zmdi zmdi-settings"></i>Cài đặt
                                </a>
                              </div>
                              <div class="account-dropdown__item">
                                <a href="changepassword.htm">
                                  <i class="zmdi zmdi-money-box"></i>Thay đổi mật
                                  khẩu
                                </a>
                              </div>
                            </div>
                            <div class="account-dropdown__footer">
                              <a href="logout.htm">
                                <i class="zmdi zmdi-power"></i>Đăng xuất
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </header>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
              <div class="section__content section__content--p30">
                <div class="container-fluid">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="overview-wrap">
                        <h2 class="title-1">Báo cáo tổng quan</h2>
                        <button class="au-btn au-btn-icon au-btn--blue">
                          <i class="zmdi zmdi-plus"></i>Thêm báo cáo
                        </button>
                      </div>
                    </div>
                  </div>
                  <div class="row m-t-25">
                    <div class="col-sm-6 col-lg-3">
                      <div class="overview-item overview-item--c1">
                        <div class="overview__inner">
                          <div class="overview-box clearfix">
                            <div class="icon">
                              <i class="zmdi zmdi-account-o"></i>
                            </div>
                            <div class="text">
                              <h2>10368</h2>
                              <span>thành viên đang hoạt động</span>
                            </div>
                          </div>
                          <div class="overview-chart">
                            <canvas id="widgetChart1"></canvas>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                      <div class="overview-item overview-item--c2">
                        <div class="overview__inner">
                          <div class="overview-box clearfix">
                            <div class="icon">
                              <i class="zmdi zmdi-shopping-cart"></i>
                            </div>
                            <div class="text">
                              <h2>388,688</h2>
                              <span>Sản phẩm</span>
                            </div>
                          </div>
                          <div class="overview-chart">
                            <canvas id="widgetChart2"></canvas>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                      <div class="overview-item overview-item--c3">
                        <div class="overview__inner">
                          <div class="overview-box clearfix">
                            <div class="icon">
                              <i class="zmdi zmdi-calendar-note"></i>
                            </div>
                            <div class="text">
                              <h2>1,086</h2>
                              <span>Mỗi tuần</span>
                            </div>
                          </div>
                          <div class="overview-chart">
                            <canvas id="widgetChart3"></canvas>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                      <div class="overview-item overview-item--c4">
                        <div class="overview__inner">
                          <div class="overview-box clearfix">
                            <div class="icon">
                              <i class="zmdi zmdi-money"></i>
                            </div>
                            <div class="text">
                              <h2>$1,060,386</h2>
                              <span>Tổng thu nhập</span>
                            </div>
                          </div>
                          <div class="overview-chart">
                            <canvas id="widgetChart4"></canvas>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="au-card recent-report">
                        <div class="au-card-inner">
                          <h3 class="title-2">Báo cáo hiện tại</h3>
                          <div class="chart-info">
                            <div class="chart-info__left">
                              <div class="chart-note">
                                <span class="dot dot--blue"></span>
                                <span>Sản phẩm</span>
                              </div>
                              <div class="chart-note mr-0">
                                <span class="dot dot--green"></span>
                                <span>Dịch vụ</span>
                              </div>
                            </div>
                            <div class="chart-info__right">
                              <div class="chart-statis">
                                <span class="index incre">
                                  <i class="zmdi zmdi-long-arrow-up"></i>25%
                                </span>
                                <span class="label">Sản phẩm</span>
                              </div>
                              <div class="chart-statis mr-0">
                                <span class="index decre">
                                  <i class="zmdi zmdi-long-arrow-down"></i>10%
                                </span>
                                <span class="label">Dịch vụ</span>
                              </div>
                            </div>
                          </div>
                          <div class="recent-report__chart">
                            <canvas id="recent-rep-chart"></canvas>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="au-card chart-percent-card">
                        <div class="au-card-inner">
                          <h3 class="title-2 tm-b-5">Biểu đồ %</h3>
                          <div class="row no-gutters">
                            <div class="col-xl-6">
                              <div class="chart-note-wrap">
                                <div class="chart-note mr-0 d-block">
                                  <span class="dot dot--blue"></span>
                                  <span>Sản phẩm</span>
                                </div>
                                <div class="chart-note mr-0 d-block">
                                  <span class="dot dot--red"></span>
                                  <span>Dịch vụ</span>
                                </div>
                              </div>
                            </div>
                            <div class="col-xl-6">
                              <div class="percent-chart">
                                <canvas id="percent-chart"></canvas>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-9">
                      <h2 class="title-1 m-b-25">Thu nhập theo mặt hàng</h2>
                      <div class="table-responsive table--no-card m-b-40">
                        <table class="table table-borderless table-striped table-earning">
                          <thead>
                            <tr>
                              <th>Ngày tháng</th>
                              <th>Hoá đơn ID</th>
                              <th>Tên</th>
                              <th class="text-right">Giá</th>
                              <th class="text-right">Tổng số lượng</th>
                              <th class="text-right">Tổng tiền</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>2018-09-29 05:57</td>
                              <td>100398</td>
                              <td>iPhone X 64Gb Grey</td>
                              <td class="text-right">$999.00</td>
                              <td class="text-right">1</td>
                              <td class="text-right">$999.00</td>
                            </tr>
                            <tr>
                              <td>2018-09-28 01:22</td>
                              <td>100397</td>
                              <td>Samsung S8 Black</td>
                              <td class="text-right">$756.00</td>
                              <td class="text-right">1</td>
                              <td class="text-right">$756.00</td>
                            </tr>
                            <tr>
                              <td>2018-09-27 02:12</td>
                              <td>100396</td>
                              <td>Game Console Controller</td>
                              <td class="text-right">$22.00</td>
                              <td class="text-right">2</td>
                              <td class="text-right">$44.00</td>
                            </tr>
                            <tr>
                              <td>2018-09-26 23:06</td>
                              <td>100395</td>
                              <td>iPhone X 256Gb Black</td>
                              <td class="text-right">$1199.00</td>
                              <td class="text-right">1</td>
                              <td class="text-right">$1199.00</td>
                            </tr>
                            <tr>
                              <td>2018-09-25 19:03</td>
                              <td>100393</td>
                              <td>USB 3.0 Cable</td>
                              <td class="text-right">$10.00</td>
                              <td class="text-right">3</td>
                              <td class="text-right">$30.00</td>
                            </tr>
                            <tr>
                              <td>2018-09-29 05:57</td>
                              <td>100392</td>
                              <td>Smartwatch 4.0 LTE Wifi</td>
                              <td class="text-right">$199.00</td>
                              <td class="text-right">6</td>
                              <td class="text-right">$1494.00</td>
                            </tr>
                            <tr>
                              <td>2018-09-24 19:10</td>
                              <td>100391</td>
                              <td>Camera C430W 4k</td>
                              <td class="text-right">$699.00</td>
                              <td class="text-right">1</td>
                              <td class="text-right">$699.00</td>
                            </tr>
                            <tr>
                              <td>2018-09-22 00:43</td>
                              <td>100393</td>
                              <td>USB 3.0 Cable</td>
                              <td class="text-right">$10.00</td>
                              <td class="text-right">3</td>
                              <td class="text-right">$30.00</td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                    <div class="col-lg-3">
                      <h2 class="title-1 m-b-25">Các nước sử dụng nhiều</h2>
                      <div class="
                      au-card au-card--bg-blue
                      au-card-top-countries
                      m-b-40
                    ">
                        <div class="au-card-inner">
                          <div class="table-responsive">
                            <table class="table table-top-countries">
                              <tbody>
                                <tr>
                                  <td>United States</td>
                                  <td class="text-right">$119,366.96</td>
                                </tr>
                                <tr>
                                  <td>Australia</td>
                                  <td class="text-right">$70,261.65</td>
                                </tr>
                                <tr>
                                  <td>United Kingdom</td>
                                  <td class="text-right">$46,399.22</td>
                                </tr>
                                <tr>
                                  <td>Turkey</td>
                                  <td class="text-right">$35,364.90</td>
                                </tr>
                                <tr>
                                  <td>Germany</td>
                                  <td class="text-right">$20,366.96</td>
                                </tr>
                                <tr>
                                  <td>France</td>
                                  <td class="text-right">$10,366.96</td>
                                </tr>
                                <tr>
                                  <td>Australia</td>
                                  <td class="text-right">$5,366.96</td>
                                </tr>
                                <tr>
                                  <td>Italy</td>
                                  <td class="text-right">$1639.32</td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
                        <div class="au-card-title" style="
                        background-image: url('${root}/resources/images/bg-title-01.jpg');
                      ">
                          <div class="bg-overlay bg-overlay--blue"></div>
                          <h3>
                            <i class="zmdi zmdi-account-calendar"></i>26 April, 2021
                          </h3>
                          <button class="au-btn-plus">
                            <i class="zmdi zmdi-plus"></i>
                          </button>
                        </div>
                        <div class="au-task js-list-load">
                          <div class="au-task__title">
                            <p>Tasks for John Doe</p>
                          </div>
                          <div class="au-task-list js-scrollbar3">
                            <div class="au-task__item au-task__item--danger">
                              <div class="au-task__item-inner">
                                <h5 class="task">
                                  <a href="#">Meeting about plan for Admin Template 2021</a>
                                </h5>
                                <span class="time">10:00 AM</span>
                              </div>
                            </div>
                            <div class="au-task__item au-task__item--warning">
                              <div class="au-task__item-inner">
                                <h5 class="task">
                                  <a href="#">Create new task for Dashboard</a>
                                </h5>
                                <span class="time">11:00 AM</span>
                              </div>
                            </div>
                            <div class="au-task__item au-task__item--primary">
                              <div class="au-task__item-inner">
                                <h5 class="task">
                                  <a href="#">Meeting about plan for Admin Template 2021</a>
                                </h5>
                                <span class="time">02:00 PM</span>
                              </div>
                            </div>
                            <div class="au-task__item au-task__item--success">
                              <div class="au-task__item-inner">
                                <h5 class="task">
                                  <a href="#">Create new task for Dashboard</a>
                                </h5>
                                <span class="time">03:30 PM</span>
                              </div>
                            </div>
                            <div class="
                            au-task__item au-task__item--danger
                            js-load-item
                          ">
                              <div class="au-task__item-inner">
                                <h5 class="task">
                                  <a href="#">Meeting about plan for Admin Template 2021</a>
                                </h5>
                                <span class="time">10:00 AM</span>
                              </div>
                            </div>
                            <div class="
                            au-task__item au-task__item--warning
                            js-load-item
                          ">
                              <div class="au-task__item-inner">
                                <h5 class="task">
                                  <a href="#">Tạo nhiệm vụ mới cho trang bảng biểu</a>
                                </h5>
                                <span class="time">11:00 AM</span>
                              </div>
                            </div>
                          </div>
                          <div class="au-task__footer">
                            <button class="au-btn au-btn-load js-load-btn">
                              Xem nhiều hơn
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
                        <div class="au-card-title" style="
                        background-image: url('${root}/resources/images/bg-title-02.jpg');
                      ">
                          <div class="bg-overlay bg-overlay--blue"></div>
                          <h3>
                            <i class="zmdi zmdi-comment-text"></i>Tin nhắn mới
                          </h3>
                          <button class="au-btn-plus">
                            <i class="zmdi zmdi-plus"></i>
                          </button>
                        </div>
                        <div class="au-inbox-wrap js-inbox-wrap">
                          <div class="au-message js-list-load">
                            <div class="au-message__noti">
                              <p>Bạn có <span>2</span> tin nhắn mới</p>
                            </div>
                            <div class="au-message-list">
                              <div class="au-message__item unread">
                                <div class="au-message__item-inner">
                                  <div class="au-message__item-text">
                                    <div class="avatar-wrap">
                                      <div class="avatar">
                                        <img src="${root}/resources/images/icon/avatar-02.jpg" alt="John Smith" />
                                      </div>
                                    </div>
                                    <div class="text">
                                      <h5 class="name">John Smith</h5>
                                      <p>Đã gửi cho bạn một ảnh</p>
                                    </div>
                                  </div>
                                  <div class="au-message__item-time">
                                    <span>12 phút trước</span>
                                  </div>
                                </div>
                              </div>
                              <div class="au-message__item unread">
                                <div class="au-message__item-inner">
                                  <div class="au-message__item-text">
                                    <div class="avatar-wrap online">
                                      <div class="avatar">
                                        <img src="${root}/resources/images/icon/avatar-03.jpg"
                                          alt="Nicholas Martinez" />
                                      </div>
                                    </div>
                                    <div class="text">
                                      <h5 class="name">Nicholas Martinez</h5>
                                      <p>Bạn có một tin nhắn</p>
                                    </div>
                                  </div>
                                  <div class="au-message__item-time">
                                    <span>11:00 PM</span>
                                  </div>
                                </div>
                              </div>
                              <div class="au-message__item">
                                <div class="au-message__item-inner">
                                  <div class="au-message__item-text">
                                    <div class="avatar-wrap online">
                                      <div class="avatar">
                                        <img src="${root}/resources/images/icon/avatar-04.jpg" alt="Michelle Sims" />
                                      </div>
                                    </div>
                                    <div class="text">
                                      <h5 class="name">Michelle Sims</h5>
                                      <p>Lorem ipsum dolor sit amet</p>
                                    </div>
                                  </div>
                                  <div class="au-message__item-time">
                                    <span> Ngày hôm qua</span>
                                  </div>
                                </div>
                              </div>
                              <div class="au-message__item">
                                <div class="au-message__item-inner">
                                  <div class="au-message__item-text">
                                    <div class="avatar-wrap">
                                      <div class="avatar">
                                        <img src="${root}/resources/images/icon/avatar-05.jpg" alt="Michelle Sims" />
                                      </div>
                                    </div>
                                    <div class="text">
                                      <h5 class="name">Michelle Sims</h5>
                                      <p>Purus feugiat finibus</p>
                                    </div>
                                  </div>
                                  <div class="au-message__item-time">
                                    <span>Chủ nhật</span>
                                  </div>
                                </div>
                              </div>
                              <div class="au-message__item js-load-item">
                                <div class="au-message__item-inner">
                                  <div class="au-message__item-text">
                                    <div class="avatar-wrap online">
                                      <div class="avatar">
                                        <img src="${root}/resources/images/icon/avatar-04.jpg" alt="Michelle Sims" />
                                      </div>
                                    </div>
                                    <div class="text">
                                      <h5 class="name">Michelle Sims</h5>
                                      <p>Lorem ipsum dolor sit amet</p>
                                    </div>
                                  </div>
                                  <div class="au-message__item-time">
                                    <span>Ngày hôm qua</span>
                                  </div>
                                </div>
                              </div>
                              <div class="au-message__item js-load-item">
                                <div class="au-message__item-inner">
                                  <div class="au-message__item-text">
                                    <div class="avatar-wrap">
                                      <div class="avatar">
                                        <img src="${root}/resources/images/icon/avatar-05.jpg" alt="Michelle Sims" />
                                      </div>
                                    </div>
                                    <div class="text">
                                      <h5 class="name">Michelle Sims</h5>
                                      <p>Purus feugiat finibus</p>
                                    </div>
                                  </div>
                                  <div class="au-message__item-time">
                                    <span>Chủ nhật</span>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="au-message__footer">
                              <button class="au-btn au-btn-load js-load-btn">
                                Xem nhiều hơn
                              </button>
                            </div>
                          </div>
                          <div class="au-chat">
                            <div class="au-chat__title">
                              <div class="au-chat-info">
                                <div class="avatar-wrap online">
                                  <div class="avatar avatar--small">
                                    <img src="${root}/resources/images/icon/avatar-02.jpg" alt="John Smith" />
                                  </div>
                                </div>
                                <span class="nick">
                                  <a href="#">John Smith</a>
                                </span>
                              </div>
                            </div>
                            <div class="au-chat__content">
                              <div class="recei-mess-wrap">
                                <span class="mess-time">12 phút trước</span>
                                <div class="recei-mess__inner">
                                  <div class="avatar avatar--tiny">
                                    <img src="${root}/resources/images/icon/avatar-02.jpg" alt="John Smith" />
                                  </div>
                                  <div class="recei-mess-list">
                                    <div class="recei-mess">
                                      Lorem ipsum dolor sit amet, consectetur
                                      adipiscing elit non iaculis
                                    </div>
                                    <div class="recei-mess">
                                      Donec tempor, sapien ac viverra
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="send-mess-wrap">
                                <span class="mess-time">30 Sec ago</span>
                                <div class="send-mess__inner">
                                  <div class="send-mess-list">
                                    <div class="send-mess">
                                      Lorem ipsum dolor sit amet, consectetur
                                      adipiscing elit non iaculis
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="au-chat-textfield">
                              <form class="au-form-icon">
                                <input class="au-input au-input--full au-input--h65" type="text"
                                  placeholder="lời nhắn" />
                                <button class="au-input-icon">
                                  <i class="zmdi zmdi-camera"></i>
                                </button>
                              </form>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="copyright">
                        <p>
                          Copyright © 2021 Colorlib. All rights reserved. Template
                          by <a href="https://colorlib.com">Colorlib</a>.
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
          </div>
        </div>

        <!-- Jquery JS-->
        <script src="${root}/resources/vendor/jquery-3.2.1.min.js"></script>
        <!-- Bootstrap JS-->
        <script src="${root}/resources/vendor/bootstrap-4.1/popper.min.js"></script>
        <script src="${root}/resources/vendor/bootstrap-4.1/bootstrap.min.js"></script>
        <!-- Vendor JS       -->
        <script src="${root}/resources/vendor/slick/slick.min.js"></script>
        <script src="${root}/resources/vendor/wow/wow.min.js"></script>
        <script src="${root}/resources/vendor/animsition/animsition.min.js"></script>
        <script src="${root}/resources/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
        <script src="${root}/resources/vendor/counter-up/jquery.waypoints.min.js"></script>
        <script src="${root}/resources/vendor/counter-up/jquery.counterup.min.js"></script>
        <script src="${root}/resources/vendor/circle-progress/circle-progress.min.js"></script>
        <script src="${root}/resources/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="${root}/resources/vendor/chartjs/Chart.bundle.min.js"></script>
        <script src="${root}/resources/vendor/select2/select2.min.js"></script>

        <!-- Main JS-->
        <script src="${root}/resources/js/main_admin.js"></script>
    </body>

    </html>
    <!-- end document-->