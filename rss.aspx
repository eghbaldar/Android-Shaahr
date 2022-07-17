<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rss.aspx.vb" ContentType="text/xml"
    Inherits="rss" %>

<asp:repeater id="RepeaterRSS" runat="server">
            <HeaderTemplate>
                <rss version="2.0">  
                    <channel>  
                                <title>Shaahroid.ir / Android.shaahr.com / شهر اندروید / شهروید</title>  
                                <link>http://android.shaahr.com</link>  
                                <description>  
                                این صفحه نشان دهنده فید وبسایت شهروید می باشد.
                                </description>
          
            </HeaderTemplate>
            <ItemTemplate>
                <item>  


                <title> <%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Title")) %>  </title>  
                                
                <link> <%# RemoveIllegalCharacters(String.Format("http://android.shaahr.com/Post/{0}/{1}.html", Eval("code"), Eval("Title")))%>  </link> 

        

                <description> <%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "details")) %>  </description>  
                

               <%--<image>
                 <url>  <%# RemoveIllegalCharacters(String.Format("http://android.shaahr.com/management/images/{0}",Eval("picturepath")))%></url>
                <title><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Title")) %></title>
                <link> <%# RemoveIllegalCharacters(string.Format("http://android.shaahr.com/Post/{0}/{1}.html",Eval("code"),Eval("Title"))) %> </link>
                <width>90</width>
<height>114</height> 
              </image>  
              --%>
                
              

                <pubDate> <%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "date"))%></pubDate>

        </item>
            </ItemTemplate>
            <FooterTemplate>
                </channel> </rss>
            </FooterTemplate>
        </asp:repeater>
