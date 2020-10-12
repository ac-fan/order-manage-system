<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<!--begin::Head-->
<head>
    <meta charset="utf-8"/>
    <title>403 | 订单管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

    <!--begin::Fonts-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"/>
    <!--end::Fonts-->

    <!--begin::Page Custom Styles(used by this page)-->
    <link href="${pageContext.request.contextPath }/static/css/error.css" rel="stylesheet" type="text/css"/>
    <!--end::Page Custom Styles-->

    <!--begin::Global Theme Styles(used by all pages)-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/plugins.bundle.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/style.bundle.css"/>
    <!--end::Global Theme Styles-->

    <!--begin::Layout Themes(used by all pages)-->
    <!--end::Layout Themes-->

    <link rel="shortcut icon" href="${pageContext.request.contextPath }/static/images/favicon.ico"/>

</head>
<!--end::Head-->

<!--begin::Body-->
<body id="kt_body" class="header-fixed header-mobile-fixed subheader-enabled page-loading">

<!--begin::Main-->
<div class="d-flex flex-column flex-root">
    <!--begin::Error-->
    <div class="error error-4 d-flex flex-row-fluid bgi-size-cover bgi-position-center"
         style="background-image: url(${pageContext.request.contextPath }/static/images/error-bg.jpg);">
        <!--begin::Content-->
        <div class="d-flex flex-column flex-row-fluid align-items-center align-items-md-start justify-content-md-center text-center text-md-left px-10 px-md-30 py-10 py-md-0 line-height-xs">
            <h2 class="error-title text-success font-weight-boldest line-height-sm">
                ERROR
            </h2>
            <p class="error-subtitle text-success font-weight-boldest mb-10">
                未授权的访问
            </p>
            <p class="display-4 text-danger font-weight-boldest mt-md-0 line-height-md">
                请登录后再尝试进行操作.
            </p>
        </div>
        <!--end::Content-->
    </div>
    <!--end::Error-->
</div>
<!--end::Main-->

<!--begin::Global Theme Bundle(used by all pages)-->
<%--<script src="${pageContext.request.contextPath }/static/js/plugins.bundle.js"></script>
<script src="${pageContext.request.contextPath }/static/js/scripts.bundle.js"></script>--%>
<!--end::Global Theme Bundle-->


</body>
<!--end::Body-->
</html>
