
Partial Class management_admin_newsLetter
    Inherits System.Web.UI.Page

    Dim Email_ As New mail
    Dim ClassLetter As New Newsletter

    Protected Sub btn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn.Click
        Email_.MailContentNewsLetter()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblCount.Text = ClassLetter.getCountUsersNewsletter
    End Sub

    Protected Sub chk_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chk.CheckedChanged
        If chk.Checked Then DG.Visible = True
        If Not chk.Checked Then DG.Visible = Not True
    End Sub
End Class
