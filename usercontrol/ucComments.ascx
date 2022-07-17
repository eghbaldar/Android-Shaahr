<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ucComments.ascx.vb" Inherits="Management_UserControl_ucComments" %>
<%@ Import Namespace="System.Data" %>
<%--<%@ Register Src="CapchaControl.ascx" TagName="CapchaControl" TagPrefix="uc1" %>--%>
<style type="text/css">
    @font-face
    {
        font-family: 'koodakSMS';
        src: url(      '../../content/font/W_koodak.eot' );
        src: url(      '../../content/font/W_koodak.eot?#iefix' ) format(      'embedded-opentype' ), url('../../content/font/W_koodak.woff' ) format(      'woff' ), url('../../content/font/W_koodak.TTF' ) format(      'truetype' );
    }
    .TextBoxStyle
    {
        height: 18px;
        width: 180px;
        font-family: Tahoma;
        font-size: 11px;
        border: 1px solid #ccc;
        padding: 4px;
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
        border-radius: 2px;
        background-color: #FFFFFF;
    }
    .TextareaStyle
    {
        height: 110px;
        width: 317px;
        font-family: Tahoma;
        font-size: 11px;
        border: 1px solid #ccc;
        padding: 4px;
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
        border-radius: 2px;
        background-color: #FFFFFF;
    }
    .TextareaStyle1
    {
        height: 110px;
        width: 581px;
        font-family: Tahoma;
        font-size: 11px;
        border: 1px solid #ccc;
        padding: 4px;
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
        border-radius: 2px;
        background-color: #FFFFFF;
    }
    
    .ButtonSendStyle
    {
        border: 2px solid #ADCADC;
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
        border-radius: 2px;
        background-color: #B9D1DF;
    }
</style>
<script src="../../../content/album/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function Res(e) {
        var str = e.split('_');
        if (document.getElementById('DivRes_' + str[1]).style.display == 'none') {
            document.getElementById('DivRes_' + str[1]).style.display = 'inline';

            return 0;
        }
        if (document.getElementById('DivRes_' + str[1]).style.display == 'inline') {
            document.getElementById('DivRes_' + str[1]).style.display = 'none';

            return 0;
        }

    }
