<%@ Page Title="" Language="VB" MasterPageFile="~/management/admin/CMS.master" AutoEventWireup="false" CodeFile="Req.aspx.vb" Inherits="management_admin_Req" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <b>فروش</b></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SDS" DataKeyNames="code">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="code" HeaderText="code" InsertVisible="False" 
                            ReadOnly="True" SortExpression="code" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                        <asp:BoundField DataField="detail" HeaderText="detail" 
                            SortExpression="detail" />
                        <asp:BoundField DataField="link" HeaderText="link" SortExpression="link" />
                        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                        <asp:CheckBoxField DataField="Type" HeaderText="Type" SortExpression="Type" />
                        <asp:CheckBoxField DataField="flag" HeaderText="flag" SortExpression="flag" />
                        <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SDS" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>" 
                    
                    SelectCommand="SELECT * FROM [tbl_shaahr_ReuqestOrBuy] WHERE ([Type] = @Type) ORDER BY [code] DESC" 
                    DeleteCommand="DELETE FROM tbl_shaahr_ReuqestOrBuy WHERE (code = @code)">
                    <DeleteParameters>
                        <asp:Parameter Name="code" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="false" Name="Type" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <b>درخواست</b></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SDS0" DataKeyNames="code">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="code" HeaderText="code" InsertVisible="False" 
                            ReadOnly="True" SortExpression="code" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                        <asp:BoundField DataField="detail" HeaderText="detail" 
                            SortExpression="detail" />
                        <asp:BoundField DataField="link" HeaderText="link" SortExpression="link" />
                        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                        <asp:CheckBoxField DataField="Type" HeaderText="Type" SortExpression="Type" />
                        <asp:CheckBoxField DataField="flag" HeaderText="flag" SortExpression="flag" />
                        <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SDS0" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>" 
                    
                    SelectCommand="SELECT * FROM [tbl_shaahr_ReuqestOrBuy] WHERE ([Type] = @Type) ORDER BY [code] DESC" DeleteCommand="DELETE FROM tbl_shaahr_ReuqestOrBuy
where code=@code">
                    <DeleteParameters>
                        <asp:Parameter Name="code" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="true" Name="Type" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

