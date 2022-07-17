<%@ Page Title="" Language="VB" MasterPageFile="~/management/admin/CMS.master" AutoEventWireup="false"
    ValidateRequest="false" CodeFile="edit.aspx.vb" Inherits="management_admin_edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            width: 141px;
        }
        .style14
        {
            height: 23px;
        }
        .style15
        {
            width: 112px;
        }
        .style16
        {
            width: 115px;
        }
        .style17
        {
            width: 141px;
            height: 27px;
        }
        .style18
        {
            height: 27px;
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
    <table class="style1">
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style14">
                <asp:Label ID="lblCode" runat="server" Font-Size="20px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:SqlDataSource 
                    ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>"
                    
                    SelectCommand="SELECT  [Code], [Title], [logo] FROM [tbl_shaahr_Android] ORDER BY [Code] DESC" 
                    DeleteCommand="DELETE FROM tbl_shaahr_Android WHERE (Code = @code)">
                    <DeleteParameters>
                        <asp:Parameter Name="code" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="DG" runat="server" AutoGenerateColumns="False" DataKeyNames="Code"
                    DataSourceID="SDS" AllowPaging="True" PageSize="20">
                    <Columns>
                        <asp:TemplateField HeaderText="کد نرم افزار" InsertVisible="False" SortExpression="Code">
                            <ItemTemplate>
                                <div style="background-color: Yellow; padding: 3px;">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Code") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Title" HeaderText="" SortExpression="Title" />
                        <asp:TemplateField SortExpression="logo">
                            <ItemTemplate>
                                <asp:Image ID="Image1" ImageUrl='<%# getImgLogo(Eval("logo","{0}")) %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button3" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                    OnCommand="edit_" Style="font-family: Tahoma; font-size: 10px" Text="ویرایش " />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" OnClientClick="return confirm('مطمئن از پاک کردن هستید؟');"
                                    CommandName="Delete" Text="حذف"></asp:LinkButton>
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
                <table class="style1">
                    <tr>
                        <td class="style13">
                            نام برنامه:
                        </td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" Width="521px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;</td>
                        <td>
                            <asp:RadioButtonList ID="rbType" runat="server" BackColor="#FF9933" 
                                Font-Size="15px" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="0">برنامه-program</asp:ListItem>
                                <asp:ListItem Value="1">بازی-game</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            فایل اصلی برنامه:
                        </td>
                        <td>
                            <table class="style1">
                                <tr>
                                    <td class="style16">
                                        لینک فایل اصلی جاری:
                                    </td>
                                    <td>
                                        <asp:HyperLink ID="hypLinkCuurent" runat="server" Target="_blank">[hypLinkCuurent]</asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                        آپلود فایل جدید:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFileLink" Style="direction: ltr;" runat="server" Width="521px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            فایل دیتا:
                        </td>
                        <td>
                            <table class="style1">
                                <tr>
                                    <td class="style15">
                                        لینک فایل دیتا جاری:
                                    </td>
                                    <td>
                                        <asp:HyperLink ID="hypLinkDataCuurent" runat="server" Target="_blank">[hypLinkCuurent]</asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style15">
                                        آپلود فایل جدید:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFileDataLink" Style="direction: ltr;" runat="server" Width="521px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            فایل عکس اصلی:
                        </td>
                        <td>
                            <asp:HyperLink ID="hypPicture" runat="server" Style="color: #FF0000" Target="_blank">دیدن عکس اصلی</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblPicture" runat="server" Style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            تغییر عکس اصلی:
                        </td>
                        <td>
                            <asp:FileUpload ID="FileUpload" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            جزییات کم:
                            </td>
                        <td>
                            <textarea runat="server" id="txtDetailSmall" name="elm2" rows="15" cols="80" style="width: 80%;
                                height: 200px;" visible="True">
	            </textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            جزییات کامل:
                            </td>
                        <td>
                            <textarea runat="server" id="txtDetailBig" name="elm2" rows="15" cols="80" style="width: 80%;
                                height: 500px;" visible="True">
	            </textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            دسته برنامه:
                        </td>
                        <td>
                            <table bgcolor="#CCFFCC" class="style1">
                                <tr>
                                    <td class="style17">
                                        <asp:Label ID="lblCat" runat="server" Style="font-weight: 700; font-size: 20px"></asp:Label>
                                    </td>
                                    <td class="style18">
                                        <asp:Label ID="lblCatCode" runat="server" Style="font-weight: 700; font-size: 20px;
                                            color: #CC0000; direction: ltr;"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        <asp:RadioButton ID="r_program" runat="server" AutoPostBack="True" Checked="True"
                                            Text="برنامه ها" />
                                        <asp:DropDownList ID="Drp_program" runat="server" Style="font-family: Tahoma" AutoPostBack="True">
                                            <asp:ListItem Value="1">ارتباطی</asp:ListItem>
                                            <asp:ListItem Value="2">ابزار</asp:ListItem>
                                            <asp:ListItem Value="3">همراه بانک</asp:ListItem>
                                            <asp:ListItem Value="4">سخنگو</asp:ListItem>
                                            <asp:ListItem Value="5">آنتی ویروس</asp:ListItem>
                                            <asp:ListItem Value="6">خبری و اطلاع رسانی</asp:ListItem>
                                            <asp:ListItem Value="7">انواع کتاب</asp:ListItem>
                                            <asp:ListItem Value="8">نرم افزارهای فارسی</asp:ListItem>
                                            <asp:ListItem Value="9">آموزشی</asp:ListItem>
                                            <asp:ListItem Value="10">امنیتی</asp:ListItem>
                                            <asp:ListItem Value="11">اینترنتی</asp:ListItem>
                                            <asp:ListItem Value="12">آب و هوا</asp:ListItem>
                                            <asp:ListItem Value="13">آموزشی و مهندسی</asp:ListItem>
                                            <asp:ListItem Value="14">تقویم</asp:ListItem>
                                            <asp:ListItem Value="15">فرهنگ لغات</asp:ListItem>
                                            <asp:ListItem Value="16">سرگرمی</asp:ListItem>
                                            <asp:ListItem Value="17">هنری</asp:ListItem>
                                            <asp:ListItem Value="18">ورزشی</asp:ListItem>
                                            <asp:ListItem Value="19">سیستمی</asp:ListItem>
                                            <asp:ListItem Value="20">عکس ، تصویر و مدیا</asp:ListItem>
                                            <asp:ListItem Value="21">مذهبی</asp:ListItem>
                                            <asp:ListItem Value="22">مکان یابی</asp:ListItem>
                                            <asp:ListItem Value="23">مسنجر و چت</asp:ListItem>
                                            <asp:ListItem Value="24">نوشتاری ، خواندنی و آفیس</asp:ListItem>
                                            <asp:ListItem Value="25">پزشکی . بهداشتی</asp:ListItem>
                                            <asp:ListItem Value="46">موسیقی</asp:ListItem>
                                             <asp:ListItem Value="47">مالی و حسابداری</asp:ListItem>
                                             <asp:ListItem Value="48">فیلتر شکن</asp:ListItem>
                                            <asp:ListItem Value="26">متفرقه</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="r_game" runat="server" AutoPostBack="True" Text="بازی ها" />
                                        <br />
                                        <asp:DropDownList ID="Drg_Game" runat="server" Style="font-family: Tahoma" Enabled="False"
                                            AutoPostBack="True">
                                            <asp:ListItem Value="27">استراتژی</asp:ListItem>
                                            <asp:ListItem Value="28">بازی سه بعدی</asp:ListItem>
                                            <asp:ListItem Value="29">بازی HD</asp:ListItem>
                                            <asp:ListItem Value="30">ترستانک</asp:ListItem>
                                            <asp:ListItem Value="31">رکوردزنی</asp:ListItem>
                                            <asp:ListItem Value="32">هیجان انگیز</asp:ListItem>
                                            <asp:ListItem Value="33">شتاب سنج</asp:ListItem>
                                            <asp:ListItem Value="34">نشانه گیری</asp:ListItem>
                                            <asp:ListItem Value="35">اکشن</asp:ListItem>
                                            <asp:ListItem Value="36">تیر اندازی</asp:ListItem>
                                            <asp:ListItem Value="37">رزمی</asp:ListItem>
                                            <asp:ListItem Value="38">فکری و پازل</asp:ListItem>
                                            <asp:ListItem Value="39">کارتی</asp:ListItem>
                                            <asp:ListItem Value="40">کلاسیک</asp:ListItem>
                                            <asp:ListItem Value="41">ماجرایی</asp:ListItem>
                                            <asp:ListItem Value="42">مسابقه ای</asp:ListItem>
                                            <asp:ListItem Value="43">ورزشی</asp:ListItem>
                                            <asp:ListItem Value="44">شبیه ساز</asp:ListItem>
                                            <asp:ListItem Value="45">متفرقه</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            لوگو:
                        </td>
                        <td>
                            <asp:Image ID="imgLogo" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="lblLogo" runat="server" Style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            لوگوی جدید:
                        </td>
                        <td>
                            <asp:FileUpload ID="FileUploadLogo" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            رتبه گوگل:
                        </td>
                        <td>
                                                    <asp:RadioButtonList ID="rblGoogle" runat="server" 
                                RepeatColumns="9" RepeatDirection="Horizontal">
                                                        <asp:ListItem Value="1">رتبه 1</asp:ListItem>
                                                        <asp:ListItem Value="2">رتبه 1.5</asp:ListItem>
                                                        <asp:ListItem Value="3">رتبه 2</asp:ListItem>
                                                        <asp:ListItem Value="4">رتبه 2.5</asp:ListItem>
                                                        <asp:ListItem Value="5">رتبه 3</asp:ListItem>
                                                        <asp:ListItem Value="6">رتبه 3.5</asp:ListItem>
                                                        <asp:ListItem Value="7">رتبه 4</asp:ListItem>
                                                        <asp:ListItem Value="8">رتبه 4.5</asp:ListItem>
                                                        <asp:ListItem Value="9">رتبه 5</asp:ListItem>
                                                    </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            تعداد دانلود گوگل:
                        </td>
                        <td>
                            &nbsp;
                            <asp:TextBox ID="txtGoogleDownload" runat="server"></asp:TextBox>
                            &nbsp;مدیر محترم دقت کن ، هر چقدر که دانلود گوگل دارد بصورت + نشان بده ، مثلا اگه
                            تا حال ، 2500 دانلود داشته ، بنویس +2500
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            سازندگان:
                            </td>
                        <td>
                            <textarea runat="server" id="txtCompany" name="elm2" rows="15" cols="80" style="width: 80%;
                                height: 150px;" visible="True">
	            </textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            قیمت:
                        </td>
                        <td>
                            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            تعداد خرید:
                        </td>
                        <td>
                            <asp:Label ID="lblCountBuy" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            اندازه فایل:
                        </td>
                        <td>
                            <asp:TextBox ID="txtSize" runat="server"></asp:TextBox>
                            &nbsp;مثال: 4.25mb
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            زبان برنامه:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbLanguage" runat="server" Style="font-family: Tahoma; direction: ltr">
                                <asp:ListItem Value="0">فارسی</asp:ListItem>
                                <asp:ListItem Value="1">انگلیسی</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            ورژن:
                        </td>
                        <td>
                            <asp:TextBox ID="txtVersion" runat="server"></asp:TextBox>
                            &nbsp;بسیار مهم : مثال: <b>12.5.3</b> ** نکته: از بکار بوردن هرگونه کارکتر دیگر
                            مثل V با - یا _ یا و .. خوداری کنید**
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            جزییات ورژن جدید:
                            </td>
                        <td>
                            <textarea runat="server" id="txtNewVersion" name="elm3" rows="15" cols="80" style="width: 80%;
                                height: 150px;" visible="True">
	            </textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            نمایش / عدم نمایش:
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rb_Show" runat="server">
                                <asp:ListItem Value="1">نمایش</asp:ListItem>
                                <asp:ListItem Value="0">عدم نمایش</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
                <asp:Button ID="btnUpdate" runat="server" Height="47px" Style="font-family: Tahoma;
                    font-size: 20px" Text="ویرایش" Width="847px" />
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
