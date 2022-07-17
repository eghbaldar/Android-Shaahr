<%@ Page Title="" Language="VB" MasterPageFile="~/MasterOther.master" AutoEventWireup="false"
    CodeFile="search.aspx.vb" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: 'koodakAnd';
            src: url(      'content/font/W_koodak.eot' );
            src: url(      'content/font/W_koodak.eot?#iefix' ) format(      'embedded-opentype' ), url('content/font/W_koodak.woff' ) format(      'woff' ), url('content/font/W_koodak.TTF' ) format(      'truetype' );
        }
    </style>
    <script>
        function borderIn(e) {
            document.getElementById(e).style.boxShadow = '2px 2px 2px #ccc';

        }
        function borderOut(e) {
            document.getElementById(e).style.boxShadow = '0px 0px 0px #ccc';
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div style="float: right;">
            <div style="font-family: koodakAnd; font-size: 18px; padding-right: 5px; margin-bottom: 8px;">
                نتیجه جستجو</div>
            <div style="padding: 5px; background-color: White;
                width: 220px;">
                <asp:DataList ID="DataList1" runat="server" DataSourceID="ODS" RepeatDirection="Horizontal"
                    RepeatColumns="1">
                    <ItemTemplate>
                        <div>
                            <div style="float: right;">
                                <asp:LinkButton ID="LinkButton2"
                                style="text-decoration:none;color:Black;"
                                 OnCommand="Redirect2" CommandArgument='<%#  Eval("code","{0}") + "|" + Eval("title","{0}") + "|" + Eval("code_category","{0}") %>'
                                    runat="server">
                                  
                                        <asp:Label ID="Label1" runat="server" Style="font-family: Tahoma; font-size: 11px;"
                                            Text='<%# Eval("title", "{0}") %>'></asp:Label>
                                    
                                </asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
        <div style="float: right;">
            <div style="font-family: koodakAnd; font-size: 18px; color: #860000; margin-bottom: 2px;
                margin-top: 2px;">
                نتیجه جستجو</div>
            <asp:DataList ID="DL_Other" runat="server" DataSourceID="ODS" RepeatDirection="Horizontal"
                RepeatColumns="3">
                <ItemTemplate>
                    <div style="float: right; width: 220px; height: 200px; margin: 2px; -moz-border-radius: 8px;
                        -webkit-border-radius: 8px; border-radius: 8px;" id='<%# Eval("code", "{0}") %>'
                        onmouseout="borderOut(this.id);" onmousemove="borderIn(this.id);">
                        <div style="float: right;">
                            <asp:LinkButton ID="LinkButton2" OnCommand="Redirect2" CommandArgument='<%#  Eval("code","{0}") + "|" + Eval("title","{0}") + "|" + Eval("code_category","{0}") %>'
                                runat="server">
                                                
                                    <img src='<%# "Crop.aspx?P="+ Eval("PicturePath", "{0}") +"&W=222&H=157" %>' style="height: 155px;
                                        width: 219px; -moz-border-radius: 8px; -webkit-border-radius: 8px; border-radius: 8px;
                                        border-bottom: 1px solid #848484;" id='<%# "img_"+Eval("code", "{0}") %>' />


                            </asp:LinkButton>
                        </div>
                        <div style="float: right; padding-right: 4px; font-family: Tahoma; font-size: 11px;
                            text-decoration: none; text-align: center; width: 193px; margin-bottom: 50px;">
                            <asp:LinkButton ID="LinkButton3" OnCommand="Redirect2" ForeColor="Black" Font-Underline="false"
                                CommandArgument='<%#  Eval("code","{0}") + "|" + Eval("title","{0}") + "|" + Eval("code_category","{0}") %>'
                                runat="server">
                                <asp:Literal ID="Literal1" runat="server" Text='<%# Bind("title") %>'></asp:Literal>
                            </asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:ObjectDataSource ID="ODS" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="ds_androidTableAdapters.sp_AndroidTableAdapter">
                <SelectParameters>
                    <asp:QueryStringParameter Name="search" QueryStringField="search" Type="String" />
                    <asp:QueryStringParameter Name="Cat" QueryStringField="cat" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
