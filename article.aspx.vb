
Partial Class article
    Inherits System.Web.UI.Page

    Dim ClassAndroid As New Android

    Public Function getShortDetail(ByVal title As Object) As String
        If title.ToString.Length > 45 Then
            Return title.ToString.Substring(0, 45) + "..."
        Else
            Return title.ToString
        End If
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim ArticleID As Integer
            ArticleID = Convert.ToInt64(Page.RouteData.Values("id").ToString())
            ClassAndroid.UpdateVisitArticle(ArticleID)
        Catch ex As Exception
        End Try
    End Sub

End Class
