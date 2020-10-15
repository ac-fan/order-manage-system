$(function () {

    oldpassword.next().html("*");
    newpassword.next().html("*");
    rnewpassword.next().html("*");

    oldpassword.on("blur", function () {
        $.ajax({
            type: "GET",
            url: path + "/jsp/user.do",
            data: {method: "pwdmodify", oldpassword: oldpassword.val()},
            dataType: "json",
            success: function (data) {
                if (data.result == "true") {//旧密码正确
                    validateTip(oldpassword.next(), {"color": "green"}, imgYes, true);
                } else if (data.result == "false") {//旧密码输入不正确
                    validateTip(oldpassword.next(), {"color": "red"}, imgNo + " 原密码输入不正确", false);
                } else if (data.result == "sessionerror") {//当前用户session过期，请重新登录
                    validateTip(oldpassword.next(), {"color": "red"}, imgNo + " 当前用户session过期，请重新登录", false);
                } else if (data.result == "error") {//旧密码输入为空
                    validateTip(oldpassword.next(), {"color": "red"}, imgNo + " 请输入旧密码", false);
                }
            },
            error: function (data) {
                //请求出错
                validateTip(oldpassword.next(), {"color": "red"}, imgNo + " 请求错误", false);
            }
        });


    }).on("focus", function () {
        validateTip(oldpassword.next(), {"color": "#666666"}, "* 请输入原密码", false);
    });

    newpassword.on("focus", function () {
        validateTip(newpassword.next(), {"color": "#666666"}, "* 密码长度必须是大于6小于20", false);
    }).on("blur", function () {
        if (newpassword.val() != null && newpassword.val().length > 6
            && newpassword.val().length < 20) {
            validateTip(newpassword.next(), {"color": "green"}, imgYes, true);
        } else {
            validateTip(newpassword.next(), {"color": "red"}, imgNo + " 密码输入不符合规范，请重新输入", false);
        }
    });


    rnewpassword.on("focus", function () {
        validateTip(rnewpassword.next(), {"color": "#666666"}, "* 请输入与上面一致的密码", false);
    }).on("blur", function () {
        if (rnewpassword.val() != null && rnewpassword.val().length > 6
            && rnewpassword.val().length < 20 && newpassword.val() == rnewpassword.val()) {
            validateTip(rnewpassword.next(), {"color": "green"}, imgYes, true);
        } else {
            validateTip(rnewpassword.next(), {"color": "red"}, imgNo + " 两次密码输入不一致，请重新输入", false);
        }
    });


    saveBtn.on("click", function () {
        oldpassword.blur();
        newpassword.blur();
        rnewpassword.blur();
        if (oldpassword.attr("validateStatus") == "true"
            && newpassword.attr("validateStatus") == "true"
            && rnewpassword.attr("validateStatus") == "true") {
            if (confirm("确定要修改密码？")) {
                $("#userForm").submit();
            }
        }

    });
});


function submitForm() {
    $("#editPwdForm").submit();
}

var formControls = function () {

    var oldpassword = $("#oldPassword");    //旧密码

    var arrows;
    if (KTUtil.isRTL()) {
        arrows = {
            leftArrow: '<i class="la la-angle-right"></i>',
            rightArrow: '<i class="la la-angle-left"></i>'
        }
    } else {
        arrows = {
            leftArrow: '<i class="la la-angle-left"></i>',
            rightArrow: '<i class="la la-angle-right"></i>'
        }
    }


    /**
     * 检查表格函数
     */
    var validateForm = function () {
        FormValidation.formValidation(
            document.getElementById('editPwdForm'),
            {
                fields: {
                    /**
                     * 判断表单各项是否为空或重复,并在空时返回 message 提示
                     */
                    oldPassword: {
                        validators: {
                            notEmpty: {
                                message: '旧密码不能为空.'
                            },
                            stringLength: {
                                min: 6,
                                max: 20,
                                message: "旧密码长度必须在 6 到 20 之间"
                            },
                            remote: {
                                type: "GET",//请求类型
                                url: "/jsp/user.do",//请求的url
                                dataType: "json",
                                data: {
                                    method: "pwdmodifynew",
                                    oldPassword: oldpassword.val()
                                },
                                delay:3000,
                                message: "旧密码输入错误",
                            },
                        }
                    },
                    newPassword: {
                        validators: {
                            notEmpty: {
                                message: '用户密码不能为空.'
                            },
                            stringLength: {
                                min: 6,
                                max: 20,
                                message: "密码长度必须处于 6 到 20 之间"
                            },
                        }
                    },
                    reNewPassword: {
                        validators: {
                            notEmpty: {
                                message: '确认密码不能为空.'
                            },
                            stringLength: {
                                min: 6,
                                max: 20,
                                message: "密码长度必须处于 6 到 20 之间"
                            },
                        }
                    },
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger(),
                    // Bootstrap 框架整合
                    bootstrap: new FormValidation.plugins.Bootstrap(),
                    // 点击提交按钮时进行表单校验
                    submitButton: new FormValidation.plugins.SubmitButton(),
                }
            }
        ).on('core.form.valid', function () {
            Swal.fire({
                title: "确认提交",    //提示标题
                text: "你确认要提交数据吗?",      //提示内容
                icon: "warning",            //上端图标类型
                showCancelButton: true,     //是否展示取消按钮
                cancelButtonText: "不,我再想想.", //取消按钮文本
                confirmButtonText: "确认提交" //确认按钮文本
            }).then(function (result) {
                if (result.value) {
                    //提交表单
                    submitForm();
                    Swal.fire("已提交", "修改密码成功", "success").then(function () {
                        window.history.back(-1);
                    });
                } else if (result.dismiss === "cancel") {
                    //选择取消按钮执行的操作
                    Swal.fire("已取消该操作", "操作已取消:)", "error")
                }
            });
        })//表格有效时才显示提交提醒
    }


    return {
        init: function () {
            validateForm();
        }
    };
}();

jQuery(document).ready(function () {
    formControls.init();    //加载页面时就启用检查函数
});