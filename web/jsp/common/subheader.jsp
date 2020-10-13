<%--
  Created by IntelliJ IDEA.
  User: sveir
  Date: 2020/10/13
  Time: 19:18
--%>
<!--begin::页面头部-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="kt_header" class="header bg-white  header-fixed ">
    <div class=" container-fluid  d-flex align-items-stretch justify-content-between">
        <div class="d-flex align-items-stretch mr-2">
            <h3 class="d-none text-dark d-lg-flex align-items-center mr-10 mb-0">订单管理系统</h3>
        </div>
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
    </div>
</div>
<!--end::页面头部-->
