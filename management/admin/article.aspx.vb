
Partial Class management_admin_article
    Inherits System.Web.UI.Page

    Dim classandroid As New Android

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Title = "مقاله"
    End Sub

    Protected Sub btn_Click(sender As Object, e As System.EventArgs) Handles btn.Click

        classandroid.InsertArticle(txttitle.Text, txtText.Value.ToString, True)

    End Sub

    Public Sub edit(sender As Object, e As CommandEventArgs)
        CodeEdit.Text = e.CommandArgument
        txtTextUpdate.Value = classandroid.getTextByID(e.CommandArgument)
    End Sub

    Protected Sub btnEdit_Click(sender As Object, e As System.EventArgs) Handles btnEdit.Click
        classandroid.UpdateText(txtTextUpdate.Value, CodeEdit.Text)
    End Sub
End Class
