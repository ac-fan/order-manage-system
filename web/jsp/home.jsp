<%--
  Created by IntelliJ IDEA.
  User: sveir
  Date: 2020/10/13
  Time: 08:50
--%>

<%@ page import="com.qst.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>用户中心 | 订单管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"/>
    <link href="${pageContext.request.contextPath }/static/fullcalendar/fullcalendar.bundle.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath }/static/css/plugins.bundle.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/static/css/style.bundle.css" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/static/images/favicon.ico"/>
</head>
<body id="kt_body" class="header-fixed header-mobile-fixed subheader-enabled page-loading">
<div id="kt_header_mobile" class="header-mobile  header-mobile-fixed ">
    <!--begin::Logo-->
    <a href="/"><img alt="Logo" src="${pageContext.request.contextPath }/static/images/logo-letter-1.png" class="logo-default max-h-30px"/></a>
    <!--end::Logo-->
    <!--begin::Toolbar-->
    <div class="d-flex align-items-center">
        <!--begin::Aside Mobile Toggle-->
        <button class="btn p-0 burger-icon burger-icon-left" id="kt_aside_mobile_toggle">
            <span></span>
        </button>
        <!--end::Aside Mobile Toggle-->

        <!--begin::Header Menu Mobile Toggle-->
        <button class="btn p-0 burger-icon ml-4" id="kt_header_mobile_toggle">
            <span></span>
        </button>
        <!--end::Header Menu Mobile Toggle-->

        <!--begin::Topbar Mobile Toggle-->
        <button class="btn btn-hover-text-primary p-0 ml-2" id="kt_header_mobile_topbar_toggle">
			<span class="svg-icon svg-icon-xl"><!--begin::Svg Icon | path:assets/media/svg/icons/General/User.svg--><svg
                    xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
                    height="24px" viewBox="0 0 24 24" version="1.1">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <polygon points="0 0 24 0 24 24 0 24"/>
        <path d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z"
              fill="#000000" fill-rule="nonzero" opacity="0.3"/>
        <path d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z"
              fill="#000000" fill-rule="nonzero"/>
    </g>
</svg><!--end::Svg Icon--></span></button>
        <!--end::Topbar Mobile Toggle-->
    </div>
    <!--end::Toolbar-->
