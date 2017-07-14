$(function () {
    $("input[name^='FileUpload']").bind("change", function () {
        //开始提交
        var i = $("input[name^='FileUpload']").index(this);

            $("#form1").ajaxSubmit({
                beforeSubmit: function(formData, jqForm, options){
                    //隐藏上传按钮
                    $("#files" + i).hide();
                    //显示LOADING图片
                    $("#uploading" + i).show();
                },
                success: function(data, textStatus) {
                    if (data.msg == 1) {
                        $("#txtImgUrl" + i).val(data.msbox);
                    } else {
                        alert(data.msbox);
                    }
                    $("#files" + i).show();
                    $("#uploading" + i).hide();
                },
                error: function(data, status, e) {
                   alert("上传失败，错误信息：" + e);
                   $("#files" + i).show();
                   $("#uploading" + i).hide();
                },
                url: "/Tools/MultipleUpload.ashx?index=" + i,
                type: "post",
                dataType: "json",
                timeout: 600000
            });
        });
});