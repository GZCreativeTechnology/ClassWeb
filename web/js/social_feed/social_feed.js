var contextPath = '';

Date.prototype.pattern=function(fmt) {
    var o = {
        "M+" : this.getMonth()+1, //月份
        "d+" : this.getDate(), //日
        "h+" : this.getHours()%24 == 0 ? 24 : this.getHours()%24, //小时
        "H+" : this.getHours(), //小时
        "m+" : this.getMinutes(), //分
        "s+" : this.getSeconds(), //秒
        "q+" : Math.floor((this.getMonth()+3)/3), //季度
        "S" : this.getMilliseconds() //毫秒
    };
    var week = {
        "0" : "/u65e5",
        "1" : "/u4e00",
        "2" : "/u4e8c",
        "3" : "/u4e09",
        "4" : "/u56db",
        "5" : "/u4e94",
        "6" : "/u516d"
    };
    if(/(y+)/.test(fmt)){
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }
    if(/(E+)/.test(fmt)){
        fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "/u661f/u671f" : "/u5468") : "")+week[this.getDay()+""]);
    }
    for(var k in o){
        if(new RegExp("("+ k +")").test(fmt)){
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        }
    }
    return fmt;
}

/**
 * 回复消息
 * @param id
 * @param btn
 */
function replyMessage(id, btn) {
    var currentBtn = document.getElementById(id);
    if (btn.value == "y") {
        currentBtn.style.display = "block"; //style中的display属性
        btn.innerHTML = "收起回复";
        btn.value = "n";
    } else if (btn1.value == "n") {
        currentBtn.style.display = "none"; //style中的display属性
        btn.innerHTML = "回复";
        btn.value = "y";
    }
}

function reply(id, btn) {
    var currentBtn = document.getElementById("g" + id);
    if (btn.value == "y") {
        currentBtn.style.display = "block"; //style中的display属性
        btn.innerHTML = "收起回复";
        btn.value = "n";
    } else if (btn.value == "n") {
        currentBtn.style.display = "none"; //style中的display属性
        btn.innerHTML = "回复";
        btn.value = "y";
    }
}

/**
 * 查看回复
 * @param id
 * @param btn
 */
