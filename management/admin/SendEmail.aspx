<%@ Page Title="" Language="VB" MasterPageFile="~/management/admin/CMS.master" AutoEventWireup="false"
    ValidateRequest="false" CodeFile="SendEmail.aspx.vb" Inherits="management_admin_SendEmail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
            theme_advanced_toolbar_align: "right",
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
    <style type="text/css">
        .style13
        {
            width: 89px;
        }
        .style14
        {
            width: 92px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                    <asp:View ID="preSend" runat="server">
                        <table class="style1">
                            <tr>
                                <td class="style14">
                                    ارسال به:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmailTo" runat="server" Style="text-align: left; direction: ltr;"
                                        Width="366px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmailTo"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailTo"
                                        ErrorMessage="فرمت اشتباه است." 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                        ValidationGroup="22"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style14">
                                    عنوان ایمیل:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSubject" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                        Width="651px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSubject"
                                        ErrorMessage="*" ValidationGroup="22"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style14">
                                    &nbsp;
                                </td>
                                <td>
                                    <textarea id="txtText" runat="server" cols="80" name="elm1" rows="15" 
                                        style="width: 80%;" dir="rtl">
	            </textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="style14">
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Button ID="btnPre" runat="server" Style="font-family: Tahoma; font-size: 11"
                                        Text="پیش نمایش" ValidationGroup="22" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style14">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="send" runat="server">
                        <table class="style1">
                            <tr>
                                <td class="style13">
                                    ارسال به:
                                </td>
                                <td>
                                    <asp:Label ID="lblEmail" runat="server" Style="font-weight: 700"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13">
                                    عنوان ایمیل:
                                </td>
                                <td>
                                    <asp:Label ID="lblSubject" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13">
                                    متن:
                                </td>
                                <td>
                                    <div style="width: 700px; border: 1px solid red; padding: 5px;" id="lblText" runat="server">
                                       
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="style13">
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Height="27px" Style="font-family: Tahoma;
                                        font-size: 11px" Text="ارسال ایمیل" Width="97px" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="VSucc" runat="server">
                        موفقیت
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
