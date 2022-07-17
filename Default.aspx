<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Src="usercontrol/newsLetter.ascx" TagName="newsLetter" TagPrefix="uc1" %>
<%@ Register Src="usercontrol/article.ascx" TagName="article" TagPrefix="uc2" %>
<%@ Register Src="usercontrol/statistical.ascx" TagName="statistical" TagPrefix="uc3" %>
<%@ Register Src="usercontrol/bestApp.ascx" TagName="bestApp" TagPrefix="uc4" %>
<%@ Register Src="usercontrol/SpecialApp.ascx" TagName="SpecialApp" TagPrefix="uc5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        (function (d, t) {
            var g = d.createElement(t), s = d.getElementsByTagName(t)[0]; g.async = true;
            g.src = 'http://js.imagefly.io/shaahr.min.js'; s.parentNode.insertBefore(g, s);
        } (document, 'script'));
    </script>
    <script type="text/javascript">
        function borderIn(e) {
            document.getElementById(e).style.boxShadow = '2px 2px 2px #ccc';

        }
        function borderOut(e) {
            document.getElementById(e).style.boxShadow = '0px 0px 0px #ccc';
        }
    </script>
    <style type="text/css">
        .gridview
        {
            background-color: #fff;
            padding: 2px;
            margin: 2% auto;
        }
        .gridview a
        {
            margin: auto 1%;
            border-radius: 50%;
            background-color: #444;
            padding: 5px 10px 5px 10px;
            color: #fff;
            text-decoration: none;
            -o-box-shadow: 1px 1px 1px #111;
            -moz-box-shadow: 1px 1px 1px #111;
            -webkit-box-shadow: 1px 1px 1px #111;
            box-shadow: 1px 1px 1px #111;
        }
        .gridview a:hover
        {
            background-color: #F18322;
            color: #fff;
        }
        .gridview span
        {
            background-color: #57C0DB;
            color: #fff;
            -o-box-shadow: 1px 1px 1px #111;
            -moz-box-shadow: 1px 1px 1px #111;
            -webkit-box-shadow: 1px 1px 1px #111;
            box-shadow: 1px 1px 1px #111;
            border-radius: 50%;
            padding: 5px 10px 5px 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>--%>
    <div style="float: right; width: 213px;" id="RIGHT_SIDE">
        <div id="newsLetter">
            <%--<uc1:newsLetter ID="newsLetter1" runat="server" />--%>
            <iframe src='<%= ResolveUrl("UserControl/frmNewsLetter.aspx") %>' style="border: 0;"
                scrolling="no" height="180px" width="219px"></iframe>
        </div>
        <div id="article">
            <uc2:article ID="article1" runat="server" />
        </div>
        <div id="bestApp">
            <uc4:bestApp ID="bestApp1" runat="server" />
        </div>
    </div>
    <div style="float: right; width: 641px;" id="CENTER_SIDE">
        <div id="ads">
            <%--            <a href="http://estekhdami.shaahr.com" target="_blank">
                <img src="content/estekhdami.gif" style="-moz-border-radius: 5px; -webkit-border-radius: 5px;
                    border-radius: 5px; border: 1px solid #EFEFEF;" />
            </a><a href="http://www.4charj.ir/" target="_blank">
                <img src="content/468sharj.gif" style="margin-top: 5px; -moz-border-radius: 5px;
                    -webkit-border-radius: 5px; border-radius: 5px; border: 1px solid #EFEFEF;" />
            </a>--%><%--<a href="http://estekhdami.shaahr.com/" target="_blank">
                <img src="content/estekhdami2.gif" style="margin-top: 5px; -moz-border-radius: 5px;
                    -webkit-border-radius: 5px; border-radius: 5px; border: 1px solid #EFEFEF;" />
            </a>--%>
        </div>
        <div id="SinglePost">
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SDS2" GridLines="None"
                PageSize="15" ShowFooter="True" ShowHeader="False" AutoGenerateColumns="False"
                DataKeyNames="Code" AllowPaging="True">
                <PagerStyle CssClass="gridview"></PagerStyle>
                <Columns>
                    <asp:TemplateField HeaderText="Code" InsertVisible="False" SortExpression="Code">
                        <ItemTemplate>
                            <div style="padding-right: 9px;">
                                <a target="_blank" style="text-decoration: none; color: Black; font-family: koodakAnd;"
                                    href='<%# "Post/" + Eval("code","{0}").trim() + "/" + Eval("title","{0}").Trim.Replace(" ", "-").Trim() + ".html" %>'>
                                    <h2>
                                        <asp:Label ID="Label2" runat="server" Style="font-family: koodakAnd; font-size: 15px;"
                                            Text='<%# Eval("Title", "{0}") %>'></asp:Label>
                                    </h2>
                                </a>
                            </div>
                            <div id='<%# Eval("code", "{0}") %>' onmouseout="borderOut(this.id);" onmousemove="borderIn(this.id);"
                                style="margin-bottom: 10px; padding: 5px; width: 630px;">
                                <a target="_blank" href='<%# "Post/" + Eval("code","{0}").trim() + "/" + Eval("title","{0}").Trim.Replace(" ", "-").Trim() + ".html" %>'>
                                    <img src='<%# "Crop.aspx?P="+ Eval("PicturePath", "{0}") +"&W=680&H=385" %>' style="cursor: pointer;"
                                        id='<%# "img_"+Eval("code", "{0}") %>' width="630" height="357" />
                                </a>
                                <div style="font-family: tahoma; font-size: 12px;">
                                    <div style="font-size: 14px;">
                                        <span>
                                            <img src="content/images/downUsers.png" width="15" height="15" /></span> <span>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Count_Visit", "{0}") %>'></asp:Label>
                                            </span>
                                    </div>
                                    <p>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Details", "{0}") %>'></asp:Label>
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SDS2" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>"
                SelectCommand="SELECT  top 1 * FROM [tbl_shaahr_Android] WHERE ([Show] = @Show) ORDER BY [Code] DESC">
                <SelectParameters>
                    <asp:Parameter DefaultValue="True" Name="Type" Type="Boolean" />
                    <asp:Parameter DefaultValue="true" Name="Show" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div>
            <uc5:SpecialApp ID="SpecialApp1" runat="server" />
        </div>
        <%--<div style="text-align:center;">
            <a href="http://estekhdami.shaahr.com/" target="_blank">
                <img src="content/estekhdami2.gif" style="margin-top: 5px; -moz-border-radius: 5px;
                    -webkit-border-radius: 5px; border-radius: 5px; border: 1px solid #EFEFEF;" />
            </a>
        </div>--%>
        <div id="post">
            <asp:GridView ID="dg1" runat="server" DataSourceID="SDS1" GridLines="None" PageSize="15"
                ShowFooter="True" ShowHeader="False" AutoGenerateColumns="False" DataKeyNames="Code"
                AllowPaging="True">
                <PagerStyle CssClass="gridview"></PagerStyle>
                <Columns>
                    <asp:TemplateField HeaderText="Code" InsertVisible="False" SortExpression="Code">
                        <ItemTemplate>
                            <div style="padding-right: 9px;">
                                <a target="_blank" style="text-decoration: none; color: Black; font-family: koodakAnd;"
                                    href='<%# "Post/" + Eval("code","{0}").trim() + "/" + Eval("title","{0}").Trim.Replace(" ", "-").Trim() + ".html" %>'>
                                    <h2>
                                        <asp:Label ID="Label2" runat="server" Style="font-family: koodakAnd; font-size: 15px;"
                                            Text='<%# Eval("Title", "{0}") %>'></asp:Label>
                                    </h2>
                                </a>
                            </div>
                            <div id='<%# Eval("code", "{0}") %>' onmouseout="borderOut(this.id);" onmousemove="borderIn(this.id);"
                                style="margin-bottom: 10px; padding: 5px; width: 630px;">
                                <a target="_blank" href='<%# "Post/" + Eval("code","{0}").trim() + "/" + Eval("title","{0}").Trim.Replace(" ", "-").Trim() + ".html" %>'>
                                    <img src='<%# "Crop.aspx?P="+ Eval("PicturePath", "{0}") +"&W=630&H=348" %>' style="cursor: pointer;"
                                        id='<%# "img_"+Eval("code", "{0}") %>' width="630" height="357" />
                                </a>
                                <div style="font-family: tahoma; font-size: 12px;">
                                    <div style="font-size: 14px;">
                                        <span>
                                            <img src="content/images/downUsers.png" width="15" height="15" /></span> <span>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Count_Visit", "{0}") %>'></asp:Label>
                                            </span>
                                    </div>
                                    <p>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Details", "{0}") %>'></asp:Label>
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SDS1" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>"
                SelectCommand="SELECT  * FROM [tbl_shaahr_Android] WHERE ([Show] = @Show) and code not in (SELECT  top 1 [code] FROM [tbl_shaahr_Android] WHERE ([Show] = @Show) ORDER BY [Code] DESC) ORDER BY [Code] DESC">
                <SelectParameters>
                    <asp:Parameter DefaultValue="True" Name="Type" Type="Boolean" />
                    <asp:Parameter DefaultValue="true" Name="Show" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <div style="float: right; width: 170px;" id="LEFT_SIDE">
        <div id="polling">
        </div>
        <div id="statistical">
            <uc3:statistical ID="statistical1" runat="server" />
        </div>
        <div id="adsLeft">
            <script type="text/javascript">
                var anetwork_pram = anetwork_pram || [];
                anetwork_pram['aduser'] = '1387392907';
                anetwork_pram['adheight'] = '240';
                anetwork_pram['adwidth'] = '120';
            </script>
            <script type="text/javascript" src="http://static-cdn.anetwork.ir/showad/pub.js"></script>
            <div style="margin-top: 5px;">
            </div>
            <script type="text/javascript" src="http://jahanads.com/index.php/javascript/site/3901?img=120_240"></script>
            <div style="margin-top: 5px;">
            </div>
            <script type="text/javascript" src="http://apanet.net/index.php/javascript/site/71?img=120_240"></script>
            <div style="margin-top: 5px;">
            </div>
            <script language="javascript" src="http://tabligheirani.com/showads.php?webid=aac365f9b7c5ac053a861093dcf0c125&s=3"></script>
        </div>
    </div>
</asp:Content>
