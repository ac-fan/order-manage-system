var providerObj;


/**
 * 删除供应商函数
 */
function deleteProvider(obj) {
    $.ajax({
        type: "GET",
        url: "/jsp/provider.do",
        data: {method: "delprovider", proid: obj.attr("proid")},
        dataType: "json",
        success: function (data) {
            if (data.delResult == "true") {//删除成功：移除删除行
                obj.parents("tr").remove();
                Swal.fire("已删除!", "该供应商已被删除.", "success");
            } else if (data.delResult == "false") {//删除失败
                Swal.fire("操作失败", "对不起，删除订单【" + obj.attr("proname") + "】失败", "error");
            } else if (data.delResult == "notexist") {
                Swal.fire("操作失败", "对不起，订单【" + obj.attr("proname") + "】不存在", "error");
            } else {
                Swal.fire("操作失败", "对不起，该供应商【" + obj.attr("proname") + "】下有【" + data.delResult + "】条订单，不能删除", "error");
            }
        },
        error: function (data) {
            Swal.fire("OH NO !", "供应商删除失败!", "error");
        }
    });
}

//供应商管理页面上点击删除按钮弹出删除框(providerlist.jsp)
$(function () {
    $(".viewProvider").on("click", function () {
        //将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
        var obj = $(this);
        window.location.href = "/jsp/provider.do?method=view&proid=" + obj.attr("proid");
    });

    $(".modifyProvider").on("click", function () {
        var obj = $(this);
        window.location.href = "/jsp/provider.do?method=modify&proid=" + obj.attr("proid");
    });

    $(".deleteProvider").on("click", function () {
        var providerObj = $(this);
        Swal.fire({
            title: "你确定要删除供应商【" + providerObj.attr("proname") + "】吗?",    //提示标题
            text: "此操作一旦完成将无法恢复!",      //提示内容
            icon: "warning",            //上端图标类型
            showCancelButton: true,     //是否展示取消按钮
            cancelButtonText: "不,我再想想.", //取消按钮文本
            confirmButtonText: "是的,删除它!" //确认按钮文本
        }).then(function (result) {
            if (result.value) {
                //选择确认执行的操作
                deleteProvider(providerObj);
            } else if (result.dismiss === "cancel") {
                //选择取消按钮执行的操作
                Swal.fire("已取消该操作", "操作已取消,你成功救了它一命 :)", "error")
            }
        });
    });
});