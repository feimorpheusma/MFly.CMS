<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true"
    CodeBehind="CustomerDetail.aspx.cs" Inherits="EMarket.Admin.SysManage.User.CustomerDetail" %>

<%@ Register Src="../../Modules/OrgnizationTree.ascx" TagName="orgnizationtree" TagPrefix="uc" %>
<asp:Content ID="Content" ContentPlaceHolderID="cphContent" runat="server">
    <asp:UpdatePanel ID="upAgent" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="content">
                <div class="tags_content">
                    <table style="width: 97%" border="0">
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
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtLoginName" runat="server" CssClass="smallInput">
                                </asp:TextBox>
                                <font color="red">*</font>
                                <asp:RequiredFieldValidator ID="RFVLoginName" runat="server" ControlToValidate="txtLoginName"
                                    EnableClientScript="false" ErrorMessage="此项必填" ForeColor="Red" ValidationGroup="Customer"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="CValidatorLoinName" EnableClientScript="false" runat="server"
                                    ErrorMessage="此用户名已经存在" ForeColor="Red" ValidationGroup="Customer" OnServerValidate="CValidatorLoginName_ServerValidate"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr id="trPassword" runat="server">
                            <td class="mtitle">
                                密码：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="smallInput"
                                    Width="149px"></asp:TextBox>
                                <font color="red">*</font>
                                <asp:RequiredFieldValidator ID="valPassword" runat="server" ControlToValidate="txtPassword"
                                    ErrorMessage="此项必填" ForeColor="Red" ValidationGroup="Customer" EnableClientScript="False"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr id="trPasswordSure" runat="server">
                            <td class="mtitle">
                                确认密码：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtPasswordSure" TextMode="Password" runat="server" CssClass="smallInput"
                                    Width="149px"></asp:TextBox>
                                <font color="red">*</font>
                                <asp:RequiredFieldValidator ID="RFVator" runat="server" ControlToValidate="txtPasswordSure"
                                    ErrorMessage="此项必填" ForeColor="Red" ValidationGroup="Customer" EnableClientScript="False"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="valPasswordSure" runat="server" ControlToCompare="txtPassword"
                                    ControlToValidate="txtPasswordSure" ErrorMessage="密码和确认密码必须一致" ForeColor="Red"
                                    EnableClientScript="false" ValidationGroup="Customer"></asp:CompareValidator>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 97%">
                        <thead>
                            <tr>
                                <td colspan="6">
                                    <h3 style="float: left; width: 100%; background: #e4e3e5; margin: 0px; padding: 0px;
                                        font-size: 14px; font-weight: bold;">
                                        <span style="padding-left: 20px;">公司信息</span></h3>
                                </td>
                            </tr>
                        </thead>
                        <tr>
                            <td class="mtitle">
                                公司全称：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtCompanyName" runat="server" CssClass="smallInput"></asp:TextBox>
                                <font color="red">*</font>
                                <asp:RequiredFieldValidator ID="RFVCompanyName" runat="server" ControlToValidate="txtCompanyName"
                                    ErrorMessage="此项必填" ForeColor="Red" ValidationGroup="Customer" EnableClientScript="False"></asp:RequiredFieldValidator>
                            </td>
                            <td class="mtitle">
                                税务登记号：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtTaxNumber" runat="server" CssClass="smallInput"></asp:TextBox>
                                <font color="red">*</font>
                                <asp:RequiredFieldValidator ID="RFVTaxNumber" runat="server" ControlToValidate="txtTaxNumber"
                                    ErrorMessage="此项必填" ForeColor="Red" ValidationGroup="Customer" EnableClientScript="False"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="mtitle">
                                开户行：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtBank" runat="server" CssClass="smallInput"></asp:TextBox>
                            </td>
                            <td class="mtitle">
                                账号：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtBankAccount" runat="server" CssClass="smallInput"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="mtitle">
                                邮编：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtPostcode" runat="server" CssClass="smallInput"></asp:TextBox>
                                <font color="red">*</font>
                                <asp:RequiredFieldValidator ID="RFVPostcode" runat="server" ControlToValidate="txtPostcode"
                                    ErrorMessage="此项必填" ForeColor="Red" ValidationGroup="Customer" EnableClientScript="False"></asp:RequiredFieldValidator>
                            </td>
                            <td class="mtitle" style="width: 120px; text-align: center">
                                授权代理区域(行业)：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtAgentArea" runat="server" CssClass="smallInput"></asp:TextBox>
                                <font color="red">*</font>
                                <asp:RequiredFieldValidator ID="RFVAgentArea" runat="server" ControlToValidate="txtAgentArea"
                                    ErrorMessage="此项必填" ForeColor="Red" ValidationGroup="Customer" EnableClientScript="False"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="mtitle">
                                发票电话：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtTaxPhone" runat="server" CssClass="smallInput"> 
                                </asp:TextBox>
                            </td>
                            <td class="mtitle">
                                发票地址：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtInvoiceAddress" runat="server" CssClass="smallInput"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td class="mtitle">
                                通讯地址：
                            </td>
                            <td colspan="3">
                                <asp:UpdatePanel ID="upenlCity" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        &nbsp;
                                        <asp:DropDownList ID="ddlistAddressProvince" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlistAddressProvince_SelectedIndexChanged"
                                            Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;
                                        <asp:DropDownList ID="ddlisttAddressCity" runat="server" Enabled="false" CssClass="BigSelect">
                                            <asp:ListItem Value="0" Text="请选择城市"></asp:ListItem>
                                        </asp:DropDownList>
                                        &nbsp;
                                        <asp:TextBox ID="txtAddressStreet" runat="server" CssClass="smallInput" Width="425px"></asp:TextBox>
                                        <font color="red">*</font>
                                        <asp:CompareValidator ID="CVdatorAddressProvince" runat="server" ControlToValidate="ddlistAddressProvince"
                                            Display="Dynamic" ErrorMessage="此项必填" ForeColor="Red" Operator="NotEqual" Type="String"
                                            ValidationGroup="Customer" ValueToCompare="0" EnableClientScript="False"></asp:CompareValidator>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="mtitle">
                                公司简介：
                            </td>
                            <td colspan="3" style="padding-top: 5px; padding-bottom: 0px">
                                &nbsp;
                                <asp:TextBox ID="txtIntroduction" runat="server" TextMode="MultiLine" Width="400"
                                    Rows="5"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td class="mtitle">
                                公司网址：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtCompanyWebSite" runat="server" CssClass="smallInput"></asp:TextBox>
                            </td>
                            <td class="mtitle">
                                公司电话：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="smallInput"></asp:TextBox>
                                <font color="red">*</font>
                                <asp:RequiredFieldValidator ID="RFVPhone" runat="server" ControlToValidate="txtPhone"
                                    EnableClientScript="False" ErrorMessage="此项必填" ForeColor="Red" ValidationGroup="Customer"></asp:RequiredFieldValidator>
                            </td>
                            <td class="mtitle">
                                公司传真：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtFax" runat="server" CssClass="smallInput"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="mtitle">
                                法人代表姓名：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtCRName" runat="server" CssClass="smallInput"></asp:TextBox>
                                <font color="red">*</font>
                                <asp:RequiredFieldValidator ID="RFVCRName" runat="server" ControlToValidate="txtCRName"
                                    EnableClientScript="False" ErrorMessage="此项必填" ForeColor="Red" ValidationGroup="Customer"></asp:RequiredFieldValidator>
                            </td>
                            <td class="mtitle">
                                身份证号码：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtCRId" runat="server" CssClass="smallInput"></asp:TextBox>
                                <font color="red">*</font>
                                <asp:RequiredFieldValidator ID="RFVCRId" runat="server" ControlToValidate="txtCRId"
                                    EnableClientScript="False" ErrorMessage="此项必填" ForeColor="Red" ValidationGroup="Customer"></asp:RequiredFieldValidator>
                            </td>
                            <td class="mtitle">
                                联系电话：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtCRPhone" runat="server" CssClass="smallInput"></asp:TextBox>
                                <font color="red">*</font>
                                <asp:RequiredFieldValidator ID="RFVCRPhone" runat="server" ControlToValidate="txtCRPhone"
                                    EnableClientScript="False" ErrorMessage="此项必填" ForeColor="Red" ValidationGroup="Customer"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="mtitle">
                                总经理姓名：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtGMName" runat="server" CssClass="smallInput"></asp:TextBox>
                                <font color="red">*</font>
                                <asp:RequiredFieldValidator ID="RFVGMName" runat="server" ControlToValidate="txtGMName"
                                    EnableClientScript="False" ErrorMessage="此项必填" ForeColor="Red" ValidationGroup="Customer"></asp:RequiredFieldValidator>
                            </td>
                            <td class="mtitle">
                                身份证号码：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtGMId" runat="server" CssClass="smallInput"></asp:TextBox>
                                <font color="red">*</font>
                                <asp:RequiredFieldValidator ID="RFVGMId" runat="server" ControlToValidate="txtGMId"
                                    EnableClientScript="False" ErrorMessage="此项必填" ForeColor="Red" ValidationGroup="Customer"></asp:RequiredFieldValidator>
                            </td>
                            <td class="mtitle">
                                联系电话：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtGMPhone" runat="server" CssClass="smallInput"></asp:TextBox>
                                <font color="red">*</font>
                                <asp:RequiredFieldValidator ID="RFVGMPhone" runat="server" ControlToValidate="txtGMPhone"
                                    EnableClientScript="False" ErrorMessage="此项必填" ForeColor="Red" ValidationGroup="Customer"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <thead>
                            <tr>
                                <td colspan="6">
                                    <h3 style="float: left; width: 100%; background: #e4e3e5; margin: 0px; padding: 0px;
                                        font-size: 14px; font-weight: bold;">
                                        <span style="padding-left: 20px;">业务接口人</span></h3>
                                </td>
                            </tr>
                        </thead>
                        <tr>
                            <td colspan="6">
                                <table style="width: 100%">
                                    <tr>
                                        <td class="mtitle">
                                            岗位
                                        </td>
                                        <td class="mtitle">
                                            姓名
                                        </td>
                                        <td class="mtitle">
                                            部门、职务
                                        </td>
                                        <td class="mtitle">
                                            电话
                                        </td>
                                        <td class="mtitle">
                                            手机
                                        </td>
                                        <td class="mtitle">
                                            邮箱
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="mtitle">
                                            主要负责人
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtMainDirectorName" runat="server" CssClass="smallInput"></asp:TextBox>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtMainDirectorDuty" runat="server" CssClass="smallInput"></asp:TextBox>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtMainDirectorPhone" runat="server" CssClass="smallInput"></asp:TextBox>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtMainDirectorMobilePhone" runat="server" CssClass="smallInput"></asp:TextBox>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtMainDirectorEMail" runat="server" CssClass="smallInput" MaxLength="50"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="mtitle">
                                            销售接口人
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtSaleDirectorName" runat="server" CssClass="smallInput"></asp:TextBox>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtSaleDirectorDuty" runat="server" CssClass="smallInput"></asp:TextBox>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtSaleDirectorPhone" runat="server" CssClass="smallInput"></asp:TextBox>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtSaleDirectorMobilePhone" runat="server" CssClass="smallInput"></asp:TextBox>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtSaleDirectorEmail" runat="server" CssClass="smallInput" MaxLength="50"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="mtitle">
                                            技术接口人
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtTechDirectorName" runat="server" CssClass="smallInput"></asp:TextBox>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtTechDirectorDuty" runat="server" CssClass="smallInput"></asp:TextBox>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtTechDirectorPhone" runat="server" CssClass="smallInput"></asp:TextBox>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtTechDirectorMobilePhone" runat="server" CssClass="smallInput"></asp:TextBox>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtTechDirectorEmail" runat="server" CssClass="smallInput" MaxLength="50"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="mtitle">
                                            订单接口人
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtOrderDirectorName" runat="server" CssClass="smallInput"></asp:TextBox>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtOrderDirectorDuty" runat="server" CssClass="smallInput"></asp:TextBox>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtOrderDirectorPhone" runat="server" CssClass="smallInput"></asp:TextBox>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtOrderDirectorMobilePhone" runat="server" CssClass="smallInput"></asp:TextBox>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtOrderDirectorEmail" runat="server" CssClass="smallInput" MaxLength="50"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 97%" border="0">
                        <thead>
                            <tr>
                                <td colspan="2">
                                    <h3 style="float: left; width: 100%; background: #e4e3e5; margin: 0px; padding: 0px;
                                        font-size: 14px; font-weight: bold;">
                                        <span style="padding-left: 20px;">个人信息</span></h3>
                                </td>
                            </tr>
                        </thead>
                        <tr>
                            <td class="mtitle">
                                姓名：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtPersonalName" runat="server" CssClass="smallInput"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="mtitle">
                                性别：
                            </td>
                            <td>
                                &nbsp;
                                <asp:DropDownList ID="ddlPersonalSex" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="mtitle">
                                出生日期：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtPersonalBirthDate" runat="server" CssClass="smallInput"></asp:TextBox>
                                <asp:ImageButton ID="imgSelectStart" runat="server" ImageUrl="~/images/datePic.png"
                                    CssClass="datepick" />
                                <ajax:CalendarExtender ID="calStartDate" runat="server" TargetControlID="txtPersonalBirthDate"
                                    Format="yyyy-MM-dd" PopupButtonID="imgSelectStart">
                                </ajax:CalendarExtender>
                                <asp:RegularExpressionValidator ID="revDate" runat="server" ErrorMessage="请输入正确的日期，格式为yyyy-mm-dd"
                            ForeColor="Red" EnableClientScript="false" ValidationGroup="Customer" ControlToValidate="txtPersonalBirthDate" ValidationExpression="^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29))$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="mtitle">
                                电话：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtPersonalPhone" runat="server" CssClass="smallInput"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="mtitle">
                                邮箱：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtPersonalEmail" runat="server" CssClass="smallInput"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="mtitle">
                                地址：
                            </td>
                            <td>
                                <asp:UpdatePanel ID="upPersonalAddress" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        &nbsp;
                                        <asp:DropDownList ID="ddlPersonalProvince" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPersonalProvince_SelectedIndexChanged"
                                            Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;
                                        <asp:DropDownList ID="ddlPersonalCity" runat="server" Enabled="false" CssClass="BigSelect">
                                            <asp:ListItem Value="0" Text="请选择城市"></asp:ListItem>
                                        </asp:DropDownList>
                                        &nbsp;
                                        <asp:TextBox ID="txtPersonalStreet" runat="server" CssClass="smallInput" Width="425px"></asp:TextBox>
                                        <font color="red">*</font>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="mtitle">
                                邮编：
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="txtPersonalZipCode" runat="server" CssClass="smallInput"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 97%" border="0">
                        <thead>
                            <tr>
                                <td colspan="2">
                                    <h3 style="float: left; width: 100%; background: #e4e3e5; margin: 0px; padding: 0px;
                                        font-size: 14px; font-weight: bold;">
                                        <span style="padding-left: 20px;">其他信息</span></h3>
                                </td>
                            </tr>
                        </thead>
                        <tr>
                            <td class="mtitle">
                                用户组：
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;
                                <asp:DropDownList ID="ddlCustomerGroup" runat="server" CssClass="carlist">
                                </asp:DropDownList>
                                <span style="color: #FF0000">*</span>
                            </td>
                        </tr>
                        <tr id="tr1" runat="server">
                            <td class="mtitle">
                                账户余额：
                            </td>
                            <td>
                                &nbsp; ￥<asp:TextBox ID="txtCashValue" runat="server" CssClass="smallInput"></asp:TextBox>
                                <asp:CustomValidator ID="cusCashValue" runat="server" ControlToValidate="txtCashValue"
                                    ErrorMessage="请输入最高精确到小数点后两位的正数" ForeColor="Red" OnServerValidate="cusCashValue_ServerValidate"
                                    ValidationGroup="Customer" EnableClientScript="False"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr id="tr2" runat="server">
                            <td class="mtitle">
                                状态：
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;
                                <asp:DropDownList ID="ddlistStatus" runat="server" CssClass="carlist">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="mtitle">
                                销售人员：
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;
                                <asp:DropDownList ID="ddlistCustomerManager" runat="server" CssClass="carlist">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <p>
                        <asp:Button ID="btnOK" runat="server" Text="保存" OnClick="btnOK_Click" CssClass="adduserbt"
                            ValidationGroup="Customer" />
                        <asp:Button ID="btnCancel" runat="server" Text="返回" OnClick="btnCancel_Click" CausesValidation="false"
                            CssClass="adduserbt" /></p>
                    <br />
                    <asp:Label ID="lblError" runat="server" ForeColor="red" Text=""></asp:Label>
                    <br />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
