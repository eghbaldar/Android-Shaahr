<%@ Page Title="" Language="VB" MasterPageFile="~/management/admin/CMS.master" AutoEventWireup="false" CodeFile="contact.aspx.vb" Inherits="management_admin_contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
        DataKeyNames="ID">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="FnLn" HeaderText="FnLn" SortExpression="FnLn" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="tell" HeaderText="tell" SortExpression="tell" />
            <asp:BoundField DataField="group" HeaderText="group" SortExpression="group" />
            <asp:BoundField DataField="cuase" HeaderText="cuase" SortExpression="cuase" />
            <asp:CheckBoxField DataField="flag" HeaderText="flag" SortExpression="flag" />
            <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP" />
            <asp:BoundField DataField="DateTime" HeaderText="DateTime" 
                SortExpression="DateTime" />
        </Columns>
    </asp:GridView>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataSourceID="SqlDataSource2" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="FnLn" HeaderText="FnLn" SortExpression="FnLn" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="tell" HeaderText="tell" SortExpression="tell" />
            <asp:BoundField DataField="group" HeaderText="group" SortExpression="group" />
            <asp:BoundField DataField="cuase" HeaderText="cuase" SortExpression="cuase" />
            <asp:CheckBoxField DataField="flag" HeaderText="flag" SortExpression="flag" />
            <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP" />
            <asp:BoundField DataField="DateTime" HeaderText="DateTime" 
                SortExpression="DateTime" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>" 
        SelectCommand="SELECT * FROM [tbl_shaahr_Contact] WHERE ([ID] = @ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="ID" 
                PropertyName="SelectedValue" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>" 
        SelectCommand="SELECT * FROM [tbl_shaahr_Contact] ORDER BY [ID] DESC">
    </asp:SqlDataSource>
</asp:Content>

