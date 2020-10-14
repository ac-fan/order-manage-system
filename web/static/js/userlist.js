var userObj;

//用户管理页面上点击删除按钮弹出删除框(userlist.jsp)
function deleteUser(obj) {
    $.ajax({
        type: "GET",
        url: path + "/jsp/user.do",
        data: {method: "deluser", uid: obj.attr("userid")},
        dataType: "json",
        success: function (data) {
            if (data.delResult == "true") {//删除成功：移除删除行
                obj.parents("tr").remove();
                Swal.fire("已删除!", "该用户已被删除.", "success");
            } else if (data.delResult == "false") {//删除失败
                //alert("对不起，删除用户【"+obj.attr("username")+"】失败");

                Swal.fire("已取消该操作", "对不起，删除用户【" + obj.attr("username") + "】失败", "error");
            } else if (data.delResult == "notexist") {
                //alert("对不起，用户【"+obj.attr("username")+"】不存在");

                Swal.fire("已取消该操作", "对不起，用户【" + obj.attr("username") + "】不存在", "error");
            }
        },
        error: function (data) {
            //alert("对不起，删除失败");
            Swal.fire("OH NO !", "用户删除失败!", "error");
        }
    });
}

$(function () {
    //查看详情按钮的跳转
    $(".viewUser").on("click", function () {
        //将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
        var obj = $(this);
        window.location.href = "/jsp/user.do?method=view&uid=" + obj.attr("userid");
    });

    //修改按钮的跳转
    $(".modifyUser").on("click", function () {
        var obj = $(this);
        window.location.href = "/jsp/user.do?method=modify&uid=" + obj.attr("userid");
    });

    //点击删除按钮的提示
    $(".deleteUser").on("click", function () {
        billObj = $(this);
        Swal.fire({
            title: "你确定要删除用户【" + billObj.attr("username") + "】吗?",    //提示标题
            text: "此操作一旦完成将无法恢复!",      //提示内容
            icon: "warning",            //上端图标类型
            showCancelButton: true,     //是否展示取消按钮
            cancelButtonText: "不,我再想想.", //取消按钮文本
            confirmButtonText: "是的,删除它!" //确认按钮文本
        }).then(function (result) {
            if (result.value) {
                //选择确认执行的操作
                deleteUser(userObj);
            } else if (result.dismiss === "cancel") {
                //选择取消按钮执行的操作
                Swal.fire("已取消该操作", "操作已取消,你成功救了它一命 :)", "error")
            }
        });
    });
});

