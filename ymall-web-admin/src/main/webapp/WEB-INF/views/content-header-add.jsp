<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/static/assets/lib/html5shiv.js"></script>
    <script type="text/javascript" src="/static/assets/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="/static/assets/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/static/assets/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="/static/assets/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="/static/assets/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="/static/assets/static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="/static/assets/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <!--/meta 作为公共模版分离出去-->

    <title>添加导航栏</title>
</head>
<body>
<article class="page-container">
    <form action="" method="post" class="form form-horizontal" id="form-admin-permission-add">
        <input type="text" class="input-text" hidden value="0" id="panelId" name="panelId">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="picUrl" name="picUrl">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>跳转链接：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="http://" id="fullUrl" name="fullUrl">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select class="select-box" style="width: 100px" id="type" name="type">
                    <option value="1" selected>站内</option>
                    <option value="0">站外</option>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>排序值：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="请输入0~9999，值越小越靠前" id="sortOrder" name="sortOrder">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <button id="saveButton" type="submit" class="btn btn-success radius" id="admin-role-save" name="admin-role-save"><i class="icon-ok"></i> 确定</button>
            </div>
        </div>
    </form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/static/assets/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/static/assets/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/static/assets/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/static/assets/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="/static/assets/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="/static/assets/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="/static/assets/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">


    /**
     * 表单提交验证
     */
    $('#form-admin-permission-add').validate({
        rules: {
            picUrl: {
                required: true,
                minlength: 1,
                maxlength: 20
            },
            fullUrl: {
                required: true,
                minlength: 10
            },
            sortOrder: {
                required: true,
                digits: true,
                maxlength: 4
            }
        },
        messages: {
            picUrl: {
                required: "名称不能为空"
            },
            fullUrl: {
                required: "跳转链接不能为空"
            },
            sortOrder: {
                required: "排序值不能为空",
            }
        },
        onkeyup: false,
        focusCleanup: true,
        success: "valid",
        submitHandler: function (form) {
            var index = layer.load(3);
            $(form).ajaxSubmit({
                url: "/content/add",
                type: "POST",
                success: function (data) {
                    layer.close(index);
                    if (data.status == 200) {
                        parent.refresh();
                        parent.msgSuccess(data.message);
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                    } else {
                        layer.alert(data.message, {title: '错误信息', icon: 2});
                    }
                },
                error: function (XMLHttpRequest) {
                    layer.close(index);
                    layer.alert('数据处理失败！错误码:' + XMLHttpRequest.status, {title: '错误信息', icon: 2});
                }
            });
        }
    });

</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
