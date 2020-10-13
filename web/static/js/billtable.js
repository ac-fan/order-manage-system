"use strict";
var KTDatatablesDataSourceHtml = function() {

    var initTable1 = function() {
        var table = $('#kt_datatable');

        /*$("#view").on("click", function () {
            //将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
            var obj = $(this);
            window.location.href = path + "/jsp/bill.do?method=view&billid=" + obj.attr("billid");
        });

        $("#edit").on("click", function () {
            var obj = $(this);
            window.location.href = path + "/jsp/bill.do?method=modify&billid=" + obj.attr("billid");
        });

        $("#delete").on("click", function () {
            billObj = $(this);
            changeDLGContent("你确定要删除订单【" + billObj.attr("billcc") + "】吗？");
            openYesOrNoDLG();
        });*/
    };


    return {

        //main function to initiate the module
        init: function() {
            initTable1();
        },

    };

}();

jQuery(document).ready(function() {
    KTDatatablesDataSourceHtml.init();
});


$(function () {
    $("#view").on("click", function () {
        //将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
        var obj = $(this);
        window.location.href = path + "/jsp/bill.do?method=view&billid=" + obj.attr("billid");
    });

    $("#edit").on("click", function () {
        var obj = $(this);
        window.location.href = path + "/jsp/bill.do?method=modify&billid=" + obj.attr("billid");
    });

    $("#delete").on("click", function () {
        billObj = $(this);
        changeDLGContent("你确定要删除订单【" + billObj.attr("billcc") + "】吗？");
        openYesOrNoDLG();
    });
});