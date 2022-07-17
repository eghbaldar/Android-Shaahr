<%@ Control Language="VB" AutoEventWireup="false" CodeFile="SpecialApp.ascx.vb" Inherits="usercontrol_SpecialApp" %>
<%--<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="jquery.easing.min.js"></script>
<script type="text/javascript" src="jquery.easy-ticker.js"></script>--%>
<script type="text/javascript">
    $(document).ready(function () {

        var dd = $('.vticker').easyTicker({
            direction: 'up',
            easing: 'easeInOutBack',
            speed: 'slow',
            interval: 2000,
            height: 'auto',
            visible: 4,
            mousePause: 1,
            controls: {
                up: '.up',
                down: '.down',
                toggle: '.toggle',
                stopText: 'Stop !!!'
            }
        }).data('easyTicker');
        cc = 1;

    });
</script>
<asp:ScriptManager ID="ScriptManager1" runat="server">
    <CompositeScript>
        <Scripts>
            <asp:ScriptReference Path="~/jquery.min.js" />
            <asp:ScriptReference Path="~/jquery.easing.min.js" />
            <asp:ScriptReference Path="~/jquery.easy-ticker.js" />
        </Scripts>
    </CompositeScript>
</asp:ScriptManager>
<div class="ContextTops">
    <table>
        <tr>
            <td>
                <div class="SubContext">
                    <div class="titleBoxi">
                        نرم افزارهای کاربردی</div>
                    <div class="vticker">
                        <ul>
                            <asp:Repeater ID="Repeater_Application" runat="server" DataSourceID="SDS_Application">
                                <ItemTemplate>
                                    <div class="Post2">
                                        <li>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <a target="_blank" href='<%# ResolveUrl(Eval("code","~/post/{0}/") + Eval("title","{0}").ToString().Replace(" ", "-") + ".html") %>'
                                                            style="color: #115F6D; text-decoration: none; font-family: Tahoma; font-size: 11px;">
                                                            <asp:Image ID="ImageButton134" Style="cursor: pointer; -moz-border-radius: 8px; -webkit-border-radius: 8px;
                                                                border-radius: 8px; border-bottom: 1px solid #848484;" Width="40" Height="40"
                                                                ImageUrl='<%# getLogo(Eval("logo","{0}")) %>' runat="server" />
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <div style="height: 25px; padding: 2px; width: 250px;">
                                                            <a target="_blank" href='<%# ResolveUrl(Eval("code","~/post/{0}/") + Eval("title","{0}").ToString().Replace(" ", "-") + ".html") %>'>
                                                                <asp:Label Style="font-family: tahoma; font-size: 12px; color: #4C4C4C;" ID="TitleLabel"
                                                                    runat="server" Text='<%# getShortDetail(Eval("Title","{0}")) %>' />
                                                            </a>
                                                        </div>
                                                        <div style="background-color: White; padding: 1px; width: 50px; -moz-border-radius: 3px;
                                                            -webkit-border-radius: 3px; border-radius: 3px;">
                                                            <asp:Image ID="Image3" Height="10" Width="50" ImageUrl='<%# GetStar(DataBinder.Eval(Container.DataItem,"percentage")) %>'
                                                                runat="server" /></div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </li>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                        <asp:SqlDataSource ID="SDS_Application" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>"
                            SelectCommand="SELECT  Case when Count_Visit <> 0 then cast(round(((Count_Visit*1.0) /(select sum(Count_Visit) from tbl_shaahr_Android))*100,0) as int) end as 'percentage'  , a.code,a.title,a.Details,a.logo,a.Count_Visit FROM tbl_Shaahr_FunctionalApps f , [tbl_shaahr_android] a where f.codeandroid=a.code ">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="Show" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </td>
            <td>
                <div class="SubContext">
                    <div class="titleBoxi">
                        <asp:Label ID="lblDay" runat="server" Text="Label"></asp:Label></div>
                    <div class="vticker">
                        <ul>
                            <asp:Repeater ID="Repeater_special" runat="server" DataSourceID="SDS_Special">
                                <ItemTemplate>
                                    <div class="Post2">
                                        <li>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <a target="_blank" href='<%# ResolveUrl(Eval("code","~/post/{0}/") + Eval("title","{0}").ToString().Replace(" ", "-") + ".html") %>'
                                                            style="color: #115F6D; text-decoration: none; font-family: Tahoma; font-size: 11px;">
                                                            <asp:Image ID="ImageButton134" Style="cursor: pointer; -moz-border-radius: 8px; -webkit-border-radius: 8px;
                                                                border-radius: 8px; border-bottom: 1px solid #848484;" Width="40" Height="40"
                                                                ImageUrl='<%# getLogo(Eval("logo","{0}")) %>' runat="server" />
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <div style="height: 25px; padding: 2px; width: 250px;">
                                                            <a target="_blank" href='<%# ResolveUrl(Eval("code","~/post/{0}/") + Eval("title","{0}").ToString().Replace(" ", "-") + ".html") %>'>
                                                                <asp:Label Style="font-family: tahoma; font-size: 12px; color: #4C4C4C;" ID="TitleLabel"
                                                                    runat="server" Text='<%# getShortDetail(Eval("Title","{0}")) %>' />
                                                            </a>
                                                        </div>
                                                        <div style="background-color: White; padding: 1px; width: 50px; -moz-border-radius: 3px;
                                                            -webkit-border-radius: 3px; border-radius: 3px;">
                                                            <asp:Image ID="Image3" Height="10" Width="50" ImageUrl='<%# GetStar(DataBinder.Eval(Container.DataItem,"percentage")) %>'
                                                                runat="server" /></div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </li>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                        <asp:SqlDataSource ID="SDS_Special" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>"
                            SelectCommand="SELECT  Case when Count_Visit <> 0 then cast(round(((Count_Visit*1.0) /(select sum(Count_Visit) from tbl_shaahr_Android))*100,0) as int) end as 'percentage'  , a.code,a.title,a.Details,a.logo,a.Count_Visit FROM [tbl_Shaahr_SpecialApps] f , [tbl_shaahr_android] a where f.codeandroid=a.code and f.codeSpecialDay=(select [ID] from tbl_Shaahr_ListSpecialDays where flag=1) ">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="Show" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>
