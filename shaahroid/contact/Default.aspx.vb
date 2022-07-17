
Partial Class shaahroid_contact_Default
    Inherits System.Web.UI.Page

    Dim ClassMyShaahr As New MyShaahr

    Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSend.Click

        ClassMyShaahr.InsertCMSContact(txtFnLn.Text, txtEmail.Text, txtTell.Text, cmbGroup.Text, txtCuase.Text, Request.UserHostAddress)
        MultiView1.ActiveViewIndex = 1

    End Sub

End Class
