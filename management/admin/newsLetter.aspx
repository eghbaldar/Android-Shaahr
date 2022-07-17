<%@ Page Title="" Language="VB" MasterPageFile="~/management/admin/CMS.master" AutoEventWireup="false" CodeFile="newsLetter.aspx.vb" Inherits="management_admin_newsLetter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style13
        {
            font-size: large;
            height: 37px;
            text-align: center;
        }
        .style14
        {
            color: #CC0000;
        }
        .style15
        {
            height: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style13">
                <span class="style14">ادین محترم ، پس از درج&nbsp; هر نرم افزار جدید دگمه&nbsp; 
                ی زیر را فشار دهید تا ایمیل به تمام کاربران عضو خبرنامه ارسال شود ،</span><br 
                    class="style14" />
                <br class="style14" />
                <span class="style14">&nbsp;دقت کنید تا وقتی که صفحه در حال لود است ، پنجره را 
                نبندید.</span></td>
        </tr>
        <tr>
            <td class="style15">
                <strong>تعداد کاربران عضو : </strong>
                <asp:Label ID="lblCount" runat="server" 
                    style="font-weight: 700; color: #009933"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
    <asp:Button ID="btn" runat="server" 
        Text="ارسال آخرین برنامه به خبرنامه های عضو" style="font-family: Tahoma" />
            </td>
        </tr>
        <tr>
            <td style="margin-right: 40px">
                <asp:CheckBox ID="chk" runat="server" AutoPostBack="True" 
                    style="font-weight: 700" Text="نمایش کاربران خبرنامه" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="ODS" PageSize="100" Visible="False">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS" runat="server" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="ds_NewsLetterTableAdapters.shaahr_newsletterTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

