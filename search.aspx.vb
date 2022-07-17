
Partial Class search
    Inherits System.Web.UI.Page

    Public Sub Redirect2(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim Res As String() = e.CommandArgument.ToString.Split("|")
        Response.Redirect("Post/" + Res(0).Trim() + "/" + Res(1).Trim.Replace(" ", "-").Trim() + ".html")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "جستجوی برنامه و بازی..."
    End Sub

End Class
