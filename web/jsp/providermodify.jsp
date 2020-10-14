<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-10-14
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.qst.pojo.Provider" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>供应商修改 | 订单管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"/>
    <link href="${pageContext.request.contextPath }/static/fullcalendar/fullcalendar.bundle.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath }/static/css/plugins.bundle.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/static/css/style.bundle.css" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/static/images/favicon.ico"/>
</head>
<body id="kt_body" class="header-fixed header-mobile-fixed subheader-enabled page-loading">
<%@include file="/jsp/common/header.jsp" %>
<%--begin::页面主体内容--%>
<div class="d-flex flex-column flex-root">
    <div class="d-flex flex-row flex-column-fluid page">
        <!--begin::左侧导航栏-->
        <div class="aside aside-left d-flex flex-column " id="kt_aside">
            <!--begin::头部 logo-->
            <div class="aside-brand d-flex flex-column align-items-center flex-column-auto py-4 py-lg-8">
                <a href="/"><img alt="Logo"
                                 src="${pageContext.request.contextPath }/static/images/logo-letter-1.png"
                                 class="max-h-30px"/></a>
            </div>
            <!--end::头部 logo-->

            <!--begin::快捷菜单-->
            <div class="aside-nav d-flex flex-column align-items-center flex-column-fluid pt-7">
                <!--begin::Nav-->
                <ul class="nav flex-column">
                    <!--begin::Item-->
                    <li class="nav-item mb-5" data-toggle="tooltip" data-placement="right" data-container="body"
                        data-boundary="window" title="用户中心">
                        <a href="/jsp/home.jsp" class="nav-link btn btn-icon  btn-icon-white btn-clean btn-lg ">
                            <i class="flaticon2-protection icon-lg"></i>
                        </a>
                    </li>
                    <!--end::Item-->

                    <!--begin::Item-->
                    <li class="nav-item mb-5" data-toggle="tooltip" data-placement="right" data-container="body"
                        data-boundary="window" title="订单管理">
                        <a href="${pageContext.request.contextPath }/jsp/bill.do?method=query"
                           class="nav-link btn btn-icon btn-icon-white btn-clean btn-lg active">
                            <i class="flaticon2-list-3 icon-lg"></i>
                        </a>
                    </li>
                    <!--end::Item-->

                    <!--begin::Item-->
                    <li class="nav-item mb-5" data-toggle="tooltip" data-placement="right" data-container="body"
                        data-boundary="window" title="供应商管理">
                        <a href="${pageContext.request.contextPath }/jsp/provider.do?method=query"
                           class="nav-link btn btn-icon btn-clean btn-icon-white btn-clean btn-lg">
                            <i class="flaticon2-calendar-6 icon-lg"></i>
                        </a>
                    </li>
                    <!--end::Item-->

                    <!--begin::Item-->
                    <li class="nav-item mb-5" data-toggle="tooltip" data-placement="right" data-container="body"
                        data-boundary="window" title="用户管理">
                        <a href="${pageContext.request.contextPath }/jsp/user.do?method=query"
                           class="nnav-link btn btn-icon btn-clean btn-icon-white btn-clean btn-lg">
                            <i class="flaticon2-analytics-2 icon-lg"></i>
                        </a>
                    </li>
                    <!--end::Item-->

                    <!--begin::Item-->
                    <li class="nav-item mb-5" data-toggle="tooltip" data-placement="right" data-container="body"
                        data-boundary="window" title="修改密码">
                        <a href="${pageContext.request.contextPath }/jsp/pwdmodify.jsp"
                           class="nav-link btn btn-icon btn-clean btn-icon-white btn-clean btn-lg">
                            <i class="flaticon2-hourglass-1 icon-lg"></i>
                        </a>
                    </li>
                    <!--end::Item-->

                </ul>
                <!--end::Nav-->
            </div>
            <!--end::快捷菜单-->
        </div>
        <!--end::左侧导航栏-->
        <!--begin::右侧页面框架-->
        <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
            <%@include file="/jsp/common/subheader.jsp" %>
            <!--begin::页面内容-->
            <div class="content  d-flex flex-column flex-column-fluid" id="kt_content">
                <%--begin::子标题--%>
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
                <%--end::子标题--%>
                <div class="d-flex flex-column-fluid">
                    <div class=" container ">
                        <div class="card">
                            <form id="ProviderEditForm" name="ProviderEditForm" method="post" action="${pageContext.request.contextPath }/jsp/provider.do"
                                  class="kt-form kt-form--fit mb-15">
                                <input name="method" value="modifysave" class="input-text" type="hidden">
                                <input type="hidden" name="id" value="${provider.id}">
                                <div class="card-header flex-wrap border-0 pt-6 pb-0">
                                    <div class="card-title">
                                        <h3 class="card-label">供应商修改</h3>
                                    </div>
                                </div>
                                <div class="card-body">
                                <div class="col-xl-7 my-2">
                                    <div class="form-group row">
                                        <label class="col-form-label col-3 text-lg-right text-left">供应商编码</label>
                                        <div class="col-9">
                                            <input name="proCode" id="proCode"
                                                   class="form-control form-control-lg form-control-solid"
                                                   type="text" value="${provider.proCode }"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-3 text-lg-right text-left">供应商名称</label>
                                        <div class="col-9">
                                            <input name="proName" id="proName"
                                                   class="form-control form-control-lg form-control-solid"
                                                   type="text" value="${provider.proName }"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-3 text-lg-right text-left">联系人</label>
                                        <div class="col-9">
                                            <input name="proContact" id="proContact"
                                                   class="form-control form-control-lg form-control-solid"
                                                   type="text" value="${provider.proContact }"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-3 text-lg-right text-left">联系电话</label>
                                        <div class="col-9">
                                            <div class="input-group input-group-lg input-group-solid">
                                                <div class="input-group-prepend"><span
                                                        class="input-group-text"><i
                                                        class="la la-cart-arrow-down"></i></span></div>
                                                <input type="text" name="proPhone" id="proPhone"
                                                       class="form-control form-control-lg form-control-solid"
                                                       value="${provider.proPhone }"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-3 text-lg-right text-left">联系地址</label>
                                        <div class="col-9">
                                            <div class="input-group input-group-lg input-group-solid">
                                                <div class="input-group-prepend"><span
                                                        class="input-group-text"><i
                                                        class="la la-wallet"></i></span></div>
                                                <input type="text" name="proAddress" id="proAddress"
                                                       class="form-control form-control-lg form-control-solid"
                                                       value="${provider.proAddress }"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-3 text-lg-right text-left">传真</label>
                                        <div class="col-9">
                                            <div class="input-group input-group-lg input-group-solid">
                                                <div class="input-group-prepend"><span
                                                        class="input-group-text"><i
                                                        class="la la-wallet"></i></span></div>
                                                <input type="text" name="proFax" id="proFax"
                                                       class="form-control form-control-lg form-control-solid"
                                                       value="${provider.proFax }"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-3 text-lg-right text-left">描述</label>
                                        <div class="col-9">
                                            <div class="input-group input-group-lg input-group-solid">
                                                <div class="input-group-prepend"><span
                                                        class="input-group-text"><i
                                                        class="la la-wallet"></i></span></div>
                                                <input type="text" name="proDesc" id="proDesc"
                                                       class="form-control form-control-lg form-control-solid"
                                                       value="${provider.proDesc }"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="row">
                                    <div class="col-xl-2"></div>
                                    <div class="col-xl-7">
                                        <div class="row">
                                            <div class="col-3"></div>
                                            <div class="col-9">
                                                <button name="saveButton" id="saveButton"
                                                        class="btn btn-light-primary font-weight-bold">保存更改</button>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href="javascript:window.history.back(-1);"
                                                   class="btn btn-clean font-weight-bold">取消并返回</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!--end::页面内容-->
                <%@include file="/jsp/common/footer.jsp" %>
            </div>
            <!--end::右侧页面框架-->
        </div>
    </div>
</div>
<%--end::页面主体内容--%>

<%@include file="/jsp/common/user_panel.jsp" %>
<%@include file="/jsp/common/scrollToTop.jsp" %>

<script src="${pageContext.request.contextPath }/static/js/theme.js"></script>
<script src="${pageContext.request.contextPath }/static/js/plugins.bundle.js"></script>
<script src="${pageContext.request.contextPath }/static/js/scripts.bundle.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/providermodify.js"></script>
</body>
</html>
