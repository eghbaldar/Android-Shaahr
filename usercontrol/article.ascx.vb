
Partial Class usercontrol_article
    Inherits System.Web.UI.UserControl

    Public Function getShortDetail(ByVal title As Object) As String
        If title.ToString.Length > 35 Then
            Return title.ToString.Substring(0, 30) + "..."
        Else
            Return title.ToString
        End If
    End Function

End Class
