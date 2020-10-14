var userCode = null;
var userName = null;
var userPassword = null;
var ruserPassword = null;
var phone = null;
var birthday = null;
var userRole = null;
var addBtn = null;
var backBtn = null;


$(function () {
    userCode = $("#userCode");
    userName = $("#userName");
    userPassword = $("#userPassword");
    ruserPassword = $("#ruserPassword");
    phone = $("#phone");
    birthday = $("#birthday");
    userRole = $("#userRole");
    addBtn = $("#add");
    backBtn = $("#back");
    //初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
    userCode.next().html("*");
    userName.next().html("*");
    userPassword.next().html("*");
    ruserPassword.next().html("*");
    phone.next().html("*");
    birthday.next().html("*");
    userRole.next().html("*");

    $.ajax({
        type: "GET",//请求类型
        url: path + "/jsp/user.do",//请求的url
        data: {method: "getrolelist"},//请求参数
        dataType: "json",//ajax接口（请求url）返回的数据类型
        success: function (data) {//data：返回数据（json对象）
            if (data != null) {
                userRole.html("");
                var options = "<option value=\"0\">请选择</option>";
                for (var i = 0; i < data.length; i++) {
                    //alert(data[i].id);
                    //alert(data[i].roleName);
                    options += "<option value=\"" + data[i].id + "\">" + data[i].roleName + "</option>";
                }
                userRole.html(options);
            }
        },
        error: function (data) {//当访问时候，404，500 等非200的错误状态码
            validateTip(userRole.next(), {"color": "red"}, imgNo + " 获取用户角色列表error", false);
        }
    });


    /*
     * 验证
     * 失焦\获焦
     * jquery的方法传递
     */
    userCode.bind("blur", function () {
        //ajax后台验证--userCode是否已存在
        //user.do?method=ucexist&userCode=**
        $.ajax({
            type: "GET",//请求类型
            url: path + "/jsp/user.do",//请求的url
            data: {method: "ucexist", userCode: userCode.val()},//请求参数
            dataType: "json",//ajax接口（请求url）返回的数据类型
            success: function (data) {//data：返回数据（json对象）
                if (data.userCode == "exist") {//账号已存在，错误提示
                    validateTip(userCode.next(), {"color": "red"}, imgNo + " 该用户账号已存在", false);
                } else {//账号可用，正确提示
                    validateTip(userCode.next(), {"color": "green"}, imgYes + " 该账号可以使用", true);
                }
            },
            error: function (data) {//当访问时候，404，500 等非200的错误状态码
                validateTip(userCode.next(), {"color": "red"}, imgNo + " 您访问的页面不存在", false);
            }
        });


    }).bind("focus", function () {
        //显示友情提示
        validateTip(userCode.next(), {"color": "#666666"}, "* 用户编码是您登录系统的账号", false);
    }).focus();

    userName.bind("focus", function () {
        validateTip(userName.next(), {"color": "#666666"}, "* 用户名长度必须是大于1小于10的字符", false);
    }).bind("blur", function () {
        if (userName.val() != null && userName.val().length > 1
            && userName.val().length < 10) {
            validateTip(userName.next(), {"color": "green"}, imgYes, true);
        } else {
            validateTip(userName.next(), {"color": "red"}, imgNo + " 用户名输入的不符合规范，请重新输入", false);
        }

    });

    userPassword.bind("focus", function () {
        validateTip(userPassword.next(), {"color": "#666666"}, "* 密码长度必须是大于6小于20", false);
    }).bind("blur", function () {
        if (userPassword.val() != null && userPassword.val().length > 6
            && userPassword.val().length < 20) {
            validateTip(userPassword.next(), {"color": "green"}, imgYes, true);
        } else {
            validateTip(userPassword.next(), {"color": "red"}, imgNo + " 密码输入不符合规范，请重新输入", false);
        }
    });

    ruserPassword.bind("focus", function () {
        validateTip(ruserPassword.next(), {"color": "#666666"}, "* 请输入与上面一只的密码", false);
    }).bind("blur", function () {
        if (ruserPassword.val() != null && ruserPassword.val().length > 6
            && ruserPassword.val().length < 20 && userPassword.val() == ruserPassword.val()) {
            validateTip(ruserPassword.next(), {"color": "green"}, imgYes, true);
        } else {
            validateTip(ruserPassword.next(), {"color": "red"}, imgNo + " 两次密码输入不一致，请重新输入", false);
        }
    });

    birthday.bind("focus", function () {
        validateTip(birthday.next(), {"color": "#666666"}, "* 点击输入框，选择日期", false);
    }).bind("blur", function () {
        if (birthday.val() != null && birthday.val() != "") {
            validateTip(birthday.next(), {"color": "green"}, imgYes, true);
        } else {
            validateTip(birthday.next(), {"color": "red"}, imgNo + " 选择的日期不正确,请重新输入", false);
        }
    });

    phone.bind("focus", function () {
        validateTip(phone.next(), {"color": "#666666"}, "* 请输入手机号", false);
    }).bind("blur", function () {
        var patrn = /^(13[0-9]|15[0-9]|18[0-9])\d{8}$/;
        if (phone.val().match(patrn)) {
            validateTip(phone.next(), {"color": "green"}, imgYes, true);
        } else {
            validateTip(phone.next(), {"color": "red"}, imgNo + " 您输入的手机号格式不正确", false);
        }
    });

    userRole.bind("focus", function () {
        validateTip(userRole.next(), {"color": "#666666"}, "* 请选择用户角色", false);
    }).bind("blur", function () {
        if (userRole.val() != null && userRole.val() > 0) {
            validateTip(userRole.next(), {"color": "green"}, imgYes, true);
        } else {
            validateTip(userRole.next(), {"color": "red"}, imgNo + " 请重新选择用户角色", false);
        }
    });

    addBtn.bind("click", function () {
        if (userCode.attr("validateStatus") != "true") {
            userCode.blur();
        } else if (userName.attr("validateStatus") != "true") {
            userName.blur();
        } else if (userPassword.attr("validateStatus") != "true") {
            userPassword.blur();
        } else if (ruserPassword.attr("validateStatus") != "true") {
            ruserPassword.blur();
        } else if (birthday.attr("validateStatus") != "true") {
            birthday.blur();
        } else if (phone.attr("validateStatus") != "true") {
            phone.blur();
        } else if (userRole.attr("validateStatus") !== "true") {
            userRole.blur();
        } else {
            if (confirm("是否确认提交数据")) {
                $("#userForm").submit();
            }
        }
    });

    backBtn.on("click", function () {
        if (referer !== undefined && "" !== referer && "null" !== referer
            && referer.length > 4) {
            window.location.href = referer;
        } else {
            history.back(-1);
        }
    });
});

