<%@ Page Title="" Language="VB" MasterPageFile="~/management/admin/CMS.master" AutoEventWireup="false" CodeFile="statistical.aspx.vb" Inherits="management_admin_statistical" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style13
        {
            width: 144px;
        }
        .style14
        {
            width: 425px;
        }
        .style15
        {
            width: 258px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <b>آمارهای جزئی</b></td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style13">
                            مشاهده سایت</td>
                        <td>
                            <asp:Label ID="lblWebsite" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            کل دانلود کتب</td>
                        <td>
                            <asp:Label ID="lblDownloaded" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14">
                <b>آمار بیشترین دانلود&nbsp; کتبب</b></td>
                        <td>
                            <b>آمار بیشترین بازدیدها</b></td>
                    </tr>
                    <tr>
                        <td class="style14">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="ODS" AllowPaging="True" PageSize="20">
                    <Columns>
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Count_Download" HeaderText="Count_Download" 
                            SortExpression="Count_Download" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS" runat="server" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    
                    TypeName="ds_androidTableAdapters.shaahr_Android_BaseOnDownloadTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Count_Download" Type="Int64" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                        </td>
                        <td>
                            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" DataSourceID="SqlDataSource1" PageSize="20">
                                <Columns>
                                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                                    <asp:BoundField DataField="Count_Visit" HeaderText="Count_Visit" 
                                        SortExpression="Count_Visit" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>" 
                                SelectCommand="SELECT [Title], [Count_Visit] FROM [tbl_shaahr_Android] ORDER BY [Count_Visit] DESC">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <strong>روند دانلودها</strong></td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style15">
                            download</td>
                        <td>
                            visit</td>
                    </tr>
                    <tr>
                        <td class="style15">
                            <asp:SqlDataSource ID="SDS_Download" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>" 
                                SelectCommand="SELECT * FROM [tbl_Shaahr_DownloadVisit] WHERE ([Type] = @Type) ORDER BY [ID] DESC">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="true" Name="Type" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="dgDownload" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="SDS_Download" AllowPaging="True">
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="CodeAnd" HeaderText="CodeAnd" 
                                        SortExpression="CodeAnd" />
                                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                                    <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                                    <asp:BoundField DataField="User_IP" HeaderText="User_IP" 
                                        SortExpression="User_IP" />
                                    <asp:CheckBoxField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                </Columns>
                            </asp:GridView>
                        </td>
                        <td>
                            <asp:GridView ID="dgVisit" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="SDS_Visit" AllowPaging="True">
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="CodeAnd" HeaderText="CodeAnd" 
                                        SortExpression="CodeAnd" />
                                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                                    <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                                    <asp:BoundField DataField="User_IP" HeaderText="User_IP" 
                                        SortExpression="User_IP" />
                                    <asp:CheckBoxField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SDS_Visit" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>" 
                                SelectCommand="SELECT * FROM [tbl_Shaahr_DownloadVisit] WHERE ([Type] = @Type) ORDER BY [ID] DESC">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="false" Name="Type" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            <asp:GridView ID="dgDownGroup" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" DataSourceID="SDS_DownloadGroup">
                                <Columns>
                                    <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" 
                                        SortExpression="Column1" />
                                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SDS_DownloadGroup" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>" SelectCommand="select COUNT(*),date from tbl_Shaahr_DownloadVisit
where type=1
group by date"></asp:SqlDataSource>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="SDS_VisitGroup" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>" SelectCommand="select COUNT(*),date from tbl_Shaahr_DownloadVisit
where type=0
group by date"></asp:SqlDataSource>
                            <asp:GridView ID="dgVisitGroup" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" DataSourceID="SDS_VisitGroup">
                                <Columns>
                                    <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" 
                                        SortExpression="Column1" />
                                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

