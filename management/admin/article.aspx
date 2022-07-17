<%@ Page Title="" Language="VB" MasterPageFile="~/management/admin/CMS.master" AutoEventWireup="false"
    CodeFile="article.aspx.vb" Inherits="management_admin_article" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            width: 100px;
        }
        .style14
        {
            width: 97px;
        }
        .style15
        {
            width: 97px;
            height: 16px;
        }
        .style16
        {
            height: 16px;
        }
    </style>
    <!-- TinyMCE -->
    <script type="text/javascript" src="../../content/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
    <script type="text/javascript">
        tinyMCE.init({
            // General options
            mode: "textareas",
            theme: "advanced",
            skin: "o2k7",
            plugins: "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,inlinepopups,autosave",

            // Theme options
            theme_advanced_buttons1: "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
            theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
            theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
            theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft",
            theme_advanced_toolbar_location: "top",
            theme_advanced_toolbar_align: "left",
            theme_advanced_statusbar_location: "bottom",
            theme_advanced_resizing: true,

            // Example word content CSS (should be your site CSS) this one removes paragraph margins
            content_css: "css/word.css",

            // Drop lists for link/image/media/template dialogs
            template_external_list_url: "lists/template_list.js",
            external_link_list_url: "lists/link_list.js",
            external_image_list_url: "lists/image_list.js",
            media_external_list_url: "lists/media_list.js",

            // Replace values for the template plugin
            template_replace_values: {
                username: "Some User",
                staffid: "991234"
            }
        });
    </script>
    <!-- /TinyMCE -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        DataKeyNames="id" DataSourceID="SqlDataSource">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" OnClientClick="return confirm('مطمئن؟');"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                SortExpression="id" />
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:BoundField DataField="text" HeaderText="text" SortExpression="text" 
                Visible="False" />
            <asp:CheckBoxField DataField="show" HeaderText="show" SortExpression="show" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="Button1" OnCommand="edit" CommandArgument='<%# Eval("id","{0}") %>'
                        runat="server" Text="edit" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <table class="style1">
        <tr>
            <td class="style13">
                عنوان:
            </td>
            <td>
                <asp:TextBox ID="txttitle" runat="server" Width="712px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style13">
                متن:
            </td>
            <td>
                <!-- Gets replaced with TinyMCE, remember HTML in a textarea should be encoded -->
                <textarea runat="server" id="txtText" name="elm1" rows="15" cols="80" style="width: 80%">
	            </textarea>
                <script type="text/javascript">
                    if (document.location.protocol == 'file:') {
                        alert("The examples might not work properly on the local file system due to security settings in your browser. Please use a real webserver.");
                    }
                </script>
            </td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;
            </td>
            <td>
                &nbsp;
                <asp:Button ID="btn" runat="server" Text="insert" />
            </td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <br />
    ویرایش متن اصلی<br />
    <table class="style1">
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td>
                <asp:Label ID="CodeEdit" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td>
                <textarea runat="server" id="txtTextUpdate" name="elm2" rows="15" cols="80" 
                    style="width: 80%">
	            </textarea></td>
        </tr>
        <tr>
            <td class="style15">
            </td>
            <td class="style16">
                <asp:Button ID="btnEdit" runat="server" Text="ویرایش" />
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>"
        DeleteCommand="DELETE FROM tbl_shaahr_article WHERE (id = @id)" SelectCommand="SELECT top 50 * FROM [tbl_shaahr_article] ORDER BY [id] DESC"
        UpdateCommand="UPDATE tbl_shaahr_article SET title = @title, text = @text, show = @show WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="title" />
            <asp:Parameter Name="text" />
            <asp:Parameter Name="show" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
