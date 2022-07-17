<%@ Page Title="" Language="VB" MasterPageFile="~/management/admin/CMS.master" AutoEventWireup="false"
    CodeFile="comment.aspx.vb" Inherits="management_admin_comment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        body
        {
            font-family: Tahoma;
            font-size: 9pt;
        }
        .myButton
        {
            font-family: Tahoma;
            font-size: 11px;
        }
    </style>
    <script type="text/javascript">
        function ChangeCheckBoxState(id, checkState) {
            var cb = document.getElementById(id);
            if (cb != null)
                cb.checked = checkState;
        }

        function ChangeAllCheckBoxStates(checkState) {
            // Toggles through all of the checkboxes defined in the CheckBoxIDs array
            // and updates their value to the checkState input parameter
            if (CheckBoxIDs != null) {
                for (var i = 0; i < CheckBoxIDs.length; i++)
                    ChangeCheckBoxState(CheckBoxIDs[i], checkState);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td>
                <div style="float: right; width: 100%; padding: 20px 0 20px 0">
                    <div style="float: right; padding-left: 20px;">
                        <asp:Button ID="btnDelete" runat="server" Text="حذف گروهی" CssClass="myButton" />
                    </div>
                    <div style="float: right; padding-left: 20px;">
                        <asp:Button ID="btnRead" runat="server" Text="منتشر شود" CssClass="myButton" />
                    </div>
                    <div style="float: right; padding-left: 20px; width: 612px;">
                        <asp:Button ID="btnunRead" runat="server" Text="غیر قابل انتشار گردد " CssClass="myButton" />
                    </div>
                </div>
                <div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="CommentId" DataSourceID="SqlDataSource2">
                    <ItemTemplate>
                        <table style="margin-top: 20px;">
                            <tr>
                                <td style="font-weight: bold; padding-bottom: 10px;">
                                    نام و نام خانوادگی :
                                </td>
                                <td>
                                    <asp:Label ID="FullNameLabel" runat="server" Text='<%# Bind("FullName") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold; padding-bottom: 10px;">
                                    آدرس ایمیل :
                                </td>
                                <td>
                                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold; padding-bottom: 10px;">
                                    متن پیام :
                                </td>
                                <td>
                                    <asp:Label ID="NoteLabel" runat="server" Text='<%# eval("Note").tostring().replace(vbcrlf,"<br/>") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold; padding-bottom: 10px;">
                                    تاریخ درج :
                                </td>
                                <td>
                                    <asp:Label ID="CreateOnLabel" runat="server" Text='<%# Bind("CreateOn") %>' />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>"
                    SelectCommand="SELECT [CommentId], [ParentId], [FullName], [Email], [Note], [CreateOn] FROM [tbl_Android_Comments] WHERE ([CommentId] = @CommentId)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvCommentList" Name="CommentId" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="gvCommentList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                    CellPadding="4" DataKeyNames="CommentId" DataSourceID="SqlDataSource1" ForeColor="Black"
                    Width="100%" PageSize="20">
                    <FooterStyle BackColor="#CCCC99" />
                    <RowStyle BackColor="#F7F7DE" />
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkSelector" runat="server" onclick="if (this.checked==false) {ChangeAllCheckBoxStates(false)} else {ChangeAllCheckBoxStates(true)}" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelectRecord" runat="server" Enabled="True" />
                                  <asp:Label ID="lblCommentId" runat="server" Text='<%#Eval("CommentId")%>' Style="display: none;"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:TemplateField>
                            <ItemTemplate>
                               <%-- <span>
                                    <%#Container.DataItemIndex + 1%>
                                </span>
                                <asp:Label ID="lblCommentId" runat="server" Text='<%#Eval("CommentId")%>' Style="display: none;"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:BoundField DataField="CommentId" HeaderText="کد نظر" InsertVisible="False"
                            ReadOnly="True" SortExpression="CommentId" Visible="true" />
                        <asp:BoundField DataField="ParentId" HeaderText="ParentId" SortExpression="ParentId"
                            Visible="False" />
                        <asp:BoundField DataField="PostId" HeaderText="PostId" SortExpression="PostId" Visible="False" />
                        <asp:BoundField DataField="Title" HeaderText="عنوان پست" SortExpression="Title" />
                        <asp:BoundField DataField="FullName" HeaderText="نام نویسنده نظر" SortExpression="FullName" />
                        <asp:BoundField DataField="Email" HeaderText="آدرس ایمیل" SortExpression="Email" />
                        <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" Visible="False" />
                        <asp:BoundField DataField="CreateOn" HeaderText="تاریخ ایجاد" SortExpression="CreateOn" />
                        <asp:CheckBoxField DataField="Visible" HeaderText="Visible" SortExpression="Visible"
                            Visible="False" />
                        <asp:TemplateField HeaderText="وضعیت پیام" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblVisible" runat="server" Text='<%# iif(cbool(Eval("Visible")) = false,"<div class=""GoodStatus"">غیرقابل انتشار</div>","<div class=""BadStatus"">انتشار یافته</div>") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField SelectText="مشاهده پیام" ShowSelectButton="True" />
                    </Columns>
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>"
                    SelectCommand="SELECT tbl_Android_Comments.CommentId, tbl_Android_Comments.ParentId, tbl_Android_Comments.PostId, tbl_shaahr_Android.Title, tbl_Android_Comments.FullName, tbl_Android_Comments.Email, tbl_Android_Comments.Note, tbl_Android_Comments.CreateOn, tbl_Android_Comments.Visible FROM tbl_shaahr_Android INNER JOIN tbl_Android_Comments ON tbl_shaahr_Android.Code = tbl_Android_Comments.PostId ORDER BY tbl_Android_Comments.CommentId DESC">
                </asp:SqlDataSource>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