</div>
<%--begin::页面主体内容--%>
<div class="d-flex flex-column flex-root">
    <div class="d-flex flex-row flex-column-fluid page">
        <!--begin::左侧导航栏-->
        <div class="aside aside-left d-flex flex-column " id="kt_aside">
            <!--begin::头部 logo-->
            <div class="aside-brand d-flex flex-column align-items-center flex-column-auto py-4 py-lg-8">
                <!--begin::Logo-->
                <a href="/">
                    <img alt="Logo" src="${pageContext.request.contextPath }/static/images/logo-letter-1.png" class="max-h-30px"/>
                </a>
                <!--end::Logo-->
            </div>
            <!--end::头部 logo-->
            <!--begin::快捷菜单-->
            <div class="aside-nav d-flex flex-column align-items-center flex-column-fluid pt-7">
                <ul class="nav flex-column">
                    <li class="nav-item mb-5" data-toggle="tooltip" data-placement="right" data-container="body"
                        data-boundary="window" title="用户中心">
                        <a href="/jsp/home.jsp" class="nav-link btn btn-icon btn-clean btn-icon-white btn-lg active">
                            <i class="flaticon2-protection icon-lg"></i>
                        </a>
                    </li>
                    <li class="nav-item mb-5" data-toggle="tooltip" data-placement="right" data-container="body"
                        data-boundary="window" title="订单管理">
                        <a href="${pageContext.request.contextPath }/jsp/bill.do?method=query" class="nav-link btn btn-icon btn-icon-white btn-lg">
                            <i class="flaticon2-list-3 icon-lg"></i>
                        </a>
                    </li>
                    <li class="nav-item mb-5" data-toggle="tooltip" data-placement="right" data-container="body"
                        data-boundary="window" title="供应商管理">
                        <a href="${pageContext.request.contextPath }/jsp/provider.do?method=query" class="nav-link btn btn-icon btn-icon-white btn-lg">
                            <i class="flaticon2-calendar-6 icon-lg"></i>
                        </a>
                    </li>
                    <li class="nav-item mb-5" data-toggle="tooltip" data-placement="right" data-container="body"
                        data-boundary="window" title="用户管理">
                        <a href="${pageContext.request.contextPath }/jsp/user.do?method=query" class="nnav-link btn btn-icon btn-icon-white btn-lg">
                            <i class="flaticon2-analytics-2 icon-lg"></i>
                        </a>
                    </li>
                    <li class="nav-item mb-5" data-toggle="tooltip" data-placement="right" data-container="body"
                        data-boundary="window" title="修改密码">
                        <a href="${pageContext.request.contextPath }/jsp/pwdmodify.jsp" class="nav-link btn btn-icon btn-icon-white btn-lg">
                            <i class="flaticon2-hourglass-1 icon-lg"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <!--end::快捷菜单-->
        </div>
        <!--end::左侧导航栏-->
        <!--begin::右侧页面框架-->
        <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
            <!--begin::页面头部-->
            <div id="kt_header" class="header bg-white  header-fixed ">
                <!--begin::Container-->
                <div class=" container-fluid  d-flex align-items-stretch justify-content-between">
                    <!--begin::Left-->
                    <div class="d-flex align-items-stretch mr-2">
                        <!--begin::Page Title-->
                        <h3 class="d-none text-dark d-lg-flex align-items-center mr-10 mb-0">
                            订单管理系统</h3>
                        <!--end::Page Title-->

                        <!--begin::Header Menu Wrapper-->
                        <div class="header-menu-wrapper header-menu-wrapper-left" id="kt_header_menu_wrapper"></div>
                        <!--end::Header Menu Wrapper-->
                    </div>
                    <!--end::Left-->

                    <!--begin::Topbar-->
                    <div class="topbar">
                        <!--begin::User-->
                        <div class="topbar-item">
                            <div class="btn btn-icon w-auto btn-clean d-flex align-items-center btn-lg px-2"
                                 id="kt_quick_user_toggle">
                                <div class="d-flex flex-column text-right pr-3">
                                    <span class="text-muted font-weight-bold font-size-base d-none d-md-inline">${userSession.userName }</span>
                                    <span class="text-dark-75 font-weight-bolder font-size-base d-none d-md-inline">${userSession.userRole }</span>
                                </div>
                                <span class="symbol symbol-35 symbol-light-primary">
                                    <span class="symbol-label font-size-h5 font-weight-bold">头像</span>
					            </span>
                            </div>
                        </div>
                        <!--end::User-->
                    </div>
                    <!--end::Topbar-->
                </div>
                <!--end::Container-->
            </div>
            <!--end::页面头部-->

            <!--begin::页面内容-->
            <div class="content  d-flex flex-column flex-column-fluid" id="kt_content">
                <!--begin::Subheader-->
                <div class="subheader py-2 py-lg-6  subheader-transparent " id="kt_subheader">
                    <div class=" container  d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                        <!--begin::Info-->
                        <div class="d-flex align-items-center flex-wrap mr-1">
                            <!--begin::Page Heading-->
                            <div class="d-flex align-items-baseline flex-wrap mr-5">
                                <h5 class="text-dark font-weight-bold my-1 mr-5">订单管理系统</h5>
                            </div>
                            <!--end::Page Heading-->
                        </div>
                        <!--end::Info-->
                    </div>
                </div>
                <!--end::Subheader-->
                <!--begin::Entry-->
                <div class="d-flex flex-column-fluid">
                    <!--begin::Container-->
                    <div class=" container ">
                        <!--begin::Dashboard-->
                        <!--begin::Row-->
                        <div class="row">
                            <div class="col-lg-6 col-xxl-4">
                                <!--begin::Mixed Widget 1-->
                                <div class="card card-custom bg-gray-100 card-stretch gutter-b">
                                    <!--begin::Header-->
                                    <div class="card-header border-0 bg-danger py-5">
                                        <h3 class="card-title font-weight-bolder text-white">Sales Stat</h3>
                                        <div class="card-toolbar">
                                            <div class="dropdown dropdown-inline">
                                                <a href="#"
                                                   class="btn btn-transparent-white btn-sm font-weight-bolder dropdown-toggle px-5"
                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Export
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                                    <!--begin::Navigation-->
                                                    <ul class="navi navi-hover">
                                                        <li class="navi-header pb-1">
                                                            <span class="text-primary text-uppercase font-weight-bold font-size-sm">Add new:</span>
                                                        </li>
                                                        <li class="navi-item">
                                                            <a href="#" class="navi-link">
                                                                <span class="navi-icon"><i
                                                                        class="flaticon2-shopping-cart-1"></i></span>
                                                                <span class="navi-text">Order</span>
                                                            </a>
                                                        </li>
                                                        <li class="navi-item">
                                                            <a href="#" class="navi-link">
                                                                <span class="navi-icon"><i
                                                                        class="flaticon2-calendar-8"></i></span>
                                                                <span class="navi-text">Event</span>
                                                            </a>
                                                        </li>
                                                        <li class="navi-item">
                                                            <a href="#" class="navi-link">
                                                                <span class="navi-icon"><i
                                                                        class="flaticon2-graph-1"></i></span>
                                                                <span class="navi-text">Report</span>
                                                            </a>
                                                        </li>
                                                        <li class="navi-item">
                                                            <a href="#" class="navi-link">
                                                                <span class="navi-icon"><i
                                                                        class="flaticon2-rocket-1"></i></span>
                                                                <span class="navi-text">Post</span>
                                                            </a>
                                                        </li>
                                                        <li class="navi-item">
                                                            <a href="#" class="navi-link">
                                                                <span class="navi-icon"><i
                                                                        class="flaticon2-writing"></i></span>
                                                                <span class="navi-text">File</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                    <!--end::Navigation-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end::Header-->

                                    <!--begin::Body-->
                                    <div class="card-body p-0 position-relative overflow-hidden">
                                        <!--begin::Chart-->
                                        <div id="kt_mixed_widget_1_chart" class="card-rounded-bottom bg-danger"
                                             style="height: 200px"></div>
                                        <!--end::Chart-->

                                        <!--begin::Stats-->
                                        <div class="card-spacer mt-n25">
                                            <!--begin::Row-->
                                            <div class="row m-0">
                                                <div class="col bg-light-warning px-6 py-8 rounded-xl mr-7 mb-7">
                    <span class="svg-icon svg-icon-3x svg-icon-warning d-block my-2"><!--begin::Svg Icon | path:assets/media/svg/icons/Media/Equalizer.svg--><svg
                            xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
                            height="24px" viewBox="0 0 24 24" version="1.1">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <rect x="0" y="0" width="24" height="24"/>
        <rect fill="#000000" opacity="0.3" x="13" y="4" width="3" height="16" rx="1.5"/>
        <rect fill="#000000" x="8" y="9" width="3" height="11" rx="1.5"/>
        <rect fill="#000000" x="18" y="11" width="3" height="9" rx="1.5"/>
        <rect fill="#000000" x="3" y="13" width="3" height="7" rx="1.5"/>
    </g>
