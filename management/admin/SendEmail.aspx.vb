
Partial Class management_admin_SendEmail
    Inherits System.Web.UI.Page

    Dim em As New mail

    Protected Sub btnPre_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPre.Click
        lblEmail.Text = txtEmailTo.Text
        lblSubject.Text = txtSubject.Text
        lblText.InnerHtml = txtText.Value.ToString
        MultiView.ActiveViewIndex = 1
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        em.SentMail(lblEmail.Text, lblSubject.Text, lblText.InnerHtml)
        MultiView.ActiveViewIndex = 2
    End Sub

End Class
