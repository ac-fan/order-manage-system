<%--
  Created by IntelliJ IDEA.
  User: sveir
  Date: 2020/10/13
  Time: 18:30
--%>
<!-- begin::用户弹出面板-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="kt_quick_user" class="offcanvas offcanvas-right p-10">
    <div class="offcanvas-header d-flex align-items-center justify-content-between pb-5">
        <h3 class="font-weight-bold m-0">用户资料</h3>
        <a href="#" class="btn btn-xs btn-icon btn-light btn-hover-primary" id="kt_quick_user_close">
            <i class="ki ki-close icon-xs text-muted"></i>
        </a>
    </div>
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
    </div>
</div>
<!-- end::用户弹出面板-->