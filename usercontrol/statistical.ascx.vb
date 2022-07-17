
Partial Class usercontrol_statistical
    Inherits System.Web.UI.UserControl
    Dim classAndroid As New Android

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        lbl_getAllDownloadApp.Text = String.Format("کل دانلود: {0}", classAndroid.getAlldownloaded)
        lbl_getAllVisitApp.Text = String.Format("کل بازدید App ها: {0}", classAndroid.getVisitAllApp)
        lbl_getAllVisitWebsite.Text = String.Format("کل بازدید وبسایت: {0}", classAndroid.getVisitedWebsite)
        lbl_getAllCountApp.Text = String.Format("کل App ها: {0}", classAndroid.getCountBook)
        lbl_getAllCountGame.Text = String.Format("کل بازی ها: {0}", classAndroid.getCountAllProgram)
        lbl_getAllCountProgram.Text = String.Format("کل برنامه ها: {0}", classAndroid.getCountAllGame)

    End Sub

End Class
