
Partial Class Master
    Inherits System.Web.UI.MasterPage

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        If txtSearch.Text <> "جستجو برنامه و بازی ها..." Then
            If Request.QueryString("cat") <> "" Then
                Response.Redirect("~\search.aspx?search=" + txtSearch.Text + "&cat=" + Request.QueryString("cat"))
            Else
                Response.Redirect("~\search.aspx?search=" + txtSearch.Text)
            End If
        Else
            Response.Redirect("~\")
        End If
    End Sub
End Class

