<%@ Page Title="" Language="VB" MasterPageFile="~/MasterOther.master" AutoEventWireup="false"
    CodeFile="post.aspx.vb" Inherits="Default2" %>

<%@ Register Src="UserControl/ucComments.ascx" TagName="ucComments" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <asp:Literal ID="litMetaTag" runat="server"></asp:Literal>
    <link href='<%= ResolveUrl("content/css/Post.css") %>' rel="stylesheet" type="text/css" />
    <style type="text/css">
        .imgOrg
        {
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }
        .Context
        {
            width: 690px;
            padding: 10px;
            line-height: 1.9em;
            margin-top: 10px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            box-shadow: 1px 2px 6px 3px #BDBDBD;
            margin-top: 15px;
        }
        .ContextDownload
        {
            background: #7bceed; /* Old browsers */
            background: -moz-linear-gradient(left, #7bceed 0%, #a6daed 84%, #2cafe3 84%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, right top, color-stop(0%,#7bceed), color-stop(84%,#a6daed), color-stop(84%,#2cafe3)); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(left, #7bceed 0%,#a6daed 84%,#2cafe3 84%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(left, #7bceed 0%,#a6daed 84%,#2cafe3 84%); /* Opera 11.10+ */
            background: -ms-linear-gradient(left, #7bceed 0%,#a6daed 84%,#2cafe3 84%); /* IE10+ */
            background: linear-gradient(to right, #7bceed 0%,#a6daed 84%,#2cafe3 84%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#7bceed', endColorstr='#2cafe3',GradientType=1 ); /* IE6-9 */
            padding: 10px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            box-shadow: 1px 2px 6px 3px #BDBDBD;
            font: normal 18px koodakAnd;
            text-align: center;
        }
        .ContextGal
        {
            padding: 4px;
            text-align: center;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            box-shadow: 1px 2px 6px 3px #BDBDBD;
            margin-top: 15px;
        }
        .ContextPic
        {
            text-align: center;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            box-shadow: 1px 2px 6px 3px #BDBDBD;
            padding: 5px;
        }
        .ContextAtt
        {
            padding: 5px;
            background-color: White;
            border: 1px solid #ccc;
            width: 290px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }
        .imgBest
        {
            cursor: pointer;
            width: 68px;
            height: 68px;
            -moz-border-radius: 8px;
            -webkit-border-radius: 8px;
            border-radius: 8px;
            border-bottom: 1px solid #848484;
            opacity: 0.9;
            margin: 1px;
        }
        .imgBest:hover
        {
            opacity: 1;
        }
        .title
        {
            font-family: koodakAnd;
            font-size: 15px;
            padding-right: 5px;
            margin-bottom: 8px;
            margin-top: 3px;
            margin-bottom: 3px;
        }
    </style>
    <!-- Module -->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $('a.login-window').click(function () {
                // Getting the variable's value from a link 
                var loginBox = $(this).attr('href');

                //Fade in the Popup and add close button
                $(loginBox).fadeIn(300);

                //Set the center alignment padding + border
                var popMargTop = ($(loginBox).height() + 24) / 2;
                var popMargLeft = ($(loginBox).width() + 24) / 2;

                $(loginBox).css({
                    'margin-top': -popMargTop,
                    'margin-left': -popMargLeft
                });

                // Add the mask to body
                $('body').append('<div id="mask"></div>');
                $('#mask').fadeIn(300);

                return false;
            });

            // When clicking on the button close or the mask layer the popup closed
            $('a.close, #mask').live('click', function () {
                $('#mask , .login-popup').fadeOut(300, function () {
                    $('#mask').remove();
                });
                return false;
            });
            // When clicking on the button close or the mask layer the popup closed
            $('a.close, #mask').live('click', function () {
                $('#mask , .awarApp-popup').fadeOut(300, function () {
                    $('#mask').remove();
                });
                return false;
            });
            // When clicking on the button close or the mask layer the popup closed
            $('a.close, #mask').live('click', function () {
                $('#mask , .awarLink-popup').fadeOut(300, function () {
                    $('#mask').remove();
                });
                return false;
            });
        });
    </script>
    <script type="text/javascript">
        function slideSwitch() {
            var $active = $('#slideshow DIV.active');

            if ($active.length == 0) $active = $('#slideshow DIV:last');

            var $next = $active.next().length ? $active.next()
        : $('#slideshow DIV:first');

            $active.addClass('last-active');

            $next.css({ opacity: 0.0 })
        .addClass('active')
        .animate({ opacity: 1.0 }, 1000, function () {
            $active.removeClass('active last-active');
        });
        }

        $(function () {
            setInterval("slideSwitch()", 6000);
        });
        </script>
    <!-- Album -->
    <link href="../../content/album/css/jquery.lightbox-0.5.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../content/album/js/jquery.lightbox-0.5.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#gallery a').lightBox();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lblOrgCode" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblOrgCodeCat" runat="server" Visible="false"></asp:Label>
    <div id="awarApp-box" class="awarApp-popup">
        <div style="width: 350px; height: 35px; color: #000; background-color: #FFCF21; font-family: koodakAnd;
            font-size: 16px; text-align: center; direction: rtl; margin-top: -5px; margin-bottom: 5px;
            -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
            اطلاع رسانی خراب بودن برنامه
        </div>
        <span style="color: Red;">کاربر محترم ، درصورتی که قسمت توضیحات را پر نفرمائید ، درخواست
            شما بررسی نخواهد شد ، با تشکر مدیریت شهروید </span>
        <div style="padding: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
            text-align: right; font-family: Tahoma; direction: rtl; height: 127px;">
            <table style="width: 100%;">
                <tr>
                    <td>
                        <div style="border: 1px solid #ccc; width: 320px; -moz-border-radius: 5px; margin-bottom: 5px;
                            -webkit-border-radius: 5px; border-radius: 5px; padding: 5px;">
                            <asp:TextBox Text="پست الکترونیک شما..." onfocus="if(this.value=='پست الکترونیک شما...'){this.value='';}"
                                ForeColor="#000" onblur="if(this.value==''){this.value='پست الکترونیک شما...';}if(this.value=='پست الکترونیک شما...')this.style.color='#000';"
                                onmousedown="this.style.color='#000';" onkeydown="if(event.keyCode==13){return InsertComment(this.value);}"
                                ID="awarApp_txtEmail" Style="border: 0; padding: 3px; width: 310px;" runat="server"
                                Font-Names="Tahoma"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="border: 1px solid #ccc; width: 320px; -moz-border-radius: 5px; margin-bottom: 5px;
                            -webkit-border-radius: 5px; border-radius: 5px; padding: 5px;">
                            <asp:TextBox Text="توضیحات شما..." onfocus="if(this.value=='توضیحات شما...'){this.value='';}"
                                ForeColor="#000" onblur="if(this.value==''){this.value='توضیحات شما...';}if(this.value=='توضیحات شما...')this.style.color='#000';"
                                onmousedown="this.style.color='#000';" onkeydown="if(event.keyCode==13){return InsertComment(this.value);}"
                                ID="awarApp_txtDetail" Style="border: 0; padding: 3px; width: 310px; font-size: 12px;"
                                runat="server" Font-Names="Tahoma" TextMode="MultiLine" Height="190px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnAwarApp" Style="border: 1px solid #4B88B6; font-family: Tahoma;
                            font-size: 12px; cursor: pointer; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                            border-radius: 5px; padding: 4px; background-color: White;" runat="server" Text="ارسال" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="awarLink-box" class="awarLink-popup">
        <div style="width: 350px; height: 35px; color: #000; background-color: #FF6F00; font-family: koodakAnd;
            font-size: 16px; text-align: center; direction: rtl; margin-top: -5px; margin-bottom: 5px;
            -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
            اطلاع رسانی خراب بودن لینک برنامه
        </div>
        <span style="color: Red;">کاربر محترم ، درصورتی که قسمت توضیحات را پر نفرمائید ، درخواست
            شما بررسی نخواهد شد ، با تشکر مدیریت شهروید </span>
        <div style="padding: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
            text-align: right; font-family: Tahoma; direction: rtl; height: 127px;">
            <table style="width: 100%;">
                <tr>
                    <td>
                        <div style="border: 1px solid #ccc; width: 320px; -moz-border-radius: 5px; margin-bottom: 5px;
                            -webkit-border-radius: 5px; border-radius: 5px; padding: 5px;">
                            <asp:TextBox Text="پست الکترونیک شما..." onfocus="if(this.value=='پست الکترونیک شما...'){this.value='';}"
                                ForeColor="#000" onblur="if(this.value==''){this.value='پست الکترونیک شما...';}if(this.value=='پست الکترونیک شما...')this.style.color='#000';"
                                onmousedown="this.style.color='#000';" onkeydown="if(event.keyCode==13){return InsertComment(this.value);}"
                                ID="awarLink_txtEmail" Style="border: 0; padding: 3px; width: 310px;" runat="server"
                                Font-Names="Tahoma"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="border: 1px solid #ccc; width: 320px; -moz-border-radius: 5px; margin-bottom: 5px;
                            -webkit-border-radius: 5px; border-radius: 5px; padding: 5px;">
                            <asp:TextBox Text="توضیحات شما..." onfocus="if(this.value=='توضیحات شما...'){this.value='';}"
                                ForeColor="#000" onblur="if(this.value==''){this.value='توضیحات شما...';}if(this.value=='توضیحات شما...')this.style.color='#000';"
                                onmousedown="this.style.color='#000';" onkeydown="if(event.keyCode==13){return InsertComment(this.value);}"
                                ID="awarLink_txtDetail" Style="border: 0; padding: 3px; width: 310px; font-size: 12px;"
                                runat="server" Font-Names="Tahoma" TextMode="MultiLine" Height="190px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnAwarLink" Style="border: 1px solid #4B88B6; font-family: Tahoma;
                            font-size: 12px; cursor: pointer; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                            border-radius: 5px; padding: 4px; background-color: White;" runat="server" Text="ارسال" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div runat="server" id="DivPost">
        <div style="float: right; width: 310px;">
            <div class="title">
                مشخصات این App</div>
            <div class="ContextAtt">
                <asp:DataList ID="DL_Attribute" runat="server" DataSourceID="SDS">
                    <ItemTemplate>
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <div style="padding-right: 5px; float: right; padding: 5px; width: 272px; margin: 2px;">
                                        <div>
                                            <div style="background-color: #6A6A6A; padding: 5px;">
                                                <table style="font-family: Tahoma; font-size: 11px; margin: 5px; padding: 5px;">
                                                    <tr>
                                                        <td>
                                                            <span style="color: #FDC700; font-weight: bold;">[Version]</span>
                                                        </td>
                                                        <td>
                                                            <div style="margin-left: 20px;">
                                                                <span style="background-color: #4FA43C; color: White; padding: 4px;">
                                                                    <asp:Label ID="Label4" runat="server" Style="font-weight: bold; font-size: 13px;"
                                                                        Text='<%# Eval("Version","{0}") %>'></asp:Label></span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <span style="color: #FDC700; font-weight: bold;">[File Size]</span>
                                                        </td>
                                                        <td>
                                                            <div style="margin-left: 20px;">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <span style="background-color: #4FA43C; color: White; padding: 4px;">
                                                                                <asp:Label ID="Label6" runat="server" Style="font-weight: bold; font-size: 13px;"
                                                                                    Text='<%# Eval("SizeFile","{0}") %>'></asp:Label></span>
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <span style="color: #FDC700; font-weight: bold;">[Language]</span>
                                                        </td>
                                                        <td>
                                                            <div style="margin-left: 20px;">
                                                                <span style="background-color: #C95A7A; color: White; padding: 4px;">
                                                                    <asp:Label ID="Label7" runat="server" Style="font-weight: bold; font-size: 13px;"
                                                                        Text='<%# IIF( Eval("Language","{0}")="True","فارسی","انگلیسی") %>'></asp:Label></span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <span style="color: #FDC700; font-weight: bold;">[Google Rate]</span>
                                                        </td>
                                                        <td>
                                                            <div style="margin-left: 20px;">
                                                                <span style="background-color: #4FA43C; color: White; padding: 4px;">
                                                                    <asp:Image ID="Image4" Style="width: 70px; height: 13px;" ImageUrl='<%# GetStar2(DataBinder.Eval(Container.DataItem,"googleRate")) %>'
                                                                        runat="server" /></span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            </span> <span style="color: #FDC700; font-weight: bold;">[Google Download]</span>
                                                        </td>
                                                        <td>
                                                            <span style="background-color: #FFFFFF; padding: 4px;">
                                                                <asp:Label ID="Label14" runat="server" Style="font-weight: bold; font-size: 13px;"
                                                                    Text='<%# Eval("googleDownload","{0}") %>'></asp:Label>
                                                            </span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div style="float: right;">
                                                <asp:Panel ID="panel2" runat="server" Style="padding: 5px; color: Black; width: 260px;
                                                    margin-top: 4px; border: 1px solid #2663BC; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                                                    border-radius: 5px;" Visible='<%# IIF(Eval("Developers", "{0}").trim()="",False,True) %>'>
                                                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Developers", "{0}") %>'></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("DetailNewVersion", "{0}") %>'> </asp:Label>
                                                </asp:Panel>
                                            </div>
                                            <div style="text-align: center; width: 250px; background-color: #C4EDFD; float: right;
                                                border-top: 2px dotted #737373; margin-top: 5px; padding: 10px;">
                                                <asp:Label ID="Label5" runat="server" Style="font-weight: bold; font-size: 13px;
                                                    font-family: koodakAnd; font-size: 25px; color: #238495;" Text='<%# IIF(Eval("Price","{0}")="0","رایگان",Eval("Price","{0}")) %>'></asp:Label>
                                            </div>
                                            <div style="width: 270px; float: right; margin-top: 5px;">
                                                <div style="background-color: #F8B101; width: 70px; height: 35px; -moz-border-radius: 2px;
                                                    padding-top: 5px; margin-left: 4px; float: right; -webkit-border-radius: 2px;
                                                    border-radius: 2px; padding-right: 10px;">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <span style="color: #A77C1F; font-family: koodakAnd; font-size: 15px;">دانلود</span>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label12" runat="server" Style="color: #fff; font-family: koodakAnd;
                                                                    font-size: 18px;" Text='<%# Eval("Count_Download","{0}") %>' />
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div style="background-color: #4FA43C; width: 90px; height: 35px; -moz-border-radius: 2px;
                                                    padding-top: 5px; margin-left: 4px; float: right; -webkit-border-radius: 2px;
                                                    border-radius: 2px; padding-right: 10px;">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <span style="color: #154A14; font-family: koodakAnd; font-size: 15px;">بازدید</span>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label13" runat="server" Style="color: #fff; font-family: koodakAnd;
                                                                    font-size: 18px;" Text='<%# Eval("Count_Visit","{0}") %>' />
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div style="background-color: #2A9DBF; width: 70px; height: 35px; -moz-border-radius: 2px;
                                                    padding-top: 5px; margin-left: 2px; float: right; -webkit-border-radius: 2px;
                                                    border-radius: 2px; padding-right: 10px;">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <span style="color: #2C5683; font-family: koodakAnd; font-size: 15px;">رتبه</span>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label9" runat="server" Style="color: #fff; font-family: koodakAnd;
                                                                    font-size: 18px;" Text='<%# GetRate(Eval("code","{0}")) %>' />
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="margin-top: 5px; float: right; width: 290px;">
                                            <div>
                                                <a target="_blank">
                                                    <img border="0" width="280px" height="310px" src='<%# Eval("FileLink", "http://qr-code.ir/api/api-qrcode.php?d={0}") %>'
                                                        title="My QR-Code Andriod.shaahr.com" alt="Andriod.shaahr.com" />
                                                </a>
                                            </div>
                                        </div>
                                        <%-- <div style="margin-top: 5px; margin-bottom: 10px; float: right; width: 260px; border: 1px solid #FF0000;
                                            padding: 4px; height: 155px; text-align: center; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                                            border-radius: 5px;">
                                            <div style="font: normal 13px koodakAnd;">
                                                دانلود فایل ها و تاریخ درج پست</div>
                                            <div style="padding: 2px; font-family: Tahoma; font-size: 11px;">
                                                <asp:Label ID="Label1" Style="color: White; font-size: 12px;" runat="server" Text='<%# getNamefile_(Eval("FileLink")) %>'></asp:Label></div>
                                            <div style="padding: 6px; font-family: Tahoma; font-size: 11px; background-color: #EEEEEE;">
                                                <asp:Label ID="Label3" runat="server" Style="color: #6A6A6A;" Text='<%# getDateShamsi_(Eval("date","{0}")) %>'></asp:Label></div>
                                            <div style="padding: 2px; margin-top: 5px;">
                                                <asp:Label ID="Label2" runat="server" Text='<%# getVolume_() %>'></asp:Label></div>
                                            <div>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("FileLink", "{0}")+"|"+Eval("code", "{0}") %>'
                                                    ImageUrl="~/content/images/btnDownload.png" OnCommand="Download" /></div>
                                            <div>
                                                <asp:ImageButton ID="ImageButton2" runat="server" Visible='<%# iif(eval("FileDataLink","{0}").trim()="",false,true) %>'
                                                    CommandArgument='<%# Eval("FileDataLink", "{0}") %>' ImageUrl="~/content/images/btnDownloadData.png"
                                                    OnCommand="DownloadData" /></div>
                                        </div>--%>
                                        <div style="float: right; background-color: #F4DBDB; font-family: Tahoma; font-size: 11px;
                                            width: 255px; padding: 7px; margin-top: 2px; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                                            border-radius: 5px; border: 1px solid #D7A891; color: Red;">
                                            کاربران محترم ، تمامی برنامه های گذاشته شده در سایت ، قبل از قرار گرفتن بروی سایت
                                            تست شده است ، ولی در صورت هر گونه مشکل از گزینه های خرابی تعبیه شده ، مشکل را به
                                            ما اطلاع بدهید.
                                        </div>
                                        <div style="float: right; text-align: center;">
                                            <a href="#awarApp-box" class="login-window" style="text-decoration: none;"><span
                                                style="padding: 3px; margin: 4px; font-family: koodakAnd; font-size: 13px; color: White;">
                                                <img src='<%= ResolveUrl("content/images/awar_App.png") %>' border="0" style="margin-top: 4px;
                                                    margin-bottom: 4px;" />
                                            </span></a><a href="#awarLink-box" class="login-window" style="text-decoration: none;">
                                                <span style="padding: 3px; margin: 4px; font-family: koodakAnd; font-size: 13px;
                                                    color: White;">
                                                    <img src='<%= ResolveUrl("content/images/awar_linkDownload.png") %>' border="0" />
                                                </span></a>
                                        </div>
                                        <div>
                                            <div>
                                                <div style="font-family: tahoma; font-size: 12px; padding-right: 5px; -moz-border-radius: 5px;
                                                    -webkit-border-radius: 5px; border-radius: 5px; background-color: #AC3590; padding: 5px;
                                                    width: 100px; float: right; color: White; margin-top: 5px; margin-bottom: 5px;">
                                                    برترین App ها</div>
                                            </div>
                                            <div style="padding: 3px;">
                                                <asp:DataList ID="DataList2" runat="server" DataSourceID="SDS_Best2" RepeatDirection="Horizontal"
                                                    RepeatColumns="4">
                                                    <ItemTemplate>
                                                        <a href='<%# ResolveUrl(Eval("code","post/{0}/") + Eval("title","{0}").ToString().Replace(" ", "-") + ".html") %>'
                                                            target="_blank" style="color: #115F6D; text-decoration: none; font-family: Tahoma;
                                                            font-size: 11px;">
                                                            <asp:Image ID="ImageButton1" CssClass="imgBest" ImageUrl='<%# getLogo(Eval("logo","{0}")) %>'
                                                                runat="server" />
                                                        </a>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                                <asp:SqlDataSource ID="SDS_Best2" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>"
                                                    SelectCommand="SELECT top 20 * FROM [tbl_shaahr_Android] WHERE ([Show] = @Show) ORDER BY [Count_Download] DESC">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="true" Name="Show" Type="Boolean" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                            <div>
                                                <div style="font-family: tahoma; font-size: 12px; padding-right: 5px; -moz-border-radius: 5px;
                                                    -webkit-border-radius: 5px; border-radius: 5px; background-color: #BAEB1E; padding: 5px;
                                                    width: 100px; margin-top: 5px; margin-bottom: 5px;">
                                                    آخرین App شهروید</div>
                                            </div>
                                            <div style="padding: 3px;">
                                                <asp:DataList ID="DataList1" runat="server" DataSourceID="SDS_Last" RepeatDirection="Horizontal"
                                                    RepeatColumns="2">
                                                    <ItemTemplate>
                                                        <a href='<%# ResolveUrl(Eval("code","post/{0}/") + Eval("title","{0}").ToString().Replace(" ", "-") + ".html") %>'
                                                            target="_blank" style="color: #115F6D; text-decoration: none; font-family: Tahoma;
                                                            font-size: 11px;">
                                                            <asp:Image Height="135px" Width="135px" ID="ImageButton1" CssClass="imgBest" ImageUrl='<%# getLogo(Eval("logo","{0}")) %>'
                                                                runat="server" />
                                                        </a>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                                <asp:SqlDataSource ID="SDS_Last" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>"
                                                    SelectCommand="SELECT top 20 * FROM [tbl_shaahr_Android] WHERE ([Show] = @Show) ORDER BY code DESC">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="true" Name="Show" Type="Boolean" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
        <div style="float: right; width: 712px;">
            <div>
                <asp:DataList ID="DL_post" runat="server" DataSourceID="SDS">
                    <ItemTemplate>
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="width: 72px;">
                                                <asp:Image Style="-moz-border-radius: 50px; -webkit-border-radius: 50px; border-radius: 50px;
                                                    width: 100px; height: 100px;" ID="Image2" runat="server" ImageUrl='<%# getLogo(Eval("logo","{0}")) %>' />
                                            </td>
                                            <td>
                                                <div>
                                                    <asp:Label Style="font-family: koodakAnd; font-size: 20px;" ID="TitleLabel" runat="server"
                                                        Text='<%# Eval("Title") %>' />
                                                    <asp:Label ID="lblCode" runat="server" Visible="false" Text='<%# Eval("Code", "{0}") %>'></asp:Label></div>
                                                <div>
                                                    <div>
                                                        <asp:Image ID="Image3" Height="20px" Width="100px" ImageUrl='<%# GetStar(DataBinder.Eval(Container.DataItem,"percentage")) %>'
                                                            runat="server" />
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="float: right; margin: 2px; width: 710px;">
                                        <br />
                                        <div class="title">
                                            تصویر پوسته</div>
                                        <br />
                                        <div class="ContextPic">
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PicturePath", "~\management\images\{0}") %>'
                                                CssClass="imgOrg" />
                                        </div>
                                        <br />
                                        <div class="title">
                                            توضیحات</div>
                                        <div class="Context">
                                            <asp:Label ID="DetailsLabel" runat="server" Text='<%# iif( Eval("BigDetails").trim()=string.empty, Eval("Details"), Eval("BigDetails")) %>' />
                                        </div>
                                        <br />
                                       <%-- <div style="padding: 5px; text-align: center; margin-top: 10px;">
                                            <a href="http://estekhdami.shaahr.com" target="_blank">
                                                <img src='<%= ResolveUrl("content/estekhdami2.gif") %>' />
                                            </a>
                                        </div>--%>
                                        <div class="title">
                                            لینک دانلود این App
                                        </div>
                                        <div>
                                            <asp:LinkButton CssClass="ContextDownload" Width="690px" ID="ImageButton1" runat="server"
                                                CommandArgument='<%# Eval("FileLink", "{0}")+"|"+Eval("code", "{0}") %>' OnCommand="Download"
                                                Style="color: #2C5683; text-shadow: 3px 3px 3px #A8D1E2;" Text="لینک دانلود فایل اصلی" />
                                        </div>
                                        <div style="margin-top: 20px;">
                                            <asp:LinkButton CssClass="ContextDownload" Width="690px" Style="color: #2C5683; text-shadow: 1px 1px 1px #8ccde5;"
                                                ID="ImageButton2" runat="server" Visible='<%# iif(eval("FileDataLink","{0}").trim()="",false,true) %>'
                                                CommandArgument='<%# Eval("FileDataLink", "{0}") %>' Text="لینک دانلود فایل دیتا"
                                                OnCommand="DownloadData" />
                                        </div>
                                       <%-- <div style="padding: 5px; text-align: center; margin-top: 10px;">
                                            <a href="http://estekhdami.shaahr.com" target="_blank">
                                                <img src='<%= ResolveUrl("content/estekhdami.gif") %>' />
                                            </a>
                                        </div>--%>
                                    </div>
                                    <br />
                                    <div class="title">
                                        تصاویری از محیط داخلی این App</div>
                                    <div class="ContextGal">
                                        <div id="gallery">
                                            <ul>
                                                <asp:DataList ID="DL_picture" runat="server" DataSourceID="SDS_Pictures" RepeatColumns="3"
                                                    RepeatDirection="Horizontal">
                                                    <ItemTemplate>
                                                        <li>
                                                            <div style="margin: 5px;">
                                                                <a href='<%# Eval("Filename","../../management/images/picture/{0}") %>' style="padding: 2px;">
                                                                    <asp:Image ID="Image5" runat="server" ImageUrl='<%# Eval("Filename","~/management/images/picture/{0}") %>'
                                                                        Width="210" Height="226" />
                                                                </a>
                                                            </div>
                                                        </li>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                                <asp:SqlDataSource ID="SDS_Pictures" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>"
                                                    SelectCommand="SELECT * FROM [tbl_shaahr_Pictures] WHERE ([CodeAndroid] = @CodeAndroid) ORDER BY [ID] DESC">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="lblOrgCode" Name="CodeAndroid" PropertyName="Text"
                                                            Type="Int64" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </ul>
                                        </div>
                                    </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <div>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UP_Comment" runat="server">
                    <ContentTemplate>
                        <asp:UpdateProgress ID="UPG" runat="server" AssociatedUpdatePanelID="UP_Comment">
                            <ProgressTemplate>
                                <span style="font-family: Tahoma; font-size: 11px; padding: 4px;">در حال بارگذاری...</span></ProgressTemplate>
                        </asp:UpdateProgress>
                        <uc1:ucComments ID="ucComments1" runat="server" Visible="true" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div style="float: right; border-top: 5px solid #91C33C; width: 320px; margin-top: 5px;
                width: 715px; padding-top: 4px;">
                <table style="width: 100%;">
                    <tr style="font-family: koodakAnd; font-size: 12px;">
                        <td>
                            برنامه های مرتبط
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DataList ID="Dl_RelationSoftware" runat="server" DataSourceID="SDS_Top" RepeatDirection="Horizontal"
                                RepeatColumns="8">
                                <ItemTemplate>
                                    <div style="padding: 4px; background-color: #f3f3f3; -moz-border-radius: 3px; -webkit-border-radius: 3px;
                                        width: 75px; height: 75px; margin: 2px; border-radius: 3px; border: 1px solid #ccc;">
                                        <a href='<%# ResolveUrl(Eval("code","post/{0}/") + Eval("title","{0}").ToString().Replace(" ", "-") + ".html") %>'
                                            target="_blank" style="color: #115F6D; text-decoration: none; font-family: Tahoma;
                                            font-size: 11px;">
                                            <asp:Image ID="ImageButton1" CssClass="imgBest" ImageUrl='<%# getLogo(Eval("logo","{0}")) %>'
                                                runat="server" />
                                        </a>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList><asp:SqlDataSource ID="SDS_Top" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>"
                                SelectCommand="SELECT top 32 * FROM [tbl_shaahr_Android] WHERE (([Show] = @Show) AND ([Code_Category] = @Code_Category))">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="true" Name="Show" Type="Boolean" />
                                    <asp:ControlParameter ControlID="lblOrgCodeCat" Name="Code_Category" PropertyName="Text"
                                        Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>"
        SelectCommand="SELECT *, Case when count_download <> 0 then cast(round(((count_download*1.0) /(select sum(count_download) from tbl_shaahr_Android))*100,0) as int) end as 'percentage' FROM [tbl_shaahr_Android] WHERE ([Code] = @Code) and show=1">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblOrgCode" Name="Code" PropertyName="Text" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div id="DivEmpty" runat="server" style="text-align: center;" visible="false">
        <div>
            <img src='<%= ResolveUrl("content/images/warning.png") %>' /></div>
        <div style="font: normal 20px koodakAnd;">
            این App به دلایلی از سرویس خارج شده است</div>
    </div>
</asp:Content>
