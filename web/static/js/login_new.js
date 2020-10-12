"use strict";

// Class Definition
var KTLogin = function () {
    var _login;

    var _handleSignInForm = function () {
        var validation;

        // Init form validation rules. For more info check the FormValidation plugin's official documentation:https://formvalidation.io/
        validation = FormValidation.formValidation(
            KTUtil.getById('kt_login_signin_form'),
            {
                fields: {
                    userCode: {
                        validators: {
                            notEmpty: {
                                message: '请输入用户名'
                            }
                        }
                    },
                    userPassword: {
                        validators: {
                            notEmpty: {
                                message: '请输入密码'
                            }
                        }
                    }
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger(),
                    submitButton: new FormValidation.plugins.SubmitButton(),
                    //defaultSubmit: new FormValidation.plugins.DefaultSubmit(), // Uncomment this line to enable normal button submit after form validation
                    bootstrap: new FormValidation.plugins.Bootstrap()
                }
            }
        );

        /**
         * 登录表单提交方法
         */
        $('#kt_login_signin_submit').on('click', function (e) {
            e.preventDefault();

            validation.validate().then(function (status) {
                if (status === 'Valid') {
                    $.ajax({
                        type: "POST",//请求类型
                        url: path + "/login.do",//请求的url
                        data: {
                            userCode: $("#userCode"),
                            userPassword: $("#userPassword")
                        },//请求参数
                        dataType: "json",//ajax接口（请求url）返回的数据类型
                        success: function (data) {//data：返回数据（json对象）
                            //TODO
                            /**
                             * 登录成功并跳转
                             */
                        },
                        error: function (data) {//当访问时候，404，500 等非200的错误状态码
                            //validateTip(userRole.next(), {"color": "red"}, imgNo + " 获取用户角色列表error", false);
                            swal.fire({
                                text: "All is cool! Now you submit this form",
                                icon: "success",
                                buttonsStyling: false,
                                confirmButtonText: "Ok, got it!",
                                customClass: {
                                    confirmButton: "btn font-weight-bold btn-light-primary"
                                }
                            }).then(function () {
                                KTUtil.scrollTop();
                            });
                        }
                    });


                } else {
                    swal.fire({
                        text: "对不起, 请填写完成所有表单内容再提交哦.",
                        icon: "error",
                        buttonsStyling: false,
                        confirmButtonText: "好的, 这就去!",
                        customClass: {
                            confirmButton: "btn font-weight-bold btn-light-primary"
                        }
                    }).then(function () {
                        KTUtil.scrollTop();
                    });
                }
            });
        });
    }

    // Public Functions
    return {
        // public functions
        init: function () {
            _login = $('#kt_login');
            _handleSignInForm();
        }
    };
}();

// Class Initialization
jQuery(document).ready(function () {
    KTLogin.init();
});
