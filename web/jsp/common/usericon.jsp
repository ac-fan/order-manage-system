<%--
  Created by IntelliJ IDEA.
  User: sveir
  Date: 2020/10/15
  Time: 15:56
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--begin::Topbar-->
<div class="topbar">
    <!--begin::User-->
    <div class="topbar-item">
        <div class="btn btn-icon w-auto btn-clean d-flex align-items-center btn-lg px-2"
             id="kt_quick_user_toggle">
            <div class="d-flex flex-column text-right pr-3">
                <span class="text-muted font-weight-bold font-size-base d-none d-md-inline">你好,&nbsp;&nbsp;${userSession.userName }</span>
                <span class="text-dark-75 font-weight-bolder font-size-base d-none d-md-inline">
                                        <c:if test="${userSession.userRole == 1}">管理员</c:if>
                                        <c:if test="${userSession.userRole == 2}">经理</c:if>
                                        <c:if test="${userSession.userRole == 3}">员工</c:if>
                                    </span>
            </div>
            <span class="symbol symbol-35 symbol-light-primary">
                                    <span class="symbol-label font-size-h5 font-weight-bold">头像</span>
					            </span>
        </div>
    </div>
    <!--end::User-->
</div>
<!--end::Topbar-->