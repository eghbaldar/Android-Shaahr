<%@ Page Title="" Language="VB" MasterPageFile="~/management/admin/CMS.master" AutoEventWireup="false" ValidateRequest="false"
    CodeFile="AddLabel.aspx.vb" Inherits="management_admin_AddLabel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            height: 12px;
        }
        .style14
        {
            color: #CC0000;
            font-weight: bold;
        }
        .style15
        {
            width: 286px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td class="style14">
                برچسب چیست؟
            </td>
        </tr>
        <tr>
            <td>
                برای آنکه موتور های جستجو گر بهتر بتوانند سایت ما را شناسی کنند نیاز دارند تا کلامات
                بیشتری در مورد پستی که چذاشته می شوند بدانند به همین دلیل برای هر پست (نرم افزار)
                چندین کلمه مرتبط با آن پست اضافه می کنند
            </td>
        </tr>
        <tr>
            <td class="style13">
                بعنوان مثال : برای نرم افزار
                <h1 class="entry-title">
                    <a href="shaahr.com" style="font-size: small; color: #000000">دانلود بازی فوق العاده
                        زیبای Little Inferno v1.1 همراه دیتا</a></h1>
            </td>
        </tr>
        <tr>
            <td>
                باید عبارت های زیر را اضافه کرد:
            </td>
        </tr>
        <tr>
            <td>
                <a href="http://androidkade.com/tag/little-inferno" rel="tag">Little Inferno</a>,
                <a href="http://androidkade.com/tag/little-inferno-v1-1" rel="tag">Little Inferno v1.1</a>,
                <a href="http://androidkade.com/tag/little-inferno-v1-1-با-لینک-مستقیم" rel="tag">Little
                    Inferno v1.1 با لینک مستقیم</a>, <a href="http://androidkade.com/tag/little-inferno-v1-1-مخصوص-اندروید"
                        rel="tag">Little Inferno v1.1 مخصوص اندروید</a>, <a href="http://androidkade.com/tag/little-inferno-v1-1-مخصوص-گوشی-های-اندروید"
                            rel="tag">Little Inferno v1.1 مخصوص گوشی های اندروید</a>, <a href="http://androidkade.com/tag/little-inferno-اندروید"
                                rel="tag">Little Inferno اندروید</a>, <a href="http://androidkade.com/tag/little-inferno-با-لینک-مستقیم"
                                    rel="tag">Little Inferno با لینک مستقیم</a>, <a href="http://androidkade.com/tag/little-inferno-برای-اندروید"
                                        rel="tag">Little Inferno برای اندروید</a>, <a href="http://androidkade.com/tag/little-inferno-مخصوص-گوشی-های-اندروید"
                                            rel="tag">Little Inferno مخصوص گوشی های اندروید</a>,
                <a href="http://androidkade.com/tag/دانلود-بازی-اندروید-little-inferno" rel="tag">دانلود
                    بازی اندروید Little Inferno</a>, <a href="http://androidkade.com/tag/دانلود-بازی-دوزخ-کوچک-little-inferno-v1-1-همراه-دیتا"
                        rel="tag">دانلود بازی دوزخ کوچک Little Inferno v1.1 همراه دیتا</a>, <a href="http://androidkade.com/tag/دانلود-بازی-دوزخ-کوچک-little-inferno-v1-1-همراه-دیتا-ان"
                            rel="tag">دانلود بازی دوزخ کوچک Little Inferno v1.1 همراه دیتا اندروید</a>,
                <a href="http://androidkade.com/tag/دانلود-بازی-دوزخ-کوچک-little-inferno-v1-1-همراه-دیتا-با"
                    rel="tag">دانلود بازی دوزخ کوچک Little Inferno v1.1 همراه دیتا با لینک مستقیم</a>,
                <a href="http://androidkade.com/tag/دانلود-بازی-دوزخ-کوچک-little-inferno-v1-1-همراه-دیتا-مخ"
                    rel="tag">دانلود بازی دوزخ کوچک Little Inferno v1.1 همراه دیتا مخصوص گوشی های اندروید</a>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                جستجوی نرم افزار:
                <asp:TextBox ID="txtSearch" runat="server" Width="320px"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Style="font-family: Tahoma; font-size: 10px"
                    Text="جستجو...." />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel_" runat="server" Visible="false" BackColor="LightCyan">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <table class="style1">
                                            <tr>
                                                <td>
                                                کد برنامه:
                                                    <asp:Label ID="lblCode" runat="server"></asp:Label>
                                                    &nbsp;<asp:Button ID="btnDeleteTag" runat="server" BackColor="Red" BorderColor="Red" 
                                                        style="color: #FFFFFF; font-family: Tahoma; font-size: 11px" 
                                                        Text="حذف تمام تگ های این پست" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style15">
                                                    <asp:TextBox ID="TagName" runat="server" Width="316px"></asp:TextBox>
                                                </td>
                                                <td>
                                                   نام لینکی که میخواید نمایش داده شود وارد کنید
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style15">
                                                    <asp:TextBox ID="TagLink" runat="server" Width="316px"></asp:TextBox>
                                                </td>
                                                <td>
                                            
                                                    <asp:Button ID="AddTag" runat="server" Text="&lt;&lt;&lt;&lt;" Width="56px" />    در این فیلد باید لینک نرم افزار را با http وارد کنید
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style15">
                                                    <asp:ListBox ID="Taglist" runat="server" Height="170px" Width="359px"></asp:ListBox>
                                                </td>
                                                <td>
                                                    &nbsp;<asp:Button ID="TagTransfer" runat="server" Text="&gt;&gt;&gt;&gt;" 
                                                        Width="53px" />لیست تگ های وارد کرده اید
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style15">
                                                    <asp:TextBox ID="txtlabel" runat="server" Height="98px" TextMode="MultiLine" 
                                                        Width="353px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btneditLabel" runat="server" Height="97px" Text="ویرایش" 
                                                        Width="59px" style="font-family: Tahoma; font-size: 11px" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                            <ProgressTemplate>
                                                Loading.........</ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataKeyNames="Code" PageSize="50">
                    <Columns>
                        <asp:BoundField DataField="Code" HeaderText="Code" InsertVisible="False" ReadOnly="True"
                            SortExpression="Code" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" ItemStyle-Width="700px" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                    OnCommand="editLabel" Style="font-family: Tahoma; font-size: 10px" Text="ویرایش برچسب" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
