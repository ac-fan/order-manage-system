<%--
  Created by IntelliJ IDEA.
  User: sveir
  Date: 2020/10/15
  Time: 11:08
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--begin::Subheader-->
<div class="subheader py-2 py-lg-6  subheader-transparent " id="kt_subheader">
    <div class=" container  d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
        <!--begin::Info-->
        <div class="d-flex align-items-center flex-wrap mr-1">
            <!--begin::Page Heading-->
            <div class="d-flex align-items-baseline flex-wrap mr-5">
                <h4>当前时间:</h4>&nbsp;&nbsp;&nbsp;
                <h4 class="text-danger font-weight-bold my-1 mr-5" id="time">2015年1月1日 11:11  星期一</h4>
            </div>
            <!--end::Page Heading-->
        </div>
        <!--end::Info-->
        <section class="publicTime">
            <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
        </section>
    </div>
</div>
<!--end::Subheader-->
<script src="${pageContext.request.contextPath}/static/js/time.js"></script>