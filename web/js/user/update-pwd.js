var MyValidator = function() {
    var handleSubmit = function() {
        $('#updatePwdForm').validate({
            errorElement : 'span',
            errorClass : 'help-block',
            focusInvalid : false,
            rules : {
                pwd : {
                    required : true,
                    rangelength:[6,16],
                    remote:{                         //自带远程验证存在的方法
                        url:"/users/checkPwd",
                        type:"get",
                        dataType:"json",
                        async:false,
                        data:{
                            phone:function(){return $("#pwd").val();}
                        },
                        dataFilter: function(data, type) {
                            if (data == 'yes'){
                                return true;
                            }else{
                                return false;
                            }


                        }
                    }
                },
                newPwd : {
                    required : true,
                    rangelength:[6,16]
                },
                conPwd :{
                    required : true,
                    equalTo: "#newPwd",
                    rangelength:[6,16]
                }

            },

            messages : {

                pwd : {
                    required : "原密码不能为空",
                    remote:"密码错误",
                    rangelength: jQuery.format("密码长度请控制在{6} ~ {16}之间")
                },
                newPwd : {
                    required : "新密码不能为空",
                    rangelength: jQuery.format("密码长度请控制在{6} ~ {16}之间")
                },
                conPwd :{
                    required : "请确认密码",
                    equalTo: "两次密码不一样",
                    rangelength: jQuery.format("密码长度请控制在{6} ~ {16}之间")
                }

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
                if ($('#updatePwdForm').validate().form()) {
                    $('#updatePwdForm').submit();
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
function checkPwd(){
    $('#newPwd').blur(function(e) {

        //密码为八位及以上并且字母数字特殊字符三项都包括
        var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");

        //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等
        var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
        if (strongRegex.test($(this).val())) {
            $('#checkPwd').css("display","block");
            $('#strong').css("background","blue");
        } else if (mediumRegex.test($(this).val())) {
            $('#checkPwd').css("display","block");
            $('#centre').css("background","green");
        } else {
            $('#checkPwd').css("display","block");
            $('#weak').css("background","red");
        }
        return true;
    });
}