</svg><!--end::Svg Icon--></span> <a href="#" class="text-warning font-weight-bold font-size-h6">
                                                    Weekly Sales
                                                </a>
                                                </div>
                                                <div class="col bg-light-primary px-6 py-8 rounded-xl mb-7">
                    <span class="svg-icon svg-icon-3x svg-icon-primary d-block my-2"><!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Add-user.svg--><svg
                            xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
                            height="24px" viewBox="0 0 24 24" version="1.1">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <polygon points="0 0 24 0 24 24 0 24"/>
        <path d="M18,8 L16,8 C15.4477153,8 15,7.55228475 15,7 C15,6.44771525 15.4477153,6 16,6 L18,6 L18,4 C18,3.44771525 18.4477153,3 19,3 C19.5522847,3 20,3.44771525 20,4 L20,6 L22,6 C22.5522847,6 23,6.44771525 23,7 C23,7.55228475 22.5522847,8 22,8 L20,8 L20,10 C20,10.5522847 19.5522847,11 19,11 C18.4477153,11 18,10.5522847 18,10 L18,8 Z M9,11 C6.790861,11 5,9.209139 5,7 C5,4.790861 6.790861,3 9,3 C11.209139,3 13,4.790861 13,7 C13,9.209139 11.209139,11 9,11 Z"
              fill="#000000" fill-rule="nonzero" opacity="0.3"/>
        <path d="M0.00065168429,20.1992055 C0.388258525,15.4265159 4.26191235,13 8.98334134,13 C13.7712164,13 17.7048837,15.2931929 17.9979143,20.2 C18.0095879,20.3954741 17.9979143,21 17.2466999,21 C13.541124,21 8.03472472,21 0.727502227,21 C0.476712155,21 -0.0204617505,20.45918 0.00065168429,20.1992055 Z"
              fill="#000000" fill-rule="nonzero"/>
    </g>
</svg><!--end::Svg Icon--></span> <a href="#" class="text-primary font-weight-bold font-size-h6 mt-2">
                                                    New Users
                                                </a>
                                                </div>
                                            </div>
                                            <!--end::Row-->
                                            <!--begin::Row-->
                                            <div class="row m-0">
                                                <div class="col bg-light-danger px-6 py-8 rounded-xl mr-7">
                    <span class="svg-icon svg-icon-3x svg-icon-danger d-block my-2"><!--begin::Svg Icon | path:assets/media/svg/icons/Design/Layers.svg--><svg
                            xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
                            height="24px" viewBox="0 0 24 24" version="1.1">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <polygon points="0 0 24 0 24 24 0 24"/>
        <path d="M12.9336061,16.072447 L19.36,10.9564761 L19.5181585,10.8312381 C20.1676248,10.3169571 20.2772143,9.3735535 19.7629333,8.72408713 C19.6917232,8.63415859 19.6104327,8.55269514 19.5206557,8.48129411 L12.9336854,3.24257445 C12.3871201,2.80788259 11.6128799,2.80788259 11.0663146,3.24257445 L4.47482784,8.48488609 C3.82645598,9.00054628 3.71887192,9.94418071 4.23453211,10.5925526 C4.30500305,10.6811601 4.38527899,10.7615046 4.47382636,10.8320511 L4.63,10.9564761 L11.0659024,16.0730648 C11.6126744,16.5077525 12.3871218,16.5074963 12.9336061,16.072447 Z"
              fill="#000000" fill-rule="nonzero"/>
        <path d="M11.0563554,18.6706981 L5.33593024,14.122919 C4.94553994,13.8125559 4.37746707,13.8774308 4.06710397,14.2678211 C4.06471678,14.2708238 4.06234874,14.2738418 4.06,14.2768747 L4.06,14.2768747 C3.75257288,14.6738539 3.82516916,15.244888 4.22214834,15.5523151 C4.22358765,15.5534297 4.2250303,15.55454 4.22647627,15.555646 L11.0872776,20.8031356 C11.6250734,21.2144692 12.371757,21.2145375 12.909628,20.8033023 L19.7677785,15.559828 C20.1693192,15.2528257 20.2459576,14.6784381 19.9389553,14.2768974 C19.9376429,14.2751809 19.9363245,14.2734691 19.935,14.2717619 L19.935,14.2717619 C19.6266937,13.8743807 19.0546209,13.8021712 18.6572397,14.1104775 C18.654352,14.112718 18.6514778,14.1149757 18.6486172,14.1172508 L12.9235044,18.6705218 C12.377022,19.1051477 11.6029199,19.1052208 11.0563554,18.6706981 Z"
              fill="#000000" opacity="0.3"/>
    </g>
