<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>登录 | 订单管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/login.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/plugins.bundle.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/style.bundle.css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/static/images/favicon.ico"/>
</head>
<body id="kt_body" class="header-fixed header-mobile-fixed subheader-enabled page-loading">
<div class="d-flex flex-column flex-root">
    <div class="login login-2 login-signin-on d-flex flex-column flex-lg-row flex-row-fluid bg-white" id="kt_login">
        <!--begin::登录表单区域-->
        <div class="login-aside order-2 order-lg-1 d-flex flex-column-fluid flex-lg-row-auto bgi-size-cover bgi-no-repeat p-7 p-lg-10">
            <div class="d-flex flex-row-fluid flex-column justify-content-between">
                <!--begin::侧边-->
                <div class="d-flex flex-column-fluid flex-column flex-center mt-5 mt-lg-0">
                    <a href="/" class="mb-15 text-center">
                        <img src="static/images/logo-letter-1.png" class="max-h-75px" alt=""/>
                    </a>

                    <!--begin::Signin-->
                    <div class="login-form login-signin">
                        <div class="text-center mb-10 mb-lg-20">
                            <h2 class="font-weight-bold">登录</h2>
                            <p class="text-muted font-weight-bold">请输入你的用户名及密码</p>
                        </div>

                        <!--begin::Form action="${pageContext.request.contextPath}/login.do" method="POST"-->
                        <form class="form" action="${pageContext.request.contextPath}/login.do" method="POST"
                              id="kt_login_signin_form">
                            <h3 class="alert-text text-danger">${error}</h3>
                            <div class="form-group py-3 m-0">
                                <input class="form-control h-auto border-0 px-0 placeholder-dark-75" type="text"
                                       placeholder="用户名" name="userCode" autocomplete="off"/>
                            </div>
                            <div class="form-group py-3 border-top m-0">
                                <input class="form-control h-auto border-0 px-0 placeholder-dark-75" type="Password"
                                       placeholder="密码" name="userPassword"/>
                            </div>

                            <div class="form-group d-flex flex-wrap justify-content-between align-items-center mt-3">
                                <div class="checkbox-inline">
                                    <label class="checkbox checkbox-outline m-0 text-muted">
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                    </label>
                                </div>
                            </div>

                            <div class="form-group d-flex flex-wrap justify-content-between align-items-center mt-2">
                                <div class="my-3 mr-2">
                                    <button id="kt_login_signin_reset" type="reset"
                                            class="btn btn-success font-weight-bold px-9 py-4 my-3">重置
                                    </button>
                                </div>
                                <button id="kt_login_signin_submit" type="submit"
                                        class="btn btn-primary font-weight-bold px-9 py-4 my-3">登录
                                </button>
                            </div>
                        </form>
                        <!--end::Form-->
                    </div>
                    <!--end::Signin-->
                </div>
                <!--end::Aside body-->

                <%@include file="/jsp/common/footer.jsp" %>

            </div>
        </div>
        <!--end::登录表单区域-->
        <!--begin::侧边主体内容-->
        <div class="order-1 order-lg-2 flex-column-auto flex-lg-row-fluid d-flex flex-column p-7"
             style="background-image: url(static/images/bg-4.jpg);">
            <!--begin::Content body-->
            <div class="d-flex flex-column-fluid flex-lg-center">
                <div class="d-flex flex-column justify-content-center">
                    <h3 class="display-3 font-weight-bold my-7 text-white">欢迎使用订单管理系统!</h3>
                </div>
            </div>
            <!--end::Content body-->
        </div>
        <!--end::侧边主体内容-->
    </div>
</div>
<script src="${pageContext.request.contextPath }/static/js/theme.js"></script>
<script src="${pageContext.request.contextPath }/static/js/plugins.bundle.js"></script>
<script src="${pageContext.request.contextPath }/static/js/scripts.bundle.js"></script>
</body>
</html>

