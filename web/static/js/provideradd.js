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
    $("#providerForm").submit();
}

var formControls = function () {

    addBtn = $("#addButton"); //指定添加按钮
    /**
     * 检查表格函数
     */
    var validateForm = function () {
        FormValidation.formValidation(
            document.getElementById('providerForm'),
            {
                fields: {
                    /**
                     * 判断表单各项是否为空,并在空时返回 message 提示
                     */
                    proCode: {
                        validators: {
                            notEmpty: {
                                message: '供应商编码不能为空.'
                            }
                        }
                    },
                    proName: {
                        validators: {
                            notEmpty: {
                                message: '请输入供应商名称'
                            },
                            stringLength: {
                                min: 1,
                                max: 100,
                                message: '供应商名称长度应为 1 到 100 个字符'
                            }
                        }
                    },
                    proContact: {
                        validators: {
                            notEmpty: {
                                message: '请输入联系人'
                            }
                        }
                    },
                    proPhone: {
                        validators: {
                            notEmpty: {
                                message: '请输入联系电话'
                            },
                            phone: {
                                country: 'CN',
                                message: '这不是一个有效的电话号码'
                            }
                        }
                    },
                    proAddress: {
                        validators: {
                            notEmpty: {
                                message: '请输入联系地址'
                            }
                        }
                    },
                    proFax: {
                        validators: {
                            notEmpty: {
                                message: '请输入传真'
                            },
                            phone: {
                                country: 'CN',
                                message: '这不是一个有效的传真号码'
                            }
                        }
                    },
                    proDesc: {
                        validators: {
                            notEmpty: {
                                message: '请填写描述'
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
            validateForm();
        }
    };
}();

jQuery(document).ready(function () {
    formControls.init();    //加载页面时就启用检查函数
});
