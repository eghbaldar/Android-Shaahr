<%@ Page Title="" Language="VB" MasterPageFile="~/management/admin/CMS.master" AutoEventWireup="false"
    CodeFile="Application_And_Special_Apps.aspx.vb" Inherits="management_admin_Application_And_Special_Apps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            width: 364px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style1">
        <tr>
            <td>
                <strong>انتخاب برنامه های کاربردی </strong>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table class="style1">
                            <tr>
                                <td class="style13">
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        CellPadding="4" DataKeyNames="Code" DataSourceID="SDS_ListAllApps" ForeColor="#333333"
                                        GridLines="None" PageSize="15" ShowHeader="False">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="Code" HeaderText="Code" InsertVisible="False" ReadOnly="True"
                                                SortExpression="Code" />
                                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                                            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Count_Download" SortExpression="Count_Download">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton2" OnCommand="InsertApplication" CommandArgument='<%# Eval("code","{0}") %>'
                                                        runat="server">(انتخاب)</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                </td>
                                <td>
                                    <asp:GridView ID="gr_ListFunctional" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        CellPadding="4" DataKeyNames="id" DataSourceID="SDS_FunctionList" ForeColor="#333333"
                                        GridLines="None" PageSize="15" ShowHeader="False">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="Code" HeaderText="Code" InsertVisible="False" ReadOnly="True"
                                                SortExpression="Code" Visible="False" />
                                            <asp:TemplateField HeaderText="Title" SortExpression="Title">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                                        OnClientClick="return confirm('sure?');" Text="Delete"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                        <SortedDescendingHeaderStyle BackColor="#820000" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SDS_FunctionList" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>"
                                        SelectCommand="SELECT f.id,a.title
FROM [tbl_Shaahr_FunctionalApps] f , [tbl_shaahr_android] a
where f.codeandroid=a.code" DeleteCommand="DELETE FROM tbl_Shaahr_FunctionalApps WHERE (ID = @id)">
                                        <DeleteParameters>
                                            <asp:Parameter Name="id" />
                                        </DeleteParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13">
                                    &nbsp;
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                        <ProgressTemplate>
                                            loading....
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="SDS_ListAllApps" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>"
                            SelectCommand="SELECT * FROM [tbl_shaahr_Android] WHERE ([Show] = @Show) ORDER BY [Code] DESC">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="Show" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <strong>انتخاب برنامه های مناسیتی</strong>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
                <asp:TextBox ID="txtSpecialDay" runat="server" Style="font-family: Tahoma; font-size: 11px;
                    text-align: right" Width="398px"></asp:TextBox>
                <asp:Button ID="inserSpceialDay" runat="server" Style="font-family: Tahoma; font-size: 11px"
                    Text="اضافه کردن نام دوره مناسیت" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
                <asp:GridView ID="gr_SpecialDays" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3"
                    CellSpacing="1" DataKeyNames="ID" DataSourceID="SDS_ListSpecial" GridLines="None"
                    ShowHeader="False">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:TemplateField HeaderText="Flag" SortExpression="Flag">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Flag") %>' Enabled="false" />
                                <asp:Button ID="Button1" BackColor='<%# getBack(Eval("flag","{0}")) %>' ForeColor="White"
                                    OnCommand="updateFlag" CommandArgument='<%# Eval("id","{0}") %>' runat="server"
                                    Text="(o)" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                    OnClientClick="return confirm('sure?');" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_ListSpecial" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>"
                    DeleteCommand="DELETE FROM tbl_Shaahr_ListSpecialDays WHERE (ID = @id)" SelectCommand="SELECT * FROM [tbl_Shaahr_ListSpecialDays] ORDER BY [ID] DESC">
                    <DeleteParameters>
                        <asp:Parameter Name="id" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <strong>اضافه کردن برنامه به مناسبت</strong></td>
        </tr>
        <tr>
            <td>
                &nbsp;
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <table class="style1">
                          <tr>
                                <td>
                                    <asp:DropDownList ID="drpList" runat="server" AutoPostBack="True" 
                                        DataSourceID="SDS_ListSpecial" DataTextField="Name" DataValueField="ID">
                                    </asp:DropDownList>
                                    &nbsp;کدبرنامه:
                                    <asp:TextBox ID="txtCodeApp" runat="server"></asp:TextBox>
                                    <asp:Button ID="inserAppSpecial" runat="server" 
                                        Style="font-family: Tahoma; font-size: 11px" 
                                        Text="اضافه کردن نام برنامه به دوره مناسیت" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="SDS_AppSpecial" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>" 
                                        DeleteCommand="DELETE FROM tbl_Shaahr_SpecialApps WHERE (ID = @id)" SelectCommand="SELECT f.id,a.title
FROM [tbl_Shaahr_SpecialApps] f , [tbl_shaahr_android] a
where f.codeandroid=a.code and f.codeSpecialDay=@codeSpecialDay">
                                        <DeleteParameters>
                                            <asp:Parameter Name="id" />
                                        </DeleteParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="drpList" Name="codeSpecialDay" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:GridView ID="gr_ListApps" runat="server" AllowPaging="True" 
                                        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
                                        DataSourceID="SDS_AppSpecial" ForeColor="#333333" GridLines="None" 
                                        PageSize="15" ShowHeader="False">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="Code" HeaderText="Code" InsertVisible="False" 
                                                ReadOnly="True" SortExpression="Code" Visible="False" />
                                            <asp:TemplateField HeaderText="Title" SortExpression="Title">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" 
                                                        CommandName="Delete" OnClientClick="return confirm('sure?');" Text="Delete"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                        <SortedDescendingHeaderStyle BackColor="#820000" />
                                    </asp:GridView>
                                </td>
                            </tr>
                          
                            <tr>
                                <td>
                                    <asp:UpdateProgress ID="UpdateProgress2" runat="server" 
                                        AssociatedUpdatePanelID="UpdatePanel2">
                                        <ProgressTemplate>
                                            loading....
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
