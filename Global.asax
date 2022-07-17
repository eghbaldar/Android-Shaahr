
<%@ Application Language="VB" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.Web.Routing.Route" %>
<%@ Import Namespace="System.Web" %>
<script runat="server">

    
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub
    
    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        RegisterRoutes(RouteTable.Routes)
    End Sub

    Shared Sub RegisterRoutes(routes As RouteCollection)
        routes.MapPageRoute("Post", "Post/{Code}/{title}", "~/post.aspx")
        routes.MapPageRoute("Default", "", "~/Default.aspx")
        routes.MapPageRoute("Article", "Article/{id}/{title}", "~/article.aspx")
        routes.MapPageRoute("feed", "feed/", "~/rss.aspx")
    End Sub
       
</script>