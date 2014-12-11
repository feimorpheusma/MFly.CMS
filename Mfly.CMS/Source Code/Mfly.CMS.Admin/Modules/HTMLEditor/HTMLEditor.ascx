<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HTMLEditor.ascx.cs"
    Inherits="Mfly.CMS.ERP.Modules.HTMLEditor.HTMLEditor" %>
<link rel="stylesheet" href="/Modules/HTMLEditor/Resource/themes/default/default.css"
    type="text/css" />
<link rel="stylesheet" href="/Modules/HTMLEditor/Resource/plugins/code/prettify.css"
    type="text/css" />
<script charset="utf-8" src="/Modules/HTMLEditor/Resource/kindeditor.js" type="text/javascript"></script>
<script charset="utf-8" src="/Modules/HTMLEditor/Resource/lang/zh_CN.js" type="text/javascript"></script>
<script charset="utf-8" src="/Modules/HTMLEditor/Resource/plugins/code/prettify.js"
    type="text/javascript"></script>
<script type="text/javascript">
    KindEditor.ready(function (K) {
        var editor1 = K.create('#txtEditorContent', {
            cssPath: '/Modules/HTMLEditor/Resource/plugins/code/prettify.css',
            uploadJson: '/Modules/HTMLEditor/GenericHandler/upload_json.ashx',
            fileManagerJson: '/Modules/HTMLEditor/GenericHandler/file_manager_json.ashx',
            allowFileManager: true,
            resizeType: 1,
            items: [
						'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons', 'image', 'link']

        });
        prettyPrint();
    });
</script>
<asp:TextBox runat="server" ID="txtEditorContent" ClientIDMode="Static" Style="width: 700px;
    height: 200px; visibility: hidden;" />
