<%@ Control Language="VB" AutoEventWireup="false" CodeFile="newsLetter.ascx.vb" Inherits="UserControl_newsLetter" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
            <asp:View ID="v1" runat="server">
                <div id="newsL">
                    <div id="titleNewsL">
                        <table>
                            <tr>
                                <td>
                                    <img src="content/images/letter.png" />
                                </td>
                                <td>
                                    اشتراک خبرنامه
                                </td>
                            </tr>
                        </table>
                    </div>
                    <%-- <div>
                        <asp:TextBox ID="txtNameNews" Text="نام (اختیاری)...." onkeydown="if(event.keyCode==13){return Btn_Click(this.value);}"
                            onfocus="if(this.value=='نام (اختیاری)....'){this.value='';}" onblur="if(this.value=='')
                                    {this.value='نام (اختیاری)....';}if(this.value=='نام (اختیاری)....')this.style.color='#000';"
                            onmousedown="this.style.color='#000000';" CssClass="txtName" name="query" runat="server"></asp:TextBox></div>--%>
                    <div style="border: 1px solid #B0D1E6;">
                        <table>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtEmailNews" Text="Email...." onkeydown="if(event.keyCode==13){return Btn_Click(this.value);}"
                                        onfocus="if(this.value=='Email....'){this.value='';}" onblur="if(this.value=='')
                                    {this.value='Email....';}if(this.value=='Email....')this.style.color='#000';" onmousedown="this.style.color='#000000';"
                                        CssClass="txtEmail" name="query" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <div>
                                        <asp:LinkButton ID="btnNewsLetter" runat="server" CssClass="btnAccept" ValidationGroup="1"> > </asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="accept">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="1"
                            runat="server" ControlToValidate="txtEmailNews" ErrorMessage="**ایمیل**" Font-Names="tahoma"
                            Font-Size="11px" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="v2" runat="server">
                <div style="padding: 5px; text-align: center; font-family: koodakAnd; font-size: 20px;
                    color: #2E501F;">
                    <asp:Label ID="lblNewsLetter" runat="server"></asp:Label>
                </div>
            </asp:View>
        </asp:MultiView>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
            <ProgressTemplate>
                <span style="font-family: Tahoma; font-size: 11pxl">درحال بارگذاری....</span>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </ContentTemplate>
</asp:UpdatePanel>
<style type="text/css">
    #titleNewsL
    {
        font-family: koodakAnd;
        font-size: 19px;
        padding-right: 5px;
    }
    #newsL
    {
        margin-top: 2px;
        padding: 3px;
        -moz-border-radius: 6px;
        -webkit-border-radius: 6px;
        border-radius: 6px;
        border: 2px dotted #44B0C5;
        height:100%;
    }
    .txtName
    {
        padding: 5px;
        border: 1px solid #227D90;
        border-left: 0;
        font-family: Tahoma;
        font-size: 12px;
        width: 188px;
        font-family: koodakAnd;
        height: 25px;
        -moz-border-radius: 6px;
        -webkit-border-radius: 6px;
        border-radius: 6px;
    }
    .txtEmail
    {
        margin-top: 2px;
        direction: ltr;
        text-align: left;
        padding: 5px;
        border: 0;
        border-left: 0;
        font-family: koodakAnd;
        font-size: 12px;
        width: 148px;
        height: 25px;
        -moz-border-radius: 6px;
        -webkit-border-radius: 6px;
        border-radius: 6px;
    }
    #accept
    {
        font-family: koodakAnd;
        font-size: 20px;
        text-align: center;
        width: 188px;
        height: 32px;
    }
    .btnAccept
    {
        text-decoration: none;
        background-color: #00A318;
        padding: 11px;
        color: White;
    }
</style>
