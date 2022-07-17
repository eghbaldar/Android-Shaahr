
Partial Class management_admin_statistical
    Inherits System.Web.UI.Page
    Dim ClassEbook As New Android
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        lblWebsite.Text = ClassEbook.getVisitedWebsite
        lblDownloaded.Text = ClassEbook.getAlldownloaded
        Title = "آمار سایت"
    End Sub
End Class
