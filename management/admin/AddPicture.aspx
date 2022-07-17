<%@ Page Title="" Language="VB" MasterPageFile="~/management/admin/CMS.master" AutoEventWireup="false"
    CodeFile="AddPicture.aspx.vb" Inherits="management_admin_AddPicture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <b>ابتدا نرم افزار مورد نظر خود را انتخاب کنید:</b>
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
                                <asp:Label ID="lblCode" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                              <div style="background-color:White;border:3px solid black;padding:10px;">
                                اضافه کردن:
                                <asp:FileUpload ID="FileUpload" runat="server" />
                                <asp:Button ID="btnInsertPic" runat="server" 
                                    style="font-family: Tahoma; font-size: 10px" Text="اضافه" /></div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DataList ID="DL_Picture" runat="server" DataSourceID="ODS" 
                                    RepeatColumns="2" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                       
                                      
                                        <table class="style1">
                                            <tr>
                                                <td>
                                                   ID:  <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:ImageButton style="border:5px solid #ccc;" ID="ImageButton1" runat="server" 
                                                        ImageUrl='<%# Eval("Filename", "~\management\images\picture\{0}") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="LinkButton1" 
                                                    OnCommand="deletePic" style="font-size:20px;"
                                                    CommandArgument='<%# Eval("id","{0}") %>'
                                                    OnClientClick="return confirm('مطمئن هستید ک پاک شود؟');"
                                                    runat="server">[حذف]</asp:LinkButton>
                                                    <a href='<%# Eval("Filename", "..\images\picture\{0}") %>' style="font-size:20px;" target="_blank">نمایش</a>
                                                </td>
                                            </tr>
                                        </table>
                                      
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:ObjectDataSource ID="ODS" runat="server" InsertMethod="Insert" 
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                    TypeName="ds_androidTableAdapters.shaahr_PicturesTableAdapter">
                                    <InsertParameters>
                                        <asp:Parameter Name="CodeAndroid" Type="Int64" />
                                        <asp:Parameter Name="Filename" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblCode" Name="codeandroid" 
                                            PropertyName="Text" Type="Int64" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnCancel" runat="server" BackColor="Red" 
                                    style="color: #FFFFFF" Text="Cancel" />
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
                                    OnCommand="editPicture" Style="font-family: Tahoma; font-size: 10px" Text="ویرایش عکس" />
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