</svg><!--end::Svg Icon--></span> <a href="#" class="text-danger font-weight-bold font-size-h6 mt-2">
                                                    Item Orders
                                                </a>
                                                </div>
                                                <div class="col bg-light-success px-6 py-8 rounded-xl">
                    <span class="svg-icon svg-icon-3x svg-icon-success d-block my-2"><!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Urgent-mail.svg--><svg
                            xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
                            height="24px" viewBox="0 0 24 24" version="1.1">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <rect x="0" y="0" width="24" height="24"/>
        <path d="M12.7037037,14 L15.6666667,10 L13.4444444,10 L13.4444444,6 L9,12 L11.2222222,12 L11.2222222,14 L6,14 C5.44771525,14 5,13.5522847 5,13 L5,3 C5,2.44771525 5.44771525,2 6,2 L18,2 C18.5522847,2 19,2.44771525 19,3 L19,13 C19,13.5522847 18.5522847,14 18,14 L12.7037037,14 Z"
              fill="#000000" opacity="0.3"/>
        <path d="M9.80428954,10.9142091 L9,12 L11.2222222,12 L11.2222222,16 L15.6666667,10 L15.4615385,10 L20.2072547,6.57253826 C20.4311176,6.4108595 20.7436609,6.46126971 20.9053396,6.68513259 C20.9668779,6.77033951 21,6.87277228 21,6.97787787 L21,17 C21,18.1045695 20.1045695,19 19,19 L5,19 C3.8954305,19 3,18.1045695 3,17 L3,6.97787787 C3,6.70173549 3.22385763,6.47787787 3.5,6.47787787 C3.60510559,6.47787787 3.70753836,6.51099993 3.79274528,6.57253826 L9.80428954,10.9142091 Z"
              fill="#000000"/>
    </g>
