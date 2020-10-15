<%--
  Created by IntelliJ IDEA.
  User: sveir
  Date: 2020/10/13
  Time: 08:50
--%>

<%@ page import="com.qst.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>订单查询 | 订单管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"/>
    <link href="${pageContext.request.contextPath }/static/css/datatables.bundle.css" rel="stylesheet"
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
                <!--begin::Logo-->
                <a href="index.html">
                    <img alt="Logo" src="${pageContext.request.contextPath }/static/images/logo-letter-1.png"
                         class="max-h-30px"/>
                </a>
                <!--end::Logo-->
            </div>
            <!--end::头部 logo-->
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
                           class="nav-link btn btn-icon btn-clean btn-icon-white btn-lg active">
                            <i class="flaticon2-list-3 icon-lg"></i>
                        </a>
                    </li>
                    <!--end::Item-->

                    <!--begin::Item-->
                    <li class="nav-item mb-5" data-toggle="tooltip" data-placement="right" data-container="body"
                        data-boundary="window" title="供应商管理">
                        <a href="${pageContext.request.contextPath }/jsp/provider.do?method=query"
                           class="nav-link btn btn-icon btn-clean btn-icon-white btn-lg">
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
        </div>
        <!--end::左侧导航栏-->
        <!--begin::右侧页面框架-->
        <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
            <%@include file="/jsp/common/subheader.jsp" %>
            <!--begin::页面内容-->
            <div class="content  d-flex flex-column flex-column-fluid" id="kt_content">
                <%@include file="/jsp/common/containerHead.jsp" %>

                <%--end::子标题--%>
                <div class="d-flex flex-column-fluid">
                    <div class="container">
                        <div class="card">
                            <div class="card-header flex-wrap border-0 pt-6 pb-0">
                                <div class="card-title">
                                    <h3 class="card-label">订单查询</h3>
                                </div>
                            </div>
                            <div class="card-body">
                                <!--begin: Search Form-->
                                <form method="get" action="${pageContext.request.contextPath }/jsp/bill.do"
                                      class="kt-form kt-form--fit mb-15">
                                    <input name="method" value="query" class="input-text" type="hidden">
                                    <div class="row mb-6">
                                        <div class="col-lg-3 mb-lg-0 mb-6">
                                            <label>商品名称</label>
                                            <input type="text" class="form-control datatable-input"
                                                   name="queryProductName"
                                                   value="${queryProductName }" data-col-index="0"/>
                                        </div>
                                        <div class="col-lg-3  mb-lg-0 mb-6">
                                            <label>供应商:</label>
                                            <select name="queryProviderId" class="form-control datatable-input"
                                                    data-col-index="6">
                                                <c:if test="${providerList != null }">
                                                    <option value="0">--请选择--</option>
                                                    <c:forEach var="provider" items="${providerList}">
                                                        <option
                                                                <c:if test="${provider.id == queryProviderId }">selected="selected"</c:if>
                                                                value="${provider.id}">${provider.proName}</option>
                                                    </c:forEach>
                                                </c:if>
                                            </select>
                                        </div>
                                        <div class="col-lg-3  mb-lg-0 mb-6">
                                            <label>付款状态:</label>
                                            <select name="queryIsPayment" class="form-control datatable-input"
                                                    data-col-index="7">
                                                <option value="0">--请选择--</option>
                                                <option value="1" ${queryIsPayment == 1 ? "selected=\"selected\"":"" }>
                                                    未付款
                                                </option>
                                                <option value="2" ${queryIsPayment == 2 ? "selected=\"selected\"":"" }>
                                                    已付款
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <input type="hidden" name="pageIndex" value="1"/>
                                    <div class="row mt-8">
                                        <div class="col-lg-12">
                                            <button class="btn btn-primary btn-primary--icon" id="kt_search">
                                                <span>
                                                    <i class="la la-search"></i><span>查询</span>
                                                </span>
                                            </button>&nbsp;&nbsp;
                                            <button class="btn btn-secondary btn-secondary--icon" id="kt_reset">
                                                <span>
                                                    <i class="la la-close"></i><span>重置</span>
                                                </span>
                                            </button>&nbsp;&nbsp;
                                            <a class="btn btn-outline-warning btn-outline-warning--icon"
                                               href="${pageContext.request.contextPath }/jsp/billadd.jsp">添加订单</a>
                                        </div>
                                    </div>
                                </form>
                                <!--end::Search Form-->

                                <!--begin: Datatable-->
                                <table class="table table-bordered table-hover table-checkable" id="kt_datatable">
                                    <thead>
                                    <tr>
                                        <th>订单编码</th>
                                        <th>商品名称</th>
                                        <th>供应商</th>
                                        <th>订单金额</th>
                                        <th>是否付款</th>
                                        <th>创建时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="bill" items="${billList }" varStatus="status">
                                        <tr>
                                            <td>${bill.billCode }</td>
                                            <td>${bill.productName }</td>
                                            <td>${bill.providerName}</td>
                                            <td>${bill.totalPrice}</td>
                                            <td>
                                                <c:if test="${bill.isPayment == 1}">未付款</c:if>
                                                <c:if test="${bill.isPayment == 2}">已付款</c:if>
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${bill.creationDate}" pattern="yyyy-MM-dd"/>
                                            </td>
                                            <td>
                                                <a href="javascript:;" billid=${bill.id } billcc=${bill.billCode }
                                                   id="view" class="btn btn-sm btn-clean btn-icon viewBill"
                                                   title="查看详情">
                                                    <i class="la la-cog"></i>
                                                </a>
                                                <a href="javascript:;" billid=${bill.id } billcc=${bill.billCode }
                                                   id="edit" class="btn btn-sm btn-clean btn-icon modifyBill"
                                                   title="编辑">
                                                    <i class="la la-edit"></i>
                                                </a>
                                                <a billid=${bill.id } billcc=${bill.billCode }
                                                   class="btn btn-sm btn-clean btn-icon deleteBill"
                                                   title="删除">
                                                    <i class="la la-trash"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!--end: Datatable-->
                                <input type="hidden" id="totalPageCount" value="${totalPageCount}"/>
                                <c:import url="rollpage.jsp">
                                    <c:param name="totalCount" value="${totalCount}"/>
                                    <c:param name="currentPageNo" value="${currentPageNo}"/>
                                    <c:param name="totalPageCount" value="${totalPageCount}"/>
                                </c:import>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--end::页面内容-->
            <%@include file="/jsp/common/footer.jsp" %>
        </div>
        <!--end::右侧页面框架-->
    </div>
</div>
<%--end::页面主体内容--%>

<%@include file="/jsp/common/user_panel.jsp" %>
<%@include file="/jsp/common/scrollToTop.jsp" %>

<script src="${pageContext.request.contextPath }/static/js/theme.js"></script>
<script src="${pageContext.request.contextPath }/static/js/plugins.bundle.js"></script>
<script src="${pageContext.request.contextPath }/static/js/scripts.bundle.js"></script>
<script src="${pageContext.request.contextPath }/static/js/datatables.bundle.js"></script>
<script src="${pageContext.request.contextPath }/static/js/billlist.js"></script>
</body>
</html>

