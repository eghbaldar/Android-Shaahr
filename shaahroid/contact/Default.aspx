<%@ Page Title="" Language="VB" MasterPageFile="~/MasterOther.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="shaahroid_contact_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: 'koodakAnd';
            src: url(      '../../content/font/W_koodak.eot' );
            src: url(      '../../content/font/W_koodak.eot?#iefix' ) format(      'embedded-opentype' ), url('../../content/font/W_koodak.woff' ) format(      'woff' ), url('../../content/font/W_koodak.TTF' ) format(      'truetype' );
        }
        .BigDiv
        {
            width:600px;
        }
        .font
        {
            font-family:Tahoma;font-size:11px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <div style="float: right;padding-top:10px;">
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <div class="BigDiv">
                        <table style="width: 100%;">
                            <tr>
                                <td class="style7">
                                    &nbsp;
                                </td>
                                <td style="font-family:koodakAnd;font-size:12px;">
                                    نام و نام خانوادگی:
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    &nbsp;
                                </td>
                                <td>
                                    <div style="-moz-border-radius: 5px; border: 1px solid #ccc; width: 270px; padding: 5px;
                                        background-color: #f9f9f9;">
                                        <asp:TextBox ID="txtFnLn" runat="server" Style="border: 0; background-color: #f9f9f9;
                                            font-family: Tahoma;" Width="265px"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFnLn"
                                        ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    &nbsp;
                                </td>
                               <td style="font-family:koodakAnd;font-size:12px;">
                                    پست الکترونیکی:
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    &nbsp;
                                </td>
                                <td>
                                    <div style="-moz-border-radius: 5px; border: 1px solid #ccc; width: 270px; padding: 5px;
                                        background-color: #f9f9f9;">
                                        <asp:TextBox ID="txtEmail" runat="server" Style="border-style: none; direction: ltr;
                                            border-color: inherit; border-width: 0; background-color: #f9f9f9; text-align: left;"
                                            Width="265px"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail"
                                        ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                                    CssClass="font"
                                    runat="server" ControlToValidate="txtEmail"
                                        ErrorMessage="فرمت پست الکترونیکی را اصلاح کنید." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ValidationGroup="1"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    &nbsp;
                                </td>
                               <td style="font-family:koodakAnd;font-size:12px;">
                                    شماره تلفن:
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    &nbsp;
                                </td>
                                <td>
                                    <div style="-moz-border-radius: 5px; border: 1px solid #ccc; width: 170px; padding: 5px;
                                        background-color: #f9f9f9;">
                                        <asp:TextBox ID="txtTell" runat="server" Style="border-style: none; border-color: inherit;
                                            border-width: 0; background-color: #f9f9f9; text-align: left;" Width="165px"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTell"
                                        ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    &nbsp;
                                </td>
                                <td style="font-family:koodakAnd;font-size:12px;">
                                    گروه:
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    &nbsp;
                                </td>
                                <td>
                                    <div style="-moz-border-radius: 5px; border: 1px solid #ccc; width: 170px; padding: 5px;
                                        background-color: #e5eff6;">
                                        <asp:DropDownList ID="cmbGroup" runat="server" Style="font-family: Tahoma; font-size: 12px;
                                            border: 0; background-color: #e5eff6; padding: 2px;">
                                            <asp:ListItem>واحد پشتیبانی</asp:ListItem>
                                            <asp:ListItem>واحد برنامه نویسی و امنیت</asp:ListItem>
                                            <asp:ListItem>واحد مالی و اعتبار</asp:ListItem>
                                            <asp:ListItem>واحد نظرات و پیشنهاد ها</asp:ListItem>
                                            <asp:ListItem>تیم مدیریت</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    &nbsp;
                                </td>
                                <td style="font-family:koodakAnd;font-size:12px;">
                                    پیام:
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    &nbsp;
                                </td>
                                <td>
                                    <div style="-moz-border-radius: 5px; border: 1px solid #a8c7db; width: 539px; padding: 5px;
                                        background-color: #e5eff6;">
                                        <asp:TextBox ID="txtCuase" runat="server" Height="123px" Style="border: 0; background-color: #e5eff6;
                                            resize: none;" TextMode="MultiLine" Width="536px"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCuase"
                                        ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:LinkButton ID="btnSend" runat="server" Style="color: #096D9E; font-family: koodakAnd;
                                        font-size: 16px; text-decoration: none; margin-right: 2px;" ValidationGroup="1">ارسال ...</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div class="BigDiv">
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <img src="Accept.png" style="width:50px;height:50px;" />
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family:koodakAnd;font-size:12px;">
                                    کاربر محترم;
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family:koodakAnd;font-size:12px;">
                                    پیام شما با موفقیت ارسال گردید، لطفا منتظر پاسخ بمانید.
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
        <div style="float: right; width: 350px; background-color: #45B2C7; margin-top: 10px;
            -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; color: White;">
            <div style="font-family: koodakAnd; font-size: 23px; padding-right: 8px; padding-top: 15px;">
                چگونگی ارتباط با ما
            </div>
            <div style="font-family: koodakAnd; font-size: 13px; padding: 15px; color: Black;">
                شما از طریق این فرم می توانید پیشنهادات ، مشکلات و نظرات خود را به مسئولان شهر دات
                کام انتقال دهید.
                <br />
                کاربر محترم ، با توجه به حجم بالای پیامها ، پاسخ دادن به آنها در زمان کوتاه امکان
                پذیر نمی باشد. اما سعی می گردد تمامی مطالب مطالعه شده و در صورت نیاز واحد مربوطه
                با شما مکاتبه نموده و پاسخ لازم را ارائه دهد.
                <br />
                لطفا برای تسریع در پاسخ به پیام ها، واحد مربوطه را به درستی انتخاب نمایید.
                <br />
                با تشکر
                <br />
                مدیریت شهر دات کام
            </div>
        </div>
    </div>
</asp:Content>