</script>
<div id="Comments">
    <asp:HiddenField ID="PostIdSaver" runat="server" />
    <asp:HiddenField ID="hdShowComment" runat="server" />
    <!-- SUccess -->
    <script type="text/javascript">

        function fade() {
            $('#divSuccess').fadeIn().delay(5000).fadeOut();
            $('#divComment').fadeOut().delay(5000).fadeIn();
        }

        function validate(e) {

            var str = e.split('_');


            ////// example for local :: [ctl00_ContentPlaceHolder1_ucComments1_Repeater1_ctl00_btnSendans]
            ////// example for HOST  :: [ContentPlaceHolder1_ucComments1_Repeater1_btnSendans_0]
            // Code hae zir dar Local kar mikonam , dar local Conde "Ctl" dari vali dar host k test shod nabod
            //if (document.getElementById(str[0] + '_ContentPlaceHolder1_ucComments1_Repeater1_ctl00_txt_n1').value == 'نام شما' ||
            //    document.getElementById(str[0] + '_ContentPlaceHolder1_ucComments1_Repeater1_ctl00_txt_d1').value == 'نظر شما') {
            //    document.getElementById(str[0] + '_ContentPlaceHolder1_ucComments1_Repeater1_ctl00_txt_n1').style.border = '1px solid red';
            //    document.getElementById(str[0] + '_ContentPlaceHolder1_ucComments1_Repeater1_ctl00_txt_d1').style.border = '1px solid red';


            if (document.getElementById('ContentPlaceHolder1_ucComments1_Repeater1_txt_n1_' + str[4]).value == 'نام شما') {
                document.getElementById('ContentPlaceHolder1_ucComments1_Repeater1_txt_n1_' + str[4]).style.border = '1px solid red';
                return false;
            }
            if (document.getElementById('ContentPlaceHolder1_ucComments1_Repeater1_txt_d1_' + str[4]).value == 'نظر شما') {
                document.getElementById('ContentPlaceHolder1_ucComments1_Repeater1_txt_d1_' + str[4]).style.border = '1px solid red';
                document.getElementById('ContentPlaceHolder1_ucComments1_Repeater1_txt_n1_' + str[4]).style.border = '1px solid #CCCCCC';
                return false;
            }

        }

    </script>
    <div id="divSuccess" style="background-color: #D9E5B4; float: right; color: White;
        margin-right: 6px; width: 575px; -moz-border-radius: 5px; -webkit-border-radius: 5px;
        border-radius: 5px; display: none; padding: 8px; color: #72842E; font-family: Tahoma;
        font-size: 12px;">
        کاربر محترم ، نظر شما با موفقیت به ثبت رسید ، پس از تایید در لیست نظرات قرار داده
        می شود.
    </div>
    <!-- SUccess -->
    <div id="divComment">
        <!-- start parent repeater -->
        <div style="width: 563px; float: right;">
            <asp:Label ID="lbl_parent" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div id='<%# Eval("CommentId") %>' class="CommentContainer">
                        <div class="InfoBar">
                            <div style="float: right;">
                                <img src="../../content/images/user_blue.png" />
                            </div>
                            <div class="AutherName">
                                <%#DataBinder.Eval(Container.DataItem, "FullName")%>
                            </div>
                            <div class="DateTime">
                                <%#DataBinder.Eval(Container.DataItem, "CreateOn")%>
                            </div>
                            <div class="Answer">
                                <a id='<%# "btnRes_"+Eval("CommentId","{0}") %>' style="color: #1C5D6B; font-family: Tahoma;
                                    font-size: 11px; cursor: pointer;" onclick="return Res(this.id);">پاسخ به نظر</a>
                            </div>
                        </div>
                        <div class="Content">
                            <div>
                                <%#DataBinder.Eval(Container.DataItem, "Note")%>
                            </div>
                            <div style="display: none;" id='<%# "DivRes_"+Eval("CommentId","{0}") %>'>
                                <div style="float: right; margin-right: 10px; margin-top: 12px;">
                                    <div style="float: right;">
                                        <div>
                                            <asp:TextBox ID="txt_n1" runat="server" CssClass="TextBoxStyle" Text="نام شما" ValidationGroup="5"
                                                onfocus="if (this.value==this.defaultValue) this.value = ''" onblur="if (this.value=='') this.value = this.defaultValue"></asp:TextBox>
                                        </div>
                                        <div style="padding-top: 6px; text-align: left;">
                                            <asp:TextBox ID="txt_e1" runat="server" CssClass="TextBoxStyle" Text="پست الکترونیک"
                                                ValidationGroup="5" onfocus="if (this.value==this.defaultValue) this.value = ''"
                                                onblur="if (this.value=='') this.value = this.defaultValue"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div style="float: right; margin-right: 5px;">
                                        <div>
                                            <asp:TextBox ID="txt_d1" runat="server" CssClass="TextareaStyle" TextMode="MultiLine"
                                                Text="نظر شما" ValidationGroup="5" onfocus="if (this.value==this.defaultValue) this.value = ''"
                                                onblur="if (this.value=='') this.value = this.defaultValue"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div style="float: left; margin-left: 20px; padding-top: 5px; padding-bottom: 5px;">
                                        <asp:Button ID="btnSendans" Font-Names="tahoma" Font-Size="11px" runat="server" OnClientClick="return validate(this.id);"
                                            OnCommand="insertResponse" CommandArgument='<%# Eval("CommentId","{0}") %>' Text="ارسال نظر"
                                            Height="25px" Width="70px" ValidationGroup="5" CssClass="ButtonSendStyle" />
                                    </div>
                                </div>
                            </div>
                            <asp:Repeater ID="NestedRepeater" runat="Server">
                                <ItemTemplate>
                                    <div class="ReAnswer">
                                        <div class="InfoBar">
                                            <div style="float: right;">
                                                <img src="../../content/images/user_blue.png" />
                                            </div>
                                            <div class="AutherName">
                                                <%#DataBinder.Eval(Container.DataItem, "FullName")%>
                                            </div>
                                            <div class="DateTime">
                                                <%#DataBinder.Eval(Container.DataItem, "CreateOn")%>
                                            </div>
                                        </div>
                                        <div class="Content">
                                            <%#DataBinder.Eval(Container.DataItem, "Note")%>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <!-- end parent repeater -->
        <div id="CommentForm" class="FormContainer">
            <div style="overflow: auto;">
                <div style="float: right; overflow: auto;">
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="TextBoxStyle" Text="نام شما"
                        ValidationGroup="Comment" onfocus="if (this.value==this.defaultValue) this.value = ''"
                        onblur="if (this.value=='') this.value = this.defaultValue"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="Comment"
                        ForeColor="Red" ErrorMessage="*" ControlToValidate="txtFullName" InitialValue="نام شما"></asp:RequiredFieldValidator>
                </div>
                <div style="float: right; overflow: auto; padding-right: 10px; text-align: left;">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="TextBoxStyle" Text="پست الکترونیک"
                        ValidationGroup="Comment" onfocus="if (this.value==this.defaultValue) this.value = ''"
                        onblur="if (this.value=='') this.value = this.defaultValue"></asp:TextBox>
                </div>
            </div>
            <div style="padding-top: 10px;">
                <div>
                    <asp:TextBox ID="txtNote" runat="server" CssClass="TextareaStyle1" TextMode="MultiLine"
                        Text="نظر شما" ValidationGroup="Comment" onfocus="if (this.value==this.defaultValue) this.value = ''"
                        onblur="if (this.value=='') this.value = this.defaultValue"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="Comment"
                        ForeColor="Red" ErrorMessage="*" ControlToValidate="txtNote" InitialValue="نظر شما"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div style="border: 1px solid #EEEEEE; margin-top: 5px; padding: 5px; width: 580px;
                background: #ffffff; /* old browsers */
