<%@ Control Language="VB" AutoEventWireup="false" CodeFile="bestApp.ascx.vb" Inherits="usercontrol_bestApp" %>

<div class="titleArticle">
    بهترین App ها</div>
<div>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SDS_Best2" RepeatDirection="Horizontal"
        Width="207px" RepeatColumns="1">
        <ItemTemplate>
            <div class="Post">
                <table>
                    <tr>
                        <td>
                            <a href='<%# ResolveUrl(Eval("code","~/post/{0}/") + Eval("title","{0}").ToString().Replace(" ", "-") + ".html") %>'
                                style="color: #115F6D; text-decoration: none; font-family: Tahoma; font-size: 11px;">
                                <asp:Image ID="ImageButton1" Style="cursor: pointer; -moz-border-radius: 8px; -webkit-border-radius: 8px;
                                    border-radius: 8px; border-bottom: 1px solid #848484;" ImageUrl='<%# getLogo(Eval("logo","{0}")) %>'
                                    runat="server" Width="70" Height="70" />
                            </a>
                        </td>
                        <td>
                            <div style="height: 45px; padding: 2px; width: 120px;">
                                <asp:Label Style="font-family: tahoma; font-size: 12px;" ID="TitleLabel" runat="server"
                                    Text='<%# getShortDetail(Eval("Title","{0}")) %>' /></div>
                            <div>
                                <asp:Image ID="Image3" Height="15" Width="78" ImageUrl='<%# GetStar(DataBinder.Eval(Container.DataItem,"percentage")) %>'
                                    runat="server" /></div>
                        </td>
                    </tr>
                </table>
            </div>
        </ItemTemplate>
    </asp:DataList>
</div>
<asp:SqlDataSource ID="SDS_Best2" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>"
    SelectCommand="SELECT top 20 * , Case when Count_Visit <> 0 then cast(round(((Count_Visit*1.0) /(select sum(Count_Visit) from tbl_shaahr_Android))*100,0) as int) end as 'percentage'  FROM [tbl_shaahr_Android] WHERE ([Show] = @Show) ORDER BY [Count_Visit] DESC">
    <SelectParameters>
        <asp:Parameter DefaultValue="true" Name="Show" Type="Boolean" />
    </SelectParameters>
</asp:SqlDataSource>
<style>
    .titleArticle
    {
        font-family: koodakAnd;
        font-size: 14px;
        color: #0B505D;
        background-color: #9E9E9E;
        padding: 6px;
        width: 195px;
        color: #FFFFFF;
    }
    .Post
    {
        background-color: #f4f4f4;
        margin-bottom: 2px;
        border-right: 3px solid #9E9E9E;
        margin-top: 1px;
    }
    .Post:hover
    {
        border-right: 6px solid #44B0C5;
    }
</style>
