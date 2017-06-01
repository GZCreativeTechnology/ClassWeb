var MyValidator = function() {
    var handleSubmit = function() {
        $('#defaultForm').validate({
            errorElement : 'span',
            errorClass : 'help-block',
            focusInvalid : false,
            rules : {
                userName : {
                    rangelength:[2,4],
                    required : true

                },
                phone : {
                    required : true,

                    rangelength:[11,11],
                    remote:{                         //自带远程验证存在的方法
                        url:"/users/checkPhone",
                        type:"get",
                        dataType:"json",
                        async:false,
                        data:{
                            phone:function(){return $("#phone").val();}
                        },
                        dataFilter: function(data, type) {
                            if (data == 'false'){
                                return true;
                            }else{
                                return false;
                            }


                        }
                    }
                },
                idCard : {
                    required : true,

                    rangelength:[18,18]
                },
            },

            messages : {
                userName : {
                    required : "名称不能为空",
                    rangelength: jQuery.format("名称长度请控制在2-4之间")
                },
                phone : {
                    required : "手机号不能为空",
                    rangelength: jQuery.format("手机必须11位"),
                    remote:"该用户已存在"
                },
                idCard : {
                    required : "身份证不能为空",
                    rangelength: jQuery.format("身份证必须18位")
                },
            },



            highlight : function(element) {
                $(element).closest('.form-group').addClass('has-error');
            },

            success : function(label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement : function(error, element) {
                element.parent('div').append(error);
            },

             submitHandler : function(form) {
                 form.submit();
             }
        });

        $('.form-horizontal input').keypress(function(e) {
            if (e.which == 13) {
                if ($('#defaultForm').validate().form()) {
                    $('#defaultForm').submit();
                }
                return false;
            }
        });
    }
    return {
        init : function() {
            handleSubmit();
        }
    };

}();

jQuery.validator.addMethod("diyCheck",function(value,element,param){
    var abc= $(element);
    var diyRule = abc.attr('diyRule');
    var exp = new RegExp(diyRule);

    return this.optional(element) || exp.test(value);
} ,$.validator.format("{0}"));

function getDate(){
    $(".form_datetime").val(new Date());
}

$(".form_datetime").datetimepicker({
    format: "yyyy-mm-dd",
    autoclose: true,
    todayBtn: true,
    todayHighlight: true,
    showMeridian: true,
    pickerPosition: "bottom-left",
    language: 'zh-CN',//中文，需要引用zh-CN.js包
    startView: 2,//月视图
    minView: 2//日期时间选择器所能够提供的最精确的时间选择视图
});
