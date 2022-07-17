<%@ Control Language="VB" AutoEventWireup="false" CodeFile="article.ascx.vb" Inherits="usercontrol_article" %>
<div id="subArticle">
    <div id="titleArticle">
        مقالات آندرویدی</div>
    <div>
        <asp:GridView ID="dgArtcile" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_Article"
            Width="209px" GridLines="None" ShowHeader="False">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" Visible="False" />
                <asp:TemplateField HeaderText="title" SortExpression="title">
                    <ItemTemplate>
                        <div class="articleSub">
                            <a target="_blank" href='<%# ResolveUrl(Eval("id","~/article/{0}/") + Eval("title","{0}").ToString().Replace(" ", "-") + ".html") %>'
                                style="color: #115F6D; text-decoration: none; font-family: Tahoma; font-size: 11px;">
                                <asp:Label ID="Label1" runat="server" Text='<%# getShortDetail(Eval("Title","{0}")) %>'></asp:Label>
                            </a>
                              
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="text" HeaderText="text" SortExpression="text" Visible="False" />
                <asp:CheckBoxField DataField="show" HeaderText="show" SortExpression="show" Visible="False" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ODS_Article" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="ds_androidTableAdapters.shaahr_articleTableAdapter">
            <InsertParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="text" Type="String" />
                <asp:Parameter Name="show" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </div>
</div>
<style type="text/css">
    #titleArticle
    {
        font-family: koodakAnd;
        font-size: 14px;
        color: #0B505D;
        background-color:#44B0C5;
        padding:6px;
        width:195px;
        color:#FFFFFF;
    }
    #subArticle
    {
        margin-top: 2px;
        padding: 3px;
        -moz-border-radius: 6px;
        -webkit-border-radius: 6px;
        border-radius: 6px;
    }
    .articleSub
    {
        margin: 1px;
        padding: 5px;
        background-color: #F0F7F8;
        border-right: 3px solid #489AC9;
    }
    .articleSub:hover
    {
         border-right: 6px solid #FFC200;
         height:25px;
         color:#F18322;
         font-family:koodakAnd;         
    }
</style>