function priceReg(value) {
    value = value.replace(/[^\d.]/g, "");  //清除“数字”和“.”以外的字符
    value = value.replace(/^\./g, "");  //验证第一个字符是数字而不是.
    value = value.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的.
    value = value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");//去掉特殊符号￥
    if (value.indexOf(".") > 0) {
        value = value.substring(0, value.indexOf(".") + 3);
    }
    return value;
}

function submitForm() {
    $("#userForm").submit();
}

var formControls = function () {

    addBtn = $("#addButton"); //指定添加按钮

    /**
     * 获取用户角色列表函数
     */
    var getProviderList = function () {
        $.ajax({
            type: "GET",//请求类型
            url: "/jsp/user.do",//请求的url
            data: {method: "getproviderlist"},//请求参数
            dataType: "json",//ajax接口（请求url）返回的数据类型
            success: function (data) {//data：返回数据（json对象）
                if (data != null) {
                    $("select").html("");
                    //通过标签选择器，得到select标签，适用于页面里只有一个select
                    var options = "<option value=\"0\">请选择</option>";
                    for (var i = 0; i < data.length; i++) {
                        options += "<option value=\"" + data[i].id + "\">" + data[i].proName + "</option>";
                    }
                    $("select").html(options);
                }
            },
            error: function (data) {//当访问时候，404，500 等非200的错误状态码
                validateTip(providerId.next(), {"color": "red"}, imgNo + " 获取供应商列表error", false);
            }
        });
    }

    /**
     * 检查表格函数
     */
    var validateForm = function () {
        FormValidation.formValidation(
            document.getElementById('billForm'),
            {
                fields: {
                    /**
                     * 判断表单各项是否为空,并在空时返回 message 提示
                     */
                    billCode: {
                        validators: {
                            notEmpty: {
                                message: '订单编号不能为空.'
                            }
                        }
                    },
                    productName: {
                        validators: {
                            notEmpty: {
                                message: '请输入商品名称'
                            },
                            stringLength: {
                                min: 1,
                                max: 100,
                                message: '请输入长度为 1 到 100 的字符'
                            }
                        }
                    },
                    productUnit: {
                        validators: {
                            notEmpty: {
                                message: '请输入商品单位'
                            }
                        }
                    },
                    productCount: {
                        validators: {
                            notEmpty: {
                                message: '请输入商品数量'
                            }
                        }
                    },
                    totalPrice: {
                        validators: {
                            notEmpty: {
                                message: '请输入商品数量'
                            }
                        }
                    },
                    providerId: {
                        validators: {
                            notEmpty: {
                                message: '请选择供应商'
                            }
                        }
                    },
                    isPayment: {
                        validators: {
                            choice: {
                                min: 1,
                                message: '请选择付款状态'
                            }
                        }
                    }
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
                    Swal.fire("已提交", "订单提交成功", "success")
                } else if (result.dismiss === "cancel") {
                    //选择取消按钮执行的操作
                    Swal.fire("已取消该操作", "操作已取消:)", "error")
                }
            });
        })//表格有效时才显示提交提醒
    }


    return {
        init: function () {
            getProviderList();
            validateForm();
        }
    };
}();

jQuery(document).ready(function () {
    formControls.init();    //加载页面时就启用检查函数
});