</svg><!--end::Svg Icon--></span> <a href="#" class="text-success font-weight-bold font-size-h6 mt-2">
                                                    Bug Reports
                                                </a>
                                                </div>
                                            </div>
                                            <!--end::Row-->
                                        </div>
                                        <!--end::Stats-->
                                    </div>
                                    <!--end::Body-->
                                </div>
                                <!--end::Mixed Widget 1-->
                            </div>
                            <div class="col-lg-6 col-xxl-4">
                                <!--begin::List Widget 9-->
                                <div class="card card-custom card-stretch gutter-b">
                                    <!--begin::Header-->
                                    <div class="card-header align-items-center border-0 mt-4">
                                        <h3 class="card-title align-items-start flex-column">
                                            <span class="font-weight-bolder text-dark">My Activity</span>
                                            <span class="text-muted mt-3 font-weight-bold font-size-sm">890,344 Sales</span>
                                        </h3>
                                        <div class="card-toolbar">
                                            <div class="dropdown dropdown-inline">
                                                <a href="#"
                                                   class="btn btn-clean btn-hover-light-primary btn-sm btn-icon"
                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="ki ki-bold-more-hor"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-md dropdown-menu-right">
                                                    <!--begin::Navigation-->
                                                    <ul class="navi navi-hover">
                                                        <li class="navi-header font-weight-bold py-4">
                                                            <span class="font-size-lg">Choose Label:</span>
                                                            <i class="flaticon2-information icon-md text-muted"
                                                               data-toggle="tooltip" data-placement="right"
                                                               title="Click to learn more..."></i>
                                                        </li>
                                                        <li class="navi-separator mb-3 opacity-70"></li>
                                                        <li class="navi-item">
                                                            <a href="#" class="navi-link">
            <span class="navi-text">
                <span class="label label-xl label-inline label-light-success">Customer</span>
            </span>
                                                            </a>
                                                        </li>
                                                        <li class="navi-item">
                                                            <a href="#" class="navi-link">
            <span class="navi-text">
                <span class="label label-xl label-inline label-light-danger">Partner</span>
            </span>
                                                            </a>
                                                        </li>
                                                        <li class="navi-item">
                                                            <a href="#" class="navi-link">
            <span class="navi-text">
                <span class="label label-xl label-inline label-light-warning">Suplier</span>
            </span>
                                                            </a>
                                                        </li>
                                                        <li class="navi-item">
                                                            <a href="#" class="navi-link">
            <span class="navi-text">
                <span class="label label-xl label-inline label-light-primary">Member</span>
            </span>
                                                            </a>
                                                        </li>
                                                        <li class="navi-item">
                                                            <a href="#" class="navi-link">
            <span class="navi-text">
                <span class="label label-xl label-inline label-light-dark">Staff</span>
            </span>
                                                            </a>
                                                        </li>
                                                        <li class="navi-separator mt-3 opacity-70"></li>
                                                        <li class="navi-footer py-4">
                                                            <a class="btn btn-clean font-weight-bold btn-sm" href="#">
                                                                <i class="ki ki-plus icon-sm"></i>
                                                                Add new
                                                            </a>
                                                        </li>
                                                    </ul>
                                                    <!--end::Navigation-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end::Header-->

                                    <!--begin::Body-->
                                    <div class="card-body pt-4">
                                        <div class="timeline timeline-5 mt-3">
                                            <!--begin::Item-->
                                            <div class="timeline-item align-items-start">
                                                <!--begin::Label-->
                                                <div class="timeline-label font-weight-bolder text-dark-75 font-size-lg">
                                                    08:42
                                                </div>
                                                <!--end::Label-->

                                                <!--begin::Badge-->
                                                <div class="timeline-badge">
                                                    <i class="fa fa-genderless text-warning icon-xl"></i>
                                                </div>
                                                <!--end::Badge-->

                                                <!--begin::Text-->
                                                <div class="font-weight-mormal font-size-lg timeline-content text-muted pl-3">
                                                    Outlines keep you honest. And keep structure
                                                </div>
                                                <!--end::Text-->
                                            </div>
                                            <!--end::Item-->

                                            <!--begin::Item-->
                                            <div class="timeline-item align-items-start">
                                                <!--begin::Label-->
                                                <div class="timeline-label font-weight-bolder text-dark-75 font-size-lg">
                                                    10:00
                                                </div>
                                                <!--end::Label-->

                                                <!--begin::Badge-->
                                                <div class="timeline-badge">
                                                    <i class="fa fa-genderless text-success icon-xl"></i>
                                                </div>
                                                <!--end::Badge-->

                                                <!--begin::Content-->
                                                <div class="timeline-content d-flex">
                                                    <span class="font-weight-bolder text-dark-75 pl-3 font-size-lg">AEOL meeting</span>
                                                </div>
                                                <!--end::Content-->
                                            </div>
                                            <!--end::Item-->

                                            <!--begin::Item-->
                                            <div class="timeline-item align-items-start">
                                                <!--begin::Label-->
                                                <div class="timeline-label font-weight-bolder text-dark-75 font-size-lg">
                                                    14:37
                                                </div>
                                                <!--end::Label-->

                                                <!--begin::Badge-->
                                                <div class="timeline-badge">
                                                    <i class="fa fa-genderless text-danger icon-xl"></i>
                                                </div>
                                                <!--end::Badge-->

                                                <!--begin::Desc-->
                                                <div class="timeline-content font-weight-bolder font-size-lg text-dark-75 pl-3">
                                                    Make deposit
                                                    <a href="#" class="text-primary">USD 700</a>.
                                                    to ESL
                                                </div>
                                                <!--end::Desc-->
                                            </div>
                                            <!--end::Item-->

                                            <!--begin::Item-->
                                            <div class="timeline-item align-items-start">
                                                <!--begin::Label-->
                                                <div class="timeline-label font-weight-bolder text-dark-75 font-size-lg">
                                                    16:50
                                                </div>
                                                <!--end::Label-->

                                                <!--begin::Badge-->
                                                <div class="timeline-badge">
                                                    <i class="fa fa-genderless text-primary icon-xl"></i>
                                                </div>
                                                <!--end::Badge-->

                                                <!--begin::Text-->
                                                <div class="timeline-content font-weight-mormal font-size-lg text-muted pl-3">
                                                    Indulging in poorly driving and keep structure keep great
                                                </div>
                                                <!--end::Text-->
                                            </div>
                                            <!--end::Item-->

                                            <!--begin::Item-->
                                            <div class="timeline-item align-items-start">
                                                <!--begin::Label-->
                                                <div class="timeline-label font-weight-bolder text-dark-75 font-size-lg">
                                                    21:03
                                                </div>
                                                <!--end::Label-->

                                                <!--begin::Badge-->
                                                <div class="timeline-badge">
                                                    <i class="fa fa-genderless text-danger icon-xl"></i>
                                                </div>
                                                <!--end::Badge-->

                                                <!--begin::Desc-->
                                                <div class="timeline-content font-weight-bolder text-dark-75 pl-3 font-size-lg">
                                                    New order placed <a href="#" class="text-primary">#XF-2356</a>.
                                                </div>
                                                <!--end::Desc-->
                                            </div>
                                            <!--end::Item-->

                                            <!--begin::Item-->
                                            <div class="timeline-item align-items-start">
                                                <!--begin::Label-->
                                                <div class="timeline-label font-weight-bolder text-dark-75 font-size-lg">
                                                    23:07
                                                </div>
                                                <!--end::Label-->

                                                <!--begin::Badge-->
                                                <div class="timeline-badge">
                                                    <i class="fa fa-genderless text-info icon-xl"></i>
                                                </div>
                                                <!--end::Badge-->

                                                <!--begin::Text-->
                                                <div class="timeline-content font-weight-mormal font-size-lg text-muted pl-3">
                                                    Outlines keep and you honest. Indulging in poorly driving
                                                </div>
                                                <!--end::Text-->
                                            </div>
                                            <!--end::Item-->

                                            <!--begin::Item-->
                                            <div class="timeline-item align-items-start">
                                                <!--begin::Label-->
                                                <div class="timeline-label font-weight-bolder text-dark-75 font-size-lg">
                                                    16:50
                                                </div>
                                                <!--end::Label-->

                                                <!--begin::Badge-->
                                                <div class="timeline-badge">
                                                    <i class="fa fa-genderless text-primary icon-xl"></i>
                                                </div>
                                                <!--end::Badge-->

                                                <!--begin::Text-->
                                                <div class="timeline-content font-weight-mormal font-size-lg text-muted pl-3">
                                                    Indulging in poorly driving and keep structure keep great
                                                </div>
                                                <!--end::Text-->
                                            </div>
                                            <!--end::Item-->

                                            <!--begin::Item-->
                                            <div class="timeline-item align-items-start">
                                                <!--begin::Label-->
                                                <div class="timeline-label font-weight-bolder text-dark-75 font-size-lg">
                                                    21:03
                                                </div>
                                                <!--end::Label-->

                                                <!--begin::Badge-->
                                                <div class="timeline-badge">
                                                    <i class="fa fa-genderless text-danger icon-xl"></i>
                                                </div>
                                                <!--end::Badge-->

                                                <!--begin::Desc-->
                                                <div class="timeline-content font-weight-bolder font-size-lg text-dark-75 pl-3">
                                                    New order placed <a href="#" class="text-primary">#XF-2356</a>.
                                                </div>
                                                <!--end::Desc-->
                                            </div>
                                            <!--end::Item-->
                                        </div>
                                        <!--end: Items-->
                                    </div>
                                    <!--end: Card Body-->
                                </div>
                                <!--end: Card-->
                                <!--end: List Widget 9-->
                            </div>
                        </div>
                        <!--end::Row-->
                        <!--end::Dashboard-->
                    </div>
                    <!--end::Container-->
                </div>
                <!--end::Entry-->
            </div>
            <!--end::页面内容-->

            <!--begin::页面底部-->
            <div class="footer bg-white py-4 d-flex flex-lg-column " id="kt_footer">
                <div class=" container  d-flex flex-column flex-md-row align-items-center justify-content-between">
                    <!--begin::版权-->
                    <div class="text-dark order-2 order-md-1">
                        <span class="text-muted font-weight-bold mr-2">2020&copy;</span>
                        <a href="http://keenthemes.com/metronic" target="_blank"
                           class="text-dark-75 text-hover-primary">QST</a>
                    </div>
                    <!--end::版权-->

                    <!--begin::底部导航-->
                    <div class="nav nav-dark order-1 order-md-2">
                        <a href="http://keenthemes.com/metronic" target="_blank" class="nav-link pr-3 pl-0">About</a>
                        <a href="http://keenthemes.com/metronic" target="_blank" class="nav-link px-3">Team</a>
                        <a href="http://keenthemes.com/metronic" target="_blank" class="nav-link pl-3 pr-0">Contact</a>
                    </div>
                    <!--end::底部导航-->
                </div>
                <!--end::Container-->
            </div>
            <!--end::页面底部-->
        </div>
        <!--end::右侧页面框架-->
    </div>
