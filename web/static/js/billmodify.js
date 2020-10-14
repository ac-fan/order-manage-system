
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

function submitForm(){
    $("#BillEditForm").submit();
}

var formControls = function () {
    /**
     * 获取供应商列表函数
     */
    var getProviderList =function(){
        $.ajax({
            type: "GET",//请求类型
            url:  "/jsp/bill.do",//请求的url
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
            document.getElementById('BillEditForm'),
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
        ).on('core.form.valid',function(){
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
                    Swal.fire("已提交","订单提交成功","success").then(function () {
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
            getProviderList();
            validateForm();
        }
    };
}();

jQuery(document).ready(function () {
    formControls.init();    //加载页面时就启用检查函数
});
