<%@ Page Title="" Language="VB" MasterPageFile="~/management/admin/CMS.master" AutoEventWireup="false" CodeFile="aware.aspx.vb" Inherits="management_admin_aware" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <strong>خرابی لینک</strong></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dgLink" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SDS_Link">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="ID" HeaderText="ID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="code android" HeaderText="code android" 
                            InsertVisible="False" ReadOnly="True" SortExpression="code android" />
                        <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                        <asp:BoundField DataField="SmallDetail" HeaderText="SmallDetail" 
                            SortExpression="SmallDetail" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_Link" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>" 
                    DeleteCommand="DELETE FROM tbl_shaahr_aware WHERE (ID = @id)" 
                    SelectCommand="SELECT a.ID ,aw.code as 'code android',aw.title ,a.Type,a.SmallDetail,a.email
FROM tbl_shaahr_aware a , tbl_shaahr_android aw
where a.type=1 and a.codeand=aw.code
ORDER BY [ID] DESC
">
                    <DeleteParameters>
                        <asp:Parameter Name="id" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <strong>خرابی برنامه</strong></td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SDS_app" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>" 
                    
                      DeleteCommand="DELETE FROM tbl_shaahr_aware WHERE (ID = @id)" 
                    SelectCommand="SELECT a.ID ,aw.code as 'code android',aw.title ,a.Type,a.SmallDetail,a.email
FROM tbl_shaahr_aware a , tbl_shaahr_android aw
where a.type=0 and a.codeand=aw.code
ORDER BY [ID] DESC
"></asp:SqlDataSource>
                <asp:GridView ID="dgApp" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="id" DataSourceID="SDS_app" AllowPaging="True">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="ID" HeaderText="ID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="code android" HeaderText="code android" 
                            InsertVisible="False" ReadOnly="True" SortExpression="code android" />
                        <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                        <asp:BoundField DataField="SmallDetail" HeaderText="SmallDetail" 
                            SortExpression="SmallDetail" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

