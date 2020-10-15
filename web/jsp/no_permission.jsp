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
<div class="d-flex flex-column flex-root">
    <div class="error error-4 d-flex flex-row-fluid bgi-size-cover bgi-position-center"
         style="background-image: url(${pageContext.request.contextPath }/static/images/error-bg.jpg);">
        <div class="d-flex flex-column flex-row-fluid align-items-center align-items-md-start justify-content-md-center text-center text-md-left px-10 px-md-30 py-10 py-md-0 line-height-xs">
            <h2 class="error-title text-success font-weight-boldest line-height-sm">
                权限不够
            </h2>
            <p class="error-subtitle text-success font-weight-boldest mb-10">
                未授权的访问
            </p>
            <a class="btn btn-hover-bg-warning font-weight-bold" href="javascript:window.history.back(-1);">返回上一页</a>
        </div>
    </div>
</div>
</body>
</html>
