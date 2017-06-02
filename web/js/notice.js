function showAdd(){
    $("#addNotice").modal('show'); // 显示弹窗
    error.innerHTML = "";
}

function addNotice(){
    $("#addButton").attr('disabled','disabled');
    var name = $("#addNoticeName").val();
    var des = $("#addNoticeDes").val();
    var typeId = $("#addNoticeType").val();
    var error = document.getElementById("error");
    if(name == '' || des == '' || typeId == ''){
        error.innerHTML = "请输入完整的数据";
        $("#addButton").removeAttr("disabled");
    }else {
        $.post("/notice/insert/" + name + "/" + des + "/" + typeId,
            function (data) {
                location.replace("/noticeInfo/queryByPage/");
            });
    }
}

function showEdit(str){
    $.get("/notice/queryById/"+str,
        function (data) {
            $("#editNotice").modal('show'); // 显示弹窗
            $("#noticeName").val(data.name);
            $("#noticeDes").val(data.des);
            $("#noticeId").val(data.noticeId);
            error.innerHTML = "";
            ops = document.getElementById("editNoticeType");
            for(var i=0;i<ops.options.length;i++){
                if(ops.options[i].value==data.noticeTypeId){ // 假如此下拉框其中值的id等于此公告的类型id, 则设置此option为selected
                    ops.options[i].selected="selected";
                    break;
                }
            }
        });
}

function updateNotice(){
    $("#editButton").attr('disabled','disabled');
    var name = $("#noticeName").val();
    var des = $("#noticeDes").val();
    var str = $("#noticeId").val();
    var typeId = $("#editNoticeType").val();
    var error = document.getElementById("editError");
    if(name == '' || des == '' || typeId == ''){
        error.innerHTML = "请输入完整的数据";
        $("#editButton").removeAttr("disabled");
    }else {
        $.post("/notice/update/" + str + "/" + name + "/" + des + "/" + typeId,
            function (data) {
                location.replace("/noticeInfo/queryByPage/");
            });
    }
}

function showDel(str){
    $("#delNoticeId").val(str);
    $("#delNotice").modal('show'); // 显示弹窗
}

function del(){
    var str = $("#delNoticeId").val();
    $.get("/notice/deleteById/"+str,
        function (data) {
            location.replace("/noticeInfo/queryByPage/");
        });
}
