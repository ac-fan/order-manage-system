<%--
  Created by IntelliJ IDEA.
  User: sveir
  Date: 2020/10/13
  Time: 20:45
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--begin::快捷菜单-->
<div class="aside-nav d-flex flex-column align-items-center flex-column-fluid pt-7">
    <!--begin::Nav-->
    <ul class="nav flex-column">
        <!--begin::Item-->
        <li class="nav-item mb-5" data-toggle="tooltip" data-placement="right" data-container="body"
            data-boundary="window" title="用户中心">
            <a href="/jsp/home.jsp" class="nav-link btn btn-icon btn-clean btn-icon-white btn-lg ">
                <i class="flaticon2-protection icon-lg"></i>
            </a>
        </li>
        <!--end::Item-->

        <!--begin::Item-->
        <li class="nav-item mb-5" data-toggle="tooltip" data-placement="right" data-container="body"
            data-boundary="window" title="订单管理">
            <a href="${pageContext.request.contextPath }/jsp/bill.do?method=query"
               class="nav-link btn btn-icon btn-clean btn-icon-white btn-lg">
                <i class="flaticon2-list-3 icon-lg"></i>
            </a>
        </li>
        <!--end::Item-->

        <!--begin::Item-->
        <li class="nav-item mb-5" data-toggle="tooltip" data-placement="right" data-container="body"
            data-boundary="window" title="供应商管理">
            <a href="${pageContext.request.contextPath }/jsp/provider.do?method=query"
               class="nav-link btn btn-icon btn-clean btn-icon-white btn-lg active">
                <i class="flaticon2-calendar-6 icon-lg"></i>
            </a>
        </li>
        <!--end::Item-->

        <!--begin::Item-->
        <li class="nav-item mb-5" data-toggle="tooltip" data-placement="right" data-container="body"
            data-boundary="window" title="用户管理">
            <a href="${pageContext.request.contextPath }/jsp/user.do?method=query"
               class="nnav-link btn btn-icon btn-clean btn-icon-white btn-lg">
                <i class="flaticon2-analytics-2 icon-lg"></i>
            </a>
        </li>
        <!--end::Item-->

        <!--begin::Item-->
        <li class="nav-item mb-5" data-toggle="tooltip" data-placement="right" data-container="body"
            data-boundary="window" title="修改密码">
            <a href="${pageContext.request.contextPath }/jsp/pwdmodify.jsp"
               class="nav-link btn btn-icon btn-clean btn-icon-white btn-lg">
                <i class="flaticon2-hourglass-1 icon-lg"></i>
            </a>
        </li>
        <!--end::Item-->

    </ul>
    <!--end::Nav-->
</div>
<!--end::快捷菜单-->