function comment(id, btn) {
    var currentBtn = document.getElementById("f" + id);
    if (btn.value == "y") {
        var url = contextPath + "/matter/queryCR";
        var data = {type:1};
        $("#a"+id+"").html("");
        var content = "";
        $.ajax({
            type : "get",
            async : false,  //同步请求
            url : url,
            data : {"id":id},
            timeout:1000,
            success:function(data){
                if (data.length > 0) {
                    var commentId;
                    $.each(data, function (index, item) {
                        //循环获取数据
                        var id = data[index].id;//回复的id
                        var name = data[index].userName;
                        var head = data[index].userHead;
                        var sessionHead = data[index].sessionHead; //登录用户头像
                        var sessionUserId = data[index].sessionId; // 登录用户id
                        var userId = data[index].userId;//回复的用户id
                        var head = data[index].userHead;
                        var des = data[index].des;
                        var createTime = data[index].createTime;
                        var matterUserId = data[index].matterUserId;//这条动态的用户id
                        var matterId = data[index].matterId; // 动态id
                        commentId = data[index].commentId;//评论的id
                        var roleId = data[index].roleId; // 用户的角色
                        var c;
                        var date = new Date(createTime);
                        var fmtDate = date.pattern("yyyy/MM/dd hh:mm:ss");
                            if(matterUserId == sessionUserId || userId == sessionUserId || roleId == 1) {
                                c = "<div class='social-comment'>" +
                                    "<a href='/users/queryById/" + userId + "' class='pull-left'>" +
                                    "  <img alt='image' src='" + contextPath + "/" + head + "'>" +
                                    "</a>" +
                                    "<div class='media-body'>"+
                                    "<a href='/users/queryById/' + userId><span style='color:#999'>" + name + ":</span></a>&nbsp;" +des+
                                    "&nbsp;<button class='btn btn-white btn-xs' onclick='reply(" + id + ",this);' value='y'>回复</button>&nbsp;" +
                                    "<a href='/matter/delReply?id=" + id + "&jsp=redirect:matterInFo&matterId1=" + matterId + "'><button class='btn btn-white btn-xs'>删除</button></a></li>" +
                                    " <br/><small class='text-muted'>"+ fmtDate + "</small></div>" +
                                    "<form id='addRep1' action='/matter/addReplyR' method='post'>" +
                                    "<input type='hidden' name='userName' value='" + name + "'/>" +
                                    "<input type='hidden' name='id' value='" + commentId + "'/>" +
                                    "<input type='hidden' name='userId' value='" + userId + "'/>" +
                                    " <div id='g" + id + "' style='display:none' class='social-comment'>" +
                                    "      <a href='/users/queryById/" + id + "' class='pull-left'>" +
                                    "</a>" +
                                    "  <div class='media-body' style='width:90%;text-align: left'>" +
                                    " <textarea class='form-control' name='des' placeholder='回复:" + name + "'></textarea>" +
                                    "</div>" +
                                    "<div style='text-align: right'>" +
                                    "<input id='repInput1' type='button' onclick='addRepInput1()' class='btn btn-primary btn-sm' value='发送'/>" +
                                    " </div>" +
                                    " </div>" +
                                    "</form>"
                                    + " </div>";
                            }else {
                                c = "<div class='social-comment'>" +
                                    "<a href='/users/queryById/" + userId + "' class='pull-left'>" +
                                    "  <img alt='image' src='" + contextPath + "/" + head + "'>" +
                                    "</a>" +
                                    "<div class='media-body'>"+
                                    "<a href='/users/queryById/' + userId><span style='color:#999'>" + name + ":</span></a>&nbsp;"+des+
                                    "&nbsp;<button class='btn btn-white btn-xs' onclick='reply(" + id + ",this);' value='y'>回复</button>&nbsp;" +
                                    " <br/><small class='text-muted'>"+ fmtDate + "</small></div>" +
                                    "<form id='addRep' action='/matter/addReplyR' method='post'>" +
                                    "<input type='hidden' name='userName' value='" + name + "'/>" +
                                    "<input type='hidden' name='id' value='" + commentId + "'/>" +
                                    "<input type='hidden' name='userId' value='" + userId + "'/>" +
                                    " <div id='g" + id + "' style='display:none' class='social-comment'>" +
                                    "      <a href='/users/queryById/" + id + "' class='pull-left'>" +
                                    "</a>" +
                                    "  <div class='media-body'>" +
                                    " <textarea class='form-control' name='des' placeholder='回复:" + name + "'></textarea>" +
                                    "</div>" +
                                    "<div style='text-align: right'>" +
                                    "<input id='repInput' type='button' onclick='addRepInput()' class='btn btn-primary btn-sm' value='发送'/>" +
                                    " </div>" +
                                    " </div>" +
                                    "</form>"
                                    + " </div>";
                            }
                        if (content == '') {
                            content = c;
                        } else {
                            content += c;
                        }

                    });
                    $("#a"+commentId+"").html(content);
                }

            },
            error: function() {
            }
        });
        $("#a"+id+"").html($("#a"+id+"").html() +
            "<form id='addCom' action='/matter/addReply' method='post'>" +
            "<input type='hidden' name='id' value='" + id + "'/>" +
            " <div class='social-comment'>" +
            "      <a href='' class='pull-left'>" +
            "</a>" +
            "  <div class='media-body' style='width:90%;text-align: left'>" +
            " <textarea class='form-control' name='des'placeholder='对此评论回复'></textarea>" +
            "</div>" +
            "<div style='text-align: right'>" +
            "<input id='comInput' type='button' onclick='addComInput()' class='btn btn-primary btn-sm' value='发送'/>" +
            " </div>" +
            " </div>" +
            "</form>")

        currentBtn.style.display = "block"; //style中的display属性
        btn.innerHTML = "收起回复";
        btn.value = "n";
    } else if (btn.value == "n") {
        currentBtn.style.display = "none"; //style中的display属性
        btn.innerHTML = "展开回复";
        btn.value = "y";

    }
}


/**
 * 返回底部 点击评论
 */
function returnDown() {
    var ueditorFrom = document.getElementById("ueditorFrom");
    ueditorFrom.style.display = "block"; //style中的display属性

    javascript:document.getElementsByTagName('BODY')[0].scrollTop = document.getElementsByTagName('BODY')[0].scrollHeight;
    var currentBtn = document.getElementById("ueditorFrom");
    currentBtn.style.display = "block"; //style中的display属性

    var currentBtn = document.getElementById("ctop");
    currentBtn.style.display = "none"; //style中的display属性

    var currentBtn = document.getElementById("atop");
    currentBtn.style.display = "block"; //style中的display属性

}

/**
 * 返回上一个url地址
 */
function returnUrl() {
    location.replace(document.referrer);


}
/**
 * 返回顶部
 */
function returnUP() {
    javascript:document.getElementsByTagName('BODY')[0].scrollTop = 0;
    var currentBtn = document.getElementById("atop");
    currentBtn.style.display = "none"; //style中的display属性

    var currentBtn = document.getElementById("ctop");
    currentBtn.style.display = "block"; //style中的display属性
}

function addComInput() {
    $("#comInput").attr("disabled","disabled");
    $("#addCom").submit();
}

function addRepInput() {
    $("#repInput").attr("disabled","disabled");
    $("#addRep").submit();
}

function addRepInput1() {
    $("#repInput1").attr("disabled","disabled");
    $("#addRep1").submit();
}

function ueditOnclick(){
    $("#ueitorInput").attr("disabled","disabled");
    $("#ueditorFrom").submit();
}
