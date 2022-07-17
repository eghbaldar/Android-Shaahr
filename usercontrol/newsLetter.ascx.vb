
Partial Class UserControl_newsLetter
    Inherits System.Web.UI.UserControl

    Dim classAndroid As New Newsletter

    Protected Sub btnNewsLetter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNewsLetter.Click

        If txtEmailNews.Text.Trim <> "Email...." Then
            If Not classAndroid.getValidEmailNewsletter(txtEmailNews.Text.Trim) Then
                classAndroid.InsertNewsLetter("کاربر", txtEmailNews.Text)
                MultiView.ActiveViewIndex = 1
                lblNewsLetter.Text = "پست الکترونیکی شما ثبت شده است."
            Else
                MultiView.ActiveViewIndex = 1
                lblNewsLetter.ForeColor = Drawing.Color.Red
                lblNewsLetter.Text = "این پست الکترونیکی قبلا به ثبت رسیده است."
            End If

        End If

    End Sub
End Class
