<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>无此权限 | 订单管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"/>
    <link href="${pageContext.request.contextPath }/static/css/error.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/plugins.bundle.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/style.bundle.css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/static/images/favicon.ico"/>
</head>
<body id="kt_body" class="header-fixed header-mobile-fixed subheader-enabled page-loading">
<!--begin::Main-->
<div class="d-flex flex-column flex-root">
    <!--begin::Error-->
    <div class="error error-3 d-flex flex-row-fluid bgi-size-cover bgi-position-center"
         style="background-image: url(/static/images/bg-3.jpg);">
        <!--begin::Content-->
        <div class="px-10 px-md-30 py-10 py-md-0 d-flex flex-column justify-content-md-center">
            <h1 class="error-title text-stroke text-transparent">Pemission Denied</h1>
            <p class="display-4 font-weight-boldest text-white mb-12">
                权限不足
            </p>
            <p class="font-size-h1 font-weight-boldest text-dark-75">
                您暂时没有权限访问此页面.
            </p>
            <p class="font-size-h4 line-height-md">
                <a class="btn btn-warning font-weight-bold" href="javascript:window.history.back(-1);">返回上一页</a>
            </p>
        </div>

        <!--end::Content-->
    </div>
    <!--end::Error-->
</div>
<!--end::Main-->
</body>
</html>
