<%@ Page Title="" Language="VB" MasterPageFile="~/MasterOther.master" AutoEventWireup="false"
    CodeFile="article.aspx.vb" Inherits="article" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: 'koodakAnd';
            src: url(      '../../content/font/W_koodak.eot' );
            src: url(      '../../content/font/W_koodak.eot?#iefix' ) format(      'embedded-opentype' ), url('../../content/font/W_koodak.woff' ) format(      'woff' ), url('../../content/font/W_koodak.TTF' ) format(      'truetype' );
        }
        .article
        {
            line-height: 1.8em;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            box-shadow: 1px 2px 6px 3px #BDBDBD;
            width: 710px;
            padding: 10px;
            margin-top: 20px;
            margin-bottom: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div style="float: right; width: 300px;">
            <span style="font-family: koodakAnd; font-size: 12px;">مقالات آندرویدی </span>
            <asp:GridView ID="dgArtcile" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_Article"
                Width="290px" GridLines="None" ShowHeader="False">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                        SortExpression="id" Visible="False" />
                    <asp:TemplateField HeaderText="title" SortExpression="title">
                        <ItemTemplate>
                            <div style="margin: 2px; padding: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                                border-radius: 5px; background-color: #F0F7F8; border-right: 3px solid #489AC9;">
                                <a href='<%# ResolveUrl(Eval("id","~/article/{0}/") + Eval("title","{0}").ToString().Replace(" ", "-") + ".html") %>'
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
        <div style="float: right; width: 724px;">
            <div style="text-align: center; background-color: #f1f1f1; padding: 5px;" id="divAds">
                <div style="text-align: right; cursor: pointer; color: #414141; font-size: 15px;"
                    onclick="document.getElementById('divAds').style.display = 'none';">
                    ×</div>
                <div>
                    <a href="http://software.shaahr.com" target="_blank">
                        <img src='<%= ResolveUrl("~/content/software.gif") %>' border="0" style="border: 5px;" /></a>
                    <a href="http://estekhdami.shaahr.com/" target="_blank">
                        <img src='<%= ResolveUrl("~/content/estekhdami2.gif") %>' style="margin-top: 5px; -moz-border-radius: 5px;
                            -webkit-border-radius: 5px; border-radius: 5px; border: 1px solid #EFEFEF;" />
                    </a>
                </div>
            </div>
            <div>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="715px">
                    <ItemTemplate>
                        <div class="article">
                            <div>
                                <h1>
                                    <asp:Label Style="font-family: koodakAnd; font-size: 20px;" ID="titleLabel" runat="server"
                                        Text='<%# Eval("title") %>' />
                                </h1>
                            </div>
                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            <img src="../../content/images/downUsers.png" />
                                        </td>
                                        <td>
                                            /
                                        </td>
                                        <td>
                                            <asp:Label Style="font-family: koodakAnd; font-size: 12px; color: #227D90;" ID="Label2"
                                                runat="server" Text='<%# Eval("visit","{0}") %>' />
                            </div>
                            </td> </tr> </table>
                            <div>
                                <asp:Label ID="textLabel" runat="server" Text='<%# Eval("text") %>' /></div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrAndroidConnectionString %>"
                    SelectCommand="SELECT * FROM [tbl_shaahr_article] WHERE ([id] = @id)">
                    <SelectParameters>
                        <%--<asp:QueryStringParameter Name="id" QueryStringField="cd" Type="Int32" />--%>
                        <asp:RouteParameter Name="id" RouteKey="id" Type="Int32" DefaultValue="" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
