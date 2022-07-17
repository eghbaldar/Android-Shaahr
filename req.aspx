<%@ Page Title="" Language="VB" MasterPageFile="~/MasterOther.master" AutoEventWireup="false" CodeFile="req.aspx.vb" Inherits="req" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        @font-face
        {
            font-family: 'koodakAnd';
            src: url(      'content/font/W_koodak.eot' );
            src: url(      'content/font/W_koodak.eot?#iefix' ) format(      'embedded-opentype' ), url('content/font/W_koodak.woff' ) format(      'woff' ), url('content/font/W_koodak.TTF' ) format(      'truetype' );
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="padding: 5px;">
        <div style="float: right; padding: 5px;">
            <table style="width: 100%;">
                <tr>
                    <td>
                        <div style="padding-right: 10px;">
                            <asp:Label ID="title_" Style="font-family: koodakAnd; font-size: 20px; color: #227D90;"
                                runat="server"></asp:Label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:MultiView ID="MultiView" runat="server">
                            <asp:View ID="ViewReq" runat="server">
                                <div>
                                    <table style="width: 100%; ">
                                        <tr>
                                            <td>
                                                <div style="float: right; border: 1px solid #ccc; width: 340px; -moz-border-radius: 5px;
                                                    margin-bottom: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 5px;">
                                                    <div style="float: right; padding-right: 2px; padding-top: 2px;">
                                                        <img src="content/images/user_blue.png" /></div>
                                                    <div style="float: right;">
                                                        <asp:TextBox ID="txtReg_name" Text="نام شما..." onfocus="if(this.value=='نام شما...'){this.value='';}"
                                                            ForeColor="#000" onblur="if(this.value==''){this.value='نام شما...';}if(this.value=='نام شما...')this.style.color='#000';"
                                                            onmousedown="this.style.color='#000';" onkeydown="if(event.keyCode==13){return InsertComment(this.value);}"
                                                            Style="border: 0; padding: 3px; width: 310px;" runat="server" Font-Names="Tahoma"
                                                            Font-Size="11px"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="float: right; border: 1px solid #ccc; width: 340px; -moz-border-radius: 5px;
                                                    margin-bottom: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 5px;">
                                                    <div style="float: right; padding-right: 2px; padding-top: 2px;">
                                                        <img src="content/images/user_blue.png" /></div>
                                                    <div style="float: right;">
                                                        <asp:TextBox Text="پست الکترونیک شما..." onfocus="if(this.value=='پست الکترونیک شما...'){this.value='';}"
                                                            ForeColor="#000" onblur="if(this.value==''){this.value='پست الکترونیک شما...';}if(this.value=='پست الکترونیک شما...')this.style.color='#000';"
                                                            onmousedown="this.style.color='#000';" onkeydown="if(event.keyCode==13){return InsertComment(this.value);}"
                                                            ID="txtReg_email" Style="border: 0; padding: 3px; width: 310px;" runat="server"
                                                            Font-Size="11px" Font-Names="Tahoma"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="float: right; border: 1px solid #ccc; width: 340px; -moz-border-radius: 5px;
                                                    margin-bottom: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 5px;">
                                                    <div style="float: right; padding-right: 2px; padding-top: 2px;">
                                                        <img src="content/images/user_blue.png" /></div>
                                                    <div style="float: right;">
                                                        <asp:TextBox Text="تلفن شما..." onfocus="if(this.value=='تلفن شما...'){this.value='';}"
                                                            ForeColor="#000" onblur="if(this.value==''){this.value='تلفن شما...';}if(this.value=='تلفن شما...')this.style.color='#000';"
                                                            onmousedown="this.style.color='#000';" onkeydown="if(event.keyCode==13){return InsertComment(this.value);}"
                                                            ID="txtReg_phone" Style="border: 0; padding: 3px; width: 310px;" runat="server"
                                                            Font-Size="11px" Font-Names="Tahoma"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="float: right; border: 1px solid #ccc; width: 340px; -moz-border-radius: 5px;
                                                    margin-bottom: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 5px;">
                                                    <div style="float: right; padding-right: 2px; padding-top: 2px;">
                                                        <img src="content/images/user_blue.png" /></div>
                                                    <div style="float: right;">
                                                        <asp:TextBox Text="توضیحات شما..." onfocus="if(this.value=='توضیحات شما...'){this.value='';}"
                                                            ForeColor="#000" onblur="if(this.value==''){this.value='توضیحات شما...';}if(this.value=='توضیحات شما...')this.style.color='#000';"
                                                            onmousedown="this.style.color='#000';" onkeydown="if(event.keyCode==13){return InsertComment(this.value);}"
                                                            ID="txtReg_detail" Style="border: 0; padding: 3px; width: 318px; font-size: 12px;"
                                                            runat="server" Font-Names="Tahoma" TextMode="MultiLine" Height="300px"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="float: right; border: 1px solid #ccc; width: 340px; -moz-border-radius: 5px;
                                                    margin-bottom: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 5px;">
                                                    <div style="float: right; padding-right: 2px; padding-top: 2px;">
                                                        <img src="content/images/user_blue.png" /></div>
                                                    <div style="float: right;">
                                                        <asp:TextBox ID="txtReg_link" Text="لینک برنامه مشابه..." onfocus="if(this.value=='لینک برنامه مشابه...'){this.value='';}"
                                                            ForeColor="#000" onblur="if(this.value==''){this.value='لینک برنامه مشابه...';}if(this.value=='لینک برنامه مشابه...')this.style.color='#000';"
                                                            onmousedown="this.style.color='#000';" onkeydown="if(event.keyCode==13){return InsertComment(this.value);}"
                                                            Style="border: 0; padding: 3px; width: 310px;" runat="server" Font-Names="Tahoma"
                                                            Font-Size="11px"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnInsertReq"  Style="font-family: Tahoma; font-size: 12px; cursor: pointer;
                                                    -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 4px;
                                                    background-color: White;" runat="server" Text="ارسال" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:View>
                            <asp:View ID="ViewBuy" runat="server">
                                <div>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <div style="float: right; border: 1px solid #ccc; width: 340px; -moz-border-radius: 5px;
                                                    margin-bottom: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 5px;">
                                                    <div style="float: right; padding-right: 2px; padding-top: 2px;">
                                                        <img src="content/images/user_blue.png" /></div>
                                                    <div style="float: right;">
                                                        <asp:TextBox ID="txtBug_name" Text="نام شما..." onfocus="if(this.value=='نام شما...'){this.value='';}"
                                                            ForeColor="#000" onblur="if(this.value==''){this.value='نام شما...';}if(this.value=='نام شما...')this.style.color='#000';"
                                                            onmousedown="this.style.color='#000';" onkeydown="if(event.keyCode==13){return InsertComment(this.value);}"
                                                            Style="border: 0; padding: 3px; width: 310px;" runat="server" Font-Names="Tahoma"
                                                            Font-Size="11px"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="float: right; border: 1px solid #ccc; width: 340px; -moz-border-radius: 5px;
                                                    margin-bottom: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 5px;">
                                                    <div style="float: right; padding-right: 2px; padding-top: 2px;">
                                                        <img src="content/images/user_blue.png" /></div>
                                                    <div style="float: right;">
                                                        <asp:TextBox Text="پست الکترونیک شما..." onfocus="if(this.value=='پست الکترونیک شما...'){this.value='';}"
                                                            ForeColor="#000" onblur="if(this.value==''){this.value='پست الکترونیک شما...';}if(this.value=='پست الکترونیک شما...')this.style.color='#000';"
                                                            onmousedown="this.style.color='#000';" onkeydown="if(event.keyCode==13){return InsertComment(this.value);}"
                                                            ID="txtBug_email" Style="border: 0; padding: 3px; width: 310px;" runat="server"
                                                            Font-Names="Tahoma" Font-Size="11px"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="float: right; border: 1px solid #ccc; width: 340px; -moz-border-radius: 5px;
                                                    margin-bottom: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 5px;">
                                                    <div style="float: right; padding-right: 2px; padding-top: 2px;">
                                                        <img src="content/images/user_blue.png" /></div>
                                                    <div style="float: right;">
                                                        <asp:TextBox Text="تلفن شما..." onfocus="if(this.value=='تلفن شما...'){this.value='';}"
                                                            ForeColor="#000" onblur="if(this.value==''){this.value='تلفن شما...';}if(this.value=='تلفن شما...')this.style.color='#000';"
                                                            onmousedown="this.style.color='#000';" onkeydown="if(event.keyCode==13){return InsertComment(this.value);}"
                                                            ID="txtBug_phone" Style="border: 0; padding: 3px; width: 310px;" runat="server"
                                                            Font-Names="Tahoma" Font-Size="11px"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="float: right; border: 1px solid #ccc; width: 340px; -moz-border-radius: 5px;
                                                    margin-bottom: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 5px;">
                                                    <div style="float: right; padding-right: 2px; padding-top: 2px;">
                                                        <img src="content/images/user_blue.png" /></div>
                                                    <div style="float: right;">
                                                        <asp:TextBox Text="توضیحات شما..." onfocus="if(this.value=='توضیحات شما...'){this.value='';}"
                                                            ForeColor="#000" onblur="if(this.value==''){this.value='توضیحات شما...';}if(this.value=='توضیحات شما...')this.style.color='#000';"
                                                            onmousedown="this.style.color='#000';" onkeydown="if(event.keyCode==13){return InsertComment(this.value);}"
                                                            ID="txtBuy_detail" Style="border: 0; padding: 3px; width: 310px; font-size: 12px;"
                                                            runat="server" Font-Names="Tahoma" Font-Size="11px" TextMode="MultiLine" Height="300px"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="float: right; border: 1px solid #ccc; width: 340px; -moz-border-radius: 5px;
                                                    margin-bottom: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 5px;">
                                                    <div style="float: right; padding-right: 2px; padding-top: 2px;">
                                                        <img src="content/images/user_blue.png" /></div>
                                                    <div style="float: right;">
                                                        <asp:TextBox ID="txtBuy_link" Text="لینک برنامه شما..." onfocus="if(this.value=='لینک برنامه شما...'){this.value='';}"
                                                            ForeColor="#000" Font-Size="11px" onblur="if(this.value==''){this.value='لینک برنامه مشابه...';}if(this.value=='لینک برنامه شما...')this.style.color='#000';"
                                                            onmousedown="this.style.color='#000';" onkeydown="if(event.keyCode==13){return InsertComment(this.value);}"
                                                            Style="border: 0; padding: 3px; width: 310px;" runat="server" Font-Names="Tahoma"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="float: right; border: 1px solid #ccc; width: 340px; -moz-border-radius: 5px;
                                                    margin-bottom: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 5px;">
                                                    <div style="float: right; padding-right: 2px; padding-top: 2px;">
                                                        <img src="content/images/user_blue.png" /></div>
                                                    <div style="float: right;">
                                                        <asp:TextBox ID="txtBuy_price" Text="قیمت پیشنهادی شما..." onfocus="if(this.value=='قیمت پیشنهادی شما...'){this.value='';}"
                                                            ForeColor="#000" Font-Size="11px" onblur="if(this.value==''){this.value='لینک برنامه مشابه...';}if(this.value=='قیمت پیشنهادی شما...')this.style.color='#000';"
                                                            onmousedown="this.style.color='#000';" onkeydown="if(event.keyCode==13){return InsertComment(this.value);}"
                                                            Style="border: 0; padding: 3px; width: 310px;" runat="server" Font-Names="Tahoma"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnInsertBuy" Style="font-family: Tahoma; font-size: 12px; cursor: pointer;
                                                    -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; padding: 4px;
                                                    background-color: White;" runat="server" Text="ارسال" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:View>
                            <asp:View ID="ViewSucess" runat="server">
                                <div style="background-color: #DEF4CA; font-family: koodakAnd; font-size: 15px; -moz-border-radius: 5px;
                                    -webkit-border-radius: 5px; border-radius: 5px; padding: 10px;">
                                    درخواست شما با موفقیت ارسال شد ، لطفا منتظر پاسخ از وب سایت بمانید ، با تشکر
                                </div>
                            </asp:View>
                        </asp:MultiView>
                    </td>
                </tr>
            </table>
        </div>
        <div style="float: right;">
            <div id="success" runat="server" style="padding: 5px; width: 550px; height: 100px; background-color: #4BBAD2;
                margin-top: 36px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
                border: 2px solid #227D90;">
                <table>
                    <tr>
                        <td>
                            <asp:Label Style="font-family: koodakAnd;" ID="lblTitle" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label Style="font-family: koodakAnd; color: White; font-size: 13px;" ID="lblDetail"
                                runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="divWrong" runat="server" visible="false" style="padding: 5px; background-color: #F8DCD7; margin-top: 2px; -moz-border-radius: 5px;font-family:koodakAnd;
                -webkit-border-radius: 5px; border-radius: 5px; border: 2px solid #E09D90;">
                <asp:Label ID="lblWrong" runat="server" Style="color: #DF3D1B;"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