/* ie9 svg, needs conditional override of 'filter' to 'none' */
background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIxMDAlIiB5Mj0iMTAwJSI+CiAgICA8c3RvcCBvZmZzZXQ9IjAlIiBzdG9wLWNvbG9yPSIjZmZmZmZmIiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iNTAlIiBzdG9wLWNvbG9yPSIjZjFmMWYxIiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iNTElIiBzdG9wLWNvbG9yPSIjZTFlMWUxIiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iI2Y2ZjZmNiIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgPC9saW5lYXJHcmFkaWVudD4KICA8cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZW5lcmF0ZWQpIiAvPgo8L3N2Zz4=);
                background: -moz-linear-gradient(-45deg, #ffffff 0%, #f1f1f1 50%, #e1e1e1 51%, #f6f6f6 100%);
                /* ff3.6+ */
background: -webkit-gradient(linear, left top, right bottom, color-stop(0%,#ffffff), color-stop(50%,#f1f1f1), color-stop(51%,#e1e1e1), color-stop(100%,#f6f6f6));
                /* chrome,safari4+ */
background: -webkit-linear-gradient(-45deg, #ffffff 0%,#f1f1f1 50%,#e1e1e1 51%,#f6f6f6 100%);
                /* chrome10+,safari5.1+ */
background: -o-linear-gradient(-45deg, #ffffff 0%,#f1f1f1 50%,#e1e1e1 51%,#f6f6f6 100%); /* opera 11.10+ */
background: -ms-linear-gradient(-45deg, #ffffff 0%,#f1f1f1 50%,#e1e1e1 51%,#f6f6f6 100%); /* ie10+ */
background: linear-gradient(135deg, #ffffff 0%,#f1f1f1 50%,#e1e1e1 51%,#f6f6f6 100%); /* w3c */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=1 );
                /* ie6-8 fallback on horizontal gradient */">
                <table>
                    <tr>
                        <td>
                            عبارت امینتی زیر را در کادر وارد کنید:
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="imgCap" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtCap" Style="border: 3px solid #A5C5D9; -moz-border-radius: 5px;
                                -webkit-border-radius: 5px; border-radius: 5px; padding: 5px; text-align: center;
                                font: normal 15px tahoma;" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="overflow: auto; width: 95%; padding-top: 2px; padding-bottom: 10px; text-align: right;">
                <asp:Button ID="btnSend" Font-Names="tahoma" Font-Size="11px" runat="server" Text="ارسال نظر"
                    CssClass="ButtonSendStyle" Height="25px" Width="70px" ValidationGroup="Comment" />
            </div>
            <div style="padding-bottom: 10px;">
                <span>
                    <asp:Label ID="lblCommentMsg" runat="server"></asp:Label>
                </span>
            </div>
        </div>
    </div>
</div>