</div>
<%--end::页面主体内容--%>
<!-- begin::用户弹出面板-->
<div id="kt_quick_user" class="offcanvas offcanvas-right p-10">
    <!--begin::Header-->
    <div class="offcanvas-header d-flex align-items-center justify-content-between pb-5">
        <h3 class="font-weight-bold m-0">用户资料</h3>
        <a href="#" class="btn btn-xs btn-icon btn-light btn-hover-primary" id="kt_quick_user_close">
            <i class="ki ki-close icon-xs text-muted"></i>
        </a>
    </div>
    <!--end::Header-->

    <!--begin::Content-->
    <div class="offcanvas-content pr-5 mr-n5">
        <!--begin::Header-->
        <div class="d-flex align-items-center mt-5">
            <div class="symbol symbol-100 mr-5">
                <div class="symbol-label"></div>
                <i class="symbol-badge bg-success"></i>
            </div>
            <div class="d-flex flex-column">
                <a href="#" class="font-weight-bold font-size-h5 text-dark-75 text-hover-primary">
                    ${userSession.userName}
                </a>
                <div class="text-muted mt-1">

                </div>
                <div class="navi mt-2">
                    <a href="${pageContext.request.contextPath }/jsp/logout.do"
                       class="btn btn-sm btn-light-primary font-weight-bolder py-2 px-5">退出登录</a>
                </div>
            </div>
        </div>
        <!--end::Header-->

        <!--begin::Separator-->
        <div class="separator separator-dashed mt-8 mb-5"></div>
        <!--end::Separator-->

        <!--begin::Nav-->
        <div class="navi navi-spacer-x-0 p-0">
            <!--begin::Item-->
            <a href="custom/apps/user/profile-1/personal-information.html" class="navi-item">
                <div class="navi-link">
                    <div class="symbol symbol-40 bg-light mr-3">
                        <div class="symbol-label">
    <span class="svg-icon svg-icon-md svg-icon-success"><!--begin::Svg Icon | path:assets/media/svg/icons/General/Notification2.svg--><svg
            xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
            width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
    <rect x="0" y="0" width="24" height="24"/>
    <path d="M13.2070325,4 C13.0721672,4.47683179 13,4.97998812 13,5.5 C13,8.53756612 15.4624339,11 18.5,11 C19.0200119,11 19.5231682,10.9278328 20,10.7929675 L20,17 C20,18.6568542 18.6568542,20 17,20 L7,20 C5.34314575,20 4,18.6568542 4,17 L4,7 C4,5.34314575 5.34314575,4 7,4 L13.2070325,4 Z"
          fill="#000000"/>
    <circle fill="#000000" opacity="0.3" cx="18.5" cy="5.5" r="2.5"/>
    </g>
    </svg><!--end::Svg Icon--></span></div>
                    </div>
                    <div class="navi-text">
                        <div class="font-weight-bold">
                            My Profile
                        </div>
                        <div class="text-muted">
                            Account settings and more
                            <span class="label label-light-danger label-inline font-weight-bold">update</span>
                        </div>
                    </div>
                </div>
            </a>
            <!--end:Item-->

            <!--begin::Item-->
            <a href="custom/apps/user/profile-3.html" class="navi-item">
                <div class="navi-link">
                    <div class="symbol symbol-40 bg-light mr-3">
                        <div class="symbol-label">
    <span class="svg-icon svg-icon-md svg-icon-warning"><!--begin::Svg Icon | path:assets/media/svg/icons/Shopping/Chart-bar1.svg--><svg
            xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
            width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
    <rect x="0" y="0" width="24" height="24"/>
    <rect fill="#000000" opacity="0.3" x="12" y="4" width="3" height="13" rx="1.5"/>
    <rect fill="#000000" opacity="0.3" x="7" y="9" width="3" height="8" rx="1.5"/>
    <path d="M5,19 L20,19 C20.5522847,19 21,19.4477153 21,20 C21,20.5522847 20.5522847,21 20,21 L4,21 C3.44771525,21 3,20.5522847 3,20 L3,4 C3,3.44771525 3.44771525,3 4,3 C4.55228475,3 5,3.44771525 5,4 L5,19 Z"
          fill="#000000" fill-rule="nonzero"/>
    <rect fill="#000000" opacity="0.3" x="17" y="11" width="3" height="6" rx="1.5"/>
    </g>
    </svg><!--end::Svg Icon--></span></div>
                    </div>
                    <div class="navi-text">
                        <div class="font-weight-bold">
                            My Messages
                        </div>
                        <div class="text-muted">
                            Inbox and tasks
                        </div>
                    </div>
                </div>
            </a>
            <!--end:Item-->

            <!--begin::Item-->
            <a href="custom/apps/user/profile-2.html" class="navi-item">
                <div class="navi-link">
                    <div class="symbol symbol-40 bg-light mr-3">
                        <div class="symbol-label">
    <span class="svg-icon svg-icon-md svg-icon-danger"><!--begin::Svg Icon | path:assets/media/svg/icons/Files/Selected-file.svg--><svg
            xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
            width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
    <polygon points="0 0 24 0 24 24 0 24"/>
    <path d="M4.85714286,1 L11.7364114,1 C12.0910962,1 12.4343066,1.12568431 12.7051108,1.35473959 L17.4686994,5.3839416 C17.8056532,5.66894833 18,6.08787823 18,6.52920201 L18,19.0833333 C18,20.8738751 17.9795521,21 16.1428571,21 L4.85714286,21 C3.02044787,21 3,20.8738751 3,19.0833333 L3,2.91666667 C3,1.12612489 3.02044787,1 4.85714286,1 Z M8,12 C7.44771525,12 7,12.4477153 7,13 C7,13.5522847 7.44771525,14 8,14 L15,14 C15.5522847,14 16,13.5522847 16,13 C16,12.4477153 15.5522847,12 15,12 L8,12 Z M8,16 C7.44771525,16 7,16.4477153 7,17 C7,17.5522847 7.44771525,18 8,18 L11,18 C11.5522847,18 12,17.5522847 12,17 C12,16.4477153 11.5522847,16 11,16 L8,16 Z"
          fill="#000000" fill-rule="nonzero" opacity="0.3"/>
    <path d="M6.85714286,3 L14.7364114,3 C15.0910962,3 15.4343066,3.12568431 15.7051108,3.35473959 L20.4686994,7.3839416 C20.8056532,7.66894833 21,8.08787823 21,8.52920201 L21,21.0833333 C21,22.8738751 20.9795521,23 19.1428571,23 L6.85714286,23 C5.02044787,23 5,22.8738751 5,21.0833333 L5,4.91666667 C5,3.12612489 5.02044787,3 6.85714286,3 Z M8,12 C7.44771525,12 7,12.4477153 7,13 C7,13.5522847 7.44771525,14 8,14 L15,14 C15.5522847,14 16,13.5522847 16,13 C16,12.4477153 15.5522847,12 15,12 L8,12 Z M8,16 C7.44771525,16 7,16.4477153 7,17 C7,17.5522847 7.44771525,18 8,18 L11,18 C11.5522847,18 12,17.5522847 12,17 C12,16.4477153 11.5522847,16 11,16 L8,16 Z"
          fill="#000000" fill-rule="nonzero"/>
    </g>
    </svg><!--end::Svg Icon--></span></div>
                    </div>
                    <div class="navi-text">
                        <div class="font-weight-bold">
                            My Activities
                        </div>
                        <div class="text-muted">
                            Logs and notifications
                        </div>
                    </div>
                </div>
            </a>
            <!--end:Item-->

            <!--begin::Item-->
            <a href="custom/apps/userprofile-1/overview.html" class="navi-item">
                <div class="navi-link">
                    <div class="symbol symbol-40 bg-light mr-3">
                        <div class="symbol-label">
    <span class="svg-icon svg-icon-md svg-icon-primary"><!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Mail-opened.svg--><svg
            xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
            width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
    <rect x="0" y="0" width="24" height="24"/>
    <path d="M6,2 L18,2 C18.5522847,2 19,2.44771525 19,3 L19,12 C19,12.5522847 18.5522847,13 18,13 L6,13 C5.44771525,13 5,12.5522847 5,12 L5,3 C5,2.44771525 5.44771525,2 6,2 Z M7.5,5 C7.22385763,5 7,5.22385763 7,5.5 C7,5.77614237 7.22385763,6 7.5,6 L13.5,6 C13.7761424,6 14,5.77614237 14,5.5 C14,5.22385763 13.7761424,5 13.5,5 L7.5,5 Z M7.5,7 C7.22385763,7 7,7.22385763 7,7.5 C7,7.77614237 7.22385763,8 7.5,8 L10.5,8 C10.7761424,8 11,7.77614237 11,7.5 C11,7.22385763 10.7761424,7 10.5,7 L7.5,7 Z"
          fill="#000000" opacity="0.3"/>
    <path d="M3.79274528,6.57253826 L12,12.5 L20.2072547,6.57253826 C20.4311176,6.4108595 20.7436609,6.46126971 20.9053396,6.68513259 C20.9668779,6.77033951 21,6.87277228 21,6.97787787 L21,17 C21,18.1045695 20.1045695,19 19,19 L5,19 C3.8954305,19 3,18.1045695 3,17 L3,6.97787787 C3,6.70173549 3.22385763,6.47787787 3.5,6.47787787 C3.60510559,6.47787787 3.70753836,6.51099993 3.79274528,6.57253826 Z"
          fill="#000000"/>
    </g>
    </svg><!--end::Svg Icon--></span></div>
                    </div>
                    <div class="navi-text">
                        <div class="font-weight-bold">
                            My Tasks
                        </div>
                        <div class="text-muted">
                            latest tasks and projects
                        </div>
                    </div>
                </div>
            </a>
            <!--end:Item-->
        </div>
        <!--end::Nav-->

        <!--begin::Separator-->
        <div class="separator separator-dashed my-7"></div>
        <!--end::Separator-->

    </div>
    <!--end::Content-->
