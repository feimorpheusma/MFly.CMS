<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserDetail.ascx.cs"
    Inherits="Mfly.CMS.Admin.Modules.UserDetail" %>
<script language="javascript" type="text/javascript">
    $(document).keypress(function (e) {
        if (e.keyCode == 13) {
            if (e.srcElement.type != 'textarea') {
                $("input[id$='btnSave']").click();
                return false;
            }
        }
    });
</script>
<div class="content">
    <div class="tags_content">
        <table style="width: 98%" border="0">
            <thead>
                <tr>
                    <td colspan="2">
                        <h3 style="float: left; width: 100%; background: #e4e3e5; margin: 0px; padding: 0px;
                            font-size: 14px; font-weight: bold;">
                            <span style="padding-left: 20px;">登录信息</span></h3>
                    </td>
                </tr>
            </thead>
            <tr>
                <td class="mtitle">
                    用户名：
                </td>
                <td style="padding-left: 10px">
                    <asp:TextBox ID="txtLoginName" runat="server" CssClass="smallInput"></asp:TextBox>
                    <font color="red">*</font>
                    <asp:CustomValidator ID="valLoginName" runat="server" ControlToValidate="txtLoginName"
                        Display="Dynamic" EnableClientScript="False" ErrorMessage="此用户名已经存在" ForeColor="Red"
                        ValidationGroup="Save" ValidateEmptyText="true" OnServerValidate="CValidatorLoginName_ServerValidate"></asp:CustomValidator>
                    <asp:RegularExpressionValidator ID="revLoginName" runat="server" ErrorMessage="系统禁止输入非法字符“<”,“>”"
                        ControlToValidate="txtLoginName" ValidationGroup="Save" EnableClientScript="false"
                        ForeColor="Red" ValidationExpression="[^<>]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr id="trPassword" runat="server">
                <td class="mtitle">
                    密码：
                </td>
                <td style="padding-left: 10px">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="smallInput"
                        Width="147px" Height="19px"></asp:TextBox>
                    <font color="red">*</font>
                    <asp:RequiredFieldValidator ID="valPassword" runat="server" ControlToValidate="txtPassword"
                        Display="Dynamic" ErrorMessage="此项必填" ValidationGroup="Save" ForeColor="Red"
                        EnableClientScript="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr id="trCalPassword" runat="server">
                <td class="mtitle">
                    确认密码：
                </td>
                <td style="padding-left: 10px">
                    <asp:TextBox ID="txtSurePassword" runat="server" TextMode="Password" CssClass="smallInput"
                        Width="147px"></asp:TextBox>
                    <font color="red">*</font>
                    <asp:RequiredFieldValidator ID="RFVsurePassword" runat="server" ControlToValidate="txtSurePassword"
                        Display="Dynamic" ErrorMessage="此项必填" ValidationGroup="Save" ForeColor="Red"
                        EnableClientScript="False"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvalPassword" runat="server" ControlToCompare="txtPassword"
                        ControlToValidate="txtSurePassword" Display="Dynamic" ErrorMessage="密码和确认密码必须一致"
                        ValidationGroup="Save" ForeColor="Red" EnableClientScript="False"></asp:CompareValidator>
                </td>
            </tr>
        </table>
        <table style="width: 98%" border="0">
            <thead>
                <tr>
                    <td colspan="2">
                        <h3 style="float: left; width: 100%; background: #e4e3e5; margin: 0px; padding: 0px;
                            font-size: 14px; font-weight: bold;">
                            <span style="padding-left: 20px;">基本信息</span></h3>
                    </td>
                </tr>
            </thead>
            <tr>
                <td class="mtitle">
                    真实姓名：
                </td>
                <td style="padding-left: 10px">
                    <asp:TextBox ID="txtRealName" runat="server" CssClass="smallInput"></asp:TextBox>
                    <font color="red">*</font>
                    <asp:RequiredFieldValidator ID="RFVRealName" runat="server" ControlToValidate="txtRealName"
                        Display="Dynamic" ErrorMessage="此项必填" ValidationGroup="Save" ForeColor="Red"
                        EnableClientScript="False"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revRealName" runat="server" ErrorMessage="系统禁止输入非法字符“<”,“>”"
                        ControlToValidate="txtRealName" ValidationGroup="Save" EnableClientScript="false"
                        ForeColor="Red" ValidationExpression="[^<>]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="mtitle">
                    头像：
                </td>
                <td style="padding-left: 10px;">
                    <asp:FileUpload ID="fuPhoto" runat="server" />
                    <asp:CustomValidator ID="CValidatorImage" runat="server" ControlToValidate="fuPhoto"
                        EnableClientScript="false" ErrorMessage="" ForeColor="Red" ValidationGroup="Save"
                        OnServerValidate="CValidatorImage_ServerValidate" ValidateEmptyText="true"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="mtitle">
                    性别：
                </td>
                <td style="padding-left: 10px;">
                    <asp:RadioButtonList ID="rblGender" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                        <asp:ListItem Text="保密" Value="0" Selected="True"/>
                        <asp:ListItem Text="男" Value="1" />
                        <asp:ListItem Text="女" Value="2" />
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="mtitle">
                    出生日期：
                </td>
                <td style="padding-left: 10px">
                    <asp:TextBox ID="txtBirthday" runat="server" CssClass="smallInput"></asp:TextBox>
                    <asp:ImageButton ID="imgSelect" runat="server" ImageUrl="~/images/datePic.png" CssClass="datepick" />
                    <asp:CustomValidator ID="CValidatorBirthday" EnableClientScript="false" runat="server"
                        OnServerValidate="CValidatorBirthday_ServerValidate" ValidationGroup="Save" ForeColor="Red"
                        ErrorMessage="请填写正确的日期"></asp:CustomValidator>
                    <ajax:CalendarExtender ID="calBirthday" runat="server" TargetControlID="txtBirthday"
                        Format="yyyy-MM-dd" PopupButtonID="imgSelect">
                    </ajax:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td class="mtitle">
                    QQ：
                </td>
                <td style="padding-left: 10px">
                    <asp:TextBox ID="txtQQ" runat="server" CssClass="smallInput"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="valQQ" runat="server" ErrorMessage="请填写正确的QQ信息"
                        ControlToValidate="txtQQ" ValidationGroup="Save" EnableClientScript="false" ForeColor="Red"
                        ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="height: 24px" class="mtitle">
                    MSN：
                </td>
                <td style="padding-left: 10px">
                    <asp:TextBox ID="txtMSN" runat="server" CssClass="smallInput"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revMSN" runat="server" ErrorMessage="系统禁止输入非法字符“<”,“>”"
                            Display="Dynamic" ControlToValidate="txtMSN" EnableClientScript="false" ForeColor="Red"
                            ValidationExpression="[^<>]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="height: 24px" class="mtitle">
                    手机号：
                </td>
                <td style="padding-left: 10px">
                    <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="25" CssClass="smallInput"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revPhone" runat="server" ErrorMessage="系统禁止输入非法字符“<”,“>”"
                        ControlToValidate="txtPhoneNumber" ValidationGroup="Save" EnableClientScript="false"
                        ForeColor="Red" ValidationExpression="[^<>]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="mtitle">
                    电子邮箱：
                </td>
                <td style="padding-left: 10px">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="smallInput"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="valEmail" runat="server" ErrorMessage="请输入正确格式的电子邮箱"
                        ValidationExpression="^([a-zA-Z0-9_\.-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$"
                        ControlToValidate="txtEmail" ValidationGroup="Save" EnableClientScript="false"
                        ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="mtitle">
                    职位：
                </td>
                <td style="padding-left: 10px">
                    <asp:TextBox ID="txtPosition" runat="server" CssClass="smallInput"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revPosition" runat="server" ErrorMessage="系统禁止输入非法字符“<”,“>”"
                            Display="Dynamic" ControlToValidate="txtPosition" EnableClientScript="false"
                            ForeColor="Red" ValidationExpression="[^<>]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="mtitle">
                    兴趣爱好：
                </td>
                <td style="padding-left: 10px">
                    <asp:TextBox ID="txtHobby" runat="server" CssClass="smallInput"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revHobby" runat="server" ErrorMessage="系统禁止输入非法字符“<”,“>”"
                            Display="Dynamic" ControlToValidate="txtHobby" EnableClientScript="false" ForeColor="Red"
                            ValidationExpression="[^<>]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="mtitle">
                    论坛签名：
                </td>
                <td style="padding-left: 10px">
                    <asp:TextBox ID="txtSignature" runat="server" CssClass="smallInput"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="mtitle">
                    公司名称：
                </td>
                <td style="padding-left: 10px">
                    <asp:TextBox ID="txtCompanyName" runat="server" CssClass="smallInput"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revCompanyName" runat="server" ErrorMessage="系统禁止输入非法字符“<”,“>”"
                            Display="Dynamic" ControlToValidate="txtCompanyName" EnableClientScript="false"
                            ForeColor="Red" ValidationExpression="[^<>]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="mtitle">
                    公司行业：
                </td>
                <td style="padding-left: 10px">
                    <asp:TextBox ID="txtCompanyIndustry" runat="server" CssClass="smallInput"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revCompanyIndustry" runat="server" ErrorMessage="系统禁止输入非法字符“<”,“>”"
                            Display="Dynamic" ControlToValidate="txtCompanyIndustry" EnableClientScript="false"
                            ForeColor="Red" ValidationExpression="[^<>]+"></asp:RegularExpressionValidator>
                </td>
            </tr>            
            <tr>
                <td class="mtitle">
                    公司电话：
                </td>
                <td style="padding-left: 10px">
                    <asp:TextBox ID="txtCompanyTel" runat="server" CssClass="smallInput"></asp:TextBox>
                     <asp:RegularExpressionValidator ID="revCompanyTel" runat="server" ErrorMessage="系统禁止输入非法字符“<”,“>”"
                            Display="Dynamic" ControlToValidate="txtCompanyTel" EnableClientScript="false"
                            ForeColor="Red" ValidationExpression="[^<>]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="mtitle">
                    公司主页：
                </td>
                <td style="padding-left: 10px">
                    <asp:TextBox ID="txtCompanyHomepage" runat="server" CssClass="smallInput"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revCompanyHomepage" runat="server" ErrorMessage="系统禁止输入非法字符“<”,“>”"
                            Display="Dynamic" ControlToValidate="txtCompanyHomepage" EnableClientScript="false"
                            ForeColor="Red" ValidationExpression="[^<>]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="mtitle">
                    公司邮箱：
                </td>
                <td style="padding-left: 10px">
                    <asp:TextBox ID="txtCompanyEmail" runat="server" CssClass="smallInput"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="请输入正确格式的电子邮箱"
                        ValidationExpression="^([a-zA-Z0-9_\.-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$"
                        ControlToValidate="txtEmail" ValidationGroup="Save" EnableClientScript="false"
                        ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="mtitle">
                    状态：
                </td>
                <td style="padding-left: 10px">
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="BigSelect">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="mtitle">
                    公司简介：
                </td>
                <td style="padding-left: 10px">
                    <asp:TextBox ID="txtCompanyProfile" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revCompanyProfile" runat="server" ErrorMessage="系统禁止输入非法字符“<”,“>”"
                            Display="Dynamic" ControlToValidate="txtCompanyProfile" EnableClientScript="false"
                            ForeColor="Red" ValidationExpression="[^<>]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
        <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
        <p align="center">
            <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" CssClass="adduserbt"
                ValidationGroup="Save" />
            <asp:Button ID="btnCancel" runat="server" Text="返回" CssClass="adduserbt" OnClick="btnCancel_Click" />
        </p>
    </div>
</div>