<style>
    .ContextTops
    {
        margin-bottom: 20px;
    }
    .SubContext
    {
        border: 1px solid #9E9E9E;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        background: #ffffff; /* Old browsers */
        background: -moz-linear-gradient(top, #ffffff 0%, #f1f1f1 50%, #e1e1e1 51%, #f6f6f6 100%); /* FF3.6+ */
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(50%,#f1f1f1), color-stop(51%,#e1e1e1), color-stop(100%,#f6f6f6)); /* Chrome,Safari4+ */
        background: -webkit-linear-gradient(top, #ffffff 0%,#f1f1f1 50%,#e1e1e1 51%,#f6f6f6 100%); /* Chrome10+,Safari5.1+ */
        background: -o-linear-gradient(top, #ffffff 0%,#f1f1f1 50%,#e1e1e1 51%,#f6f6f6 100%); /* Opera 11.10+ */
        background: -ms-linear-gradient(top, #ffffff 0%,#f1f1f1 50%,#e1e1e1 51%,#f6f6f6 100%); /* IE10+ */
        background: linear-gradient(to bottom, #ffffff 0%,#f1f1f1 50%,#e1e1e1 51%,#f6f6f6 100%); /* W3C */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=0 ); /* IE6-9 */
    }
    .titleBoxi
    {
        padding: 3px;
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        border-radius: 3px;
        width: 296px;
        height: 17px;
        padding-right: 7px;
        font: normal 15px koodakAnd;
        color: #0769AD;
    }
    .Post2:hover
    {
        border-right: 6px solid #9B9B9B;
    }
    .vticker
    {
        width: 303px;
        margin: 6px;
    }
    .vticker ul
    {
        padding: 0;
    }
    .vticker li
    {
        list-style: none;
    }
    .et-run
    {
        background: red;
    }
</style>