</div>
<!-- end::用户弹出面板-->
<!--begin::滚动至顶端按钮-->
<div id="kt_scrolltop" class="scrolltop">
    <span class="svg-icon"><!--begin::Svg Icon | path:assets/media/svg/icons/Navigation/Up-2.svg--><svg
            xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px"
            viewBox="0 0 24 24" version="1.1">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
    <polygon points="0 0 24 0 24 24 0 24"/>
    <rect fill="#000000" opacity="0.3" x="11" y="10" width="2" height="10" rx="1"/>
    <path d="M6.70710678,12.7071068 C6.31658249,13.0976311 5.68341751,13.0976311 5.29289322,12.7071068 C4.90236893,12.3165825 4.90236893,11.6834175 5.29289322,11.2928932 L11.2928932,5.29289322 C11.6714722,4.91431428 12.2810586,4.90106866 12.6757246,5.26284586 L18.6757246,10.7628459 C19.0828436,11.1360383 19.1103465,11.7686056 18.7371541,12.1757246 C18.3639617,12.5828436 17.7313944,12.6103465 17.3242754,12.2371541 L12.0300757,7.38413782 L6.70710678,12.7071068 Z"
          fill="#000000" fill-rule="nonzero"/>
    </g>
    </svg><!--end::Svg Icon--></span></div>
<!--end::滚动至顶端按钮-->
<script src="${pageContext.request.contextPath }/static/js/plugins.bundle.js"></script>
<script src="${pageContext.request.contextPath }/static/js/scripts.bundle.js"></script>
<script src="${pageContext.request.contextPath }/static/js/widgets.js"></script>
</body>
</html>