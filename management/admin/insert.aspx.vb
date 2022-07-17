
Partial Class management_admin_insert
    Inherits System.Web.UI.Page

    Dim ClassAnd As New Android

    Protected Sub btnInsert_Click(sender As Object, e As System.EventArgs) Handles btnInsert.Click

        '/********************* Picture ****************/
        Dim Rnd As New Random
        Dim Filename As String = Rnd.Next(1, 1000).ToString + "-" + Guid.NewGuid().ToString().Replace("-", "")
        Dim FileInfo As System.IO.FileInfo
        Dim FilePic As String = ""
        If FileUpload.FileName <> "" Then
            FileInfo = New System.IO.FileInfo(FileUpload.FileName)
            FileUpload.SaveAs(MapPath("~\management\images\" + Filename + FileInfo.Extension))
            FilePic = Filename + FileInfo.Extension
        End If
        '/******************** Logo *****************/
        Dim RndLogo As New Random
        Dim FilenameLogo As String = RndLogo.Next(1, 1000).ToString + "-" + Guid.NewGuid().ToString().Replace("-", "")
        Dim FileInfoLogo As System.IO.FileInfo
        Dim FilePicLogo As String = ""
        If FileUploadLogo.FileName <> "" Then
            FileInfoLogo = New System.IO.FileInfo(FileUploadLogo.FileName)
            FileUploadLogo.SaveAs(MapPath("~\management\images\logo\" + FilenameLogo + FileInfoLogo.Extension))
            FilePicLogo = FilenameLogo + FileInfoLogo.Extension
        Else
            FilePicLogo = ""
        End If
        '/******************* Show ********************/
        Dim R As Boolean
        If rb_Show.Items(0).Selected Then R = True
        If rb_Show.Items(1).Selected Then R = False
        '/******************* Language ********************/
        Dim L As Boolean
        If cmbLanguage.Items(0).Selected Then L = True
        If cmbLanguage.Items(1).Selected Then L = False
        '/******************* Google Rate ********************/
        'Dim G As Byte
        'If rblGoogle.Items(0).Selected Then G = 1
        'If rblGoogle.Items(1).Selected Then G = 2
        'If rblGoogle.Items(2).Selected Then G = 3
        'If rblGoogle.Items(3).Selected Then G = 4
        'If rblGoogle.Items(4).Selected Then G = 5
        'If rblGoogle.Items(0).Selected Then G = 1
        'If rblGoogle.Items(1).Selected Then G = 2
        'If rblGoogle.Items(2).Selected Then G = 3
        'If rblGoogle.Items(3).Selected Then G = 4
        'If rblGoogle.Items(4).Selected Then G = 5
        'If rblGoogle.Items(0).Selected Then G = 1
        'If rblGoogle.Items(1).Selected Then G = 2
        'If rblGoogle.Items(2).Selected Then G = 3
        'If rblGoogle.Items(3).Selected Then G = 4
        'If rblGoogle.Items(4).Selected Then G = 5
        'If rblGoogle.Items(0).Selected Then G = 1
        'If rblGoogle.Items(1).Selected Then G = 2
        'If rblGoogle.Items(2).Selected Then G = 3
        'If rblGoogle.Items(3).Selected Then G = 4
        'If rblGoogle.Items(4).Selected Then G = 5
        '/******************* Typee ********************/
        Dim T As Boolean
        If rbType.Items(0).Selected Then T = True
        If rbType.Items(1).Selected Then T = False


        ClassAnd.AndroidInsert(txtName.Text, txtFileLink.Text, txtFileDataLink.Text, FilePic, txtDetailSmall.Value, _
                               R, lblCatCode.Text, FilePicLogo, Val(rblGoogle.SelectedValue), txtGoogleDownload.Text, _
                                txtDetailBig.Value, txtCompany.Value, txtPrice.Text, txtSize.Text, L, txtVersion.Text, txtNewVersion.Value, T)
        MultiView.ActiveViewIndex = 1

    End Sub

    Protected Sub Drp_program_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles Drp_program.SelectedIndexChanged
        lblCatCode.Text = Drp_program.SelectedValue
    End Sub
    Protected Sub Drg_Game_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles Drg_Game.SelectedIndexChanged
        lblCatCode.Text = Drg_Game.SelectedValue
    End Sub

    Protected Sub r_program_CheckedChanged(sender As Object, e As System.EventArgs) Handles r_program.CheckedChanged
        If r_program.Checked = True Then
            Drg_Game.Enabled = False
            Drp_program.Enabled = True
            r_game.Checked = False
        End If
    End Sub

    Protected Sub r_game_CheckedChanged(sender As Object, e As System.EventArgs) Handles r_game.CheckedChanged
        If r_game.Checked = True Then
            Drg_Game.Enabled = True
            Drp_program.Enabled = False
            r_program.Checked = False
        End If
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click

        dgSearch.DataBind()
        If dgSearch.Rows.Count > 0 Then
            btnBegging.BackColor = Drawing.Color.Red
            btnBegging.ForeColor = Drawing.Color.White
            btnBegging.Visible = True
            btnBegging.Text = "نرم افزارهایی با این نام دیده می شوند لطفا در درج جدید بررسی لازم را به عمل بیاورید"
        Else
            btnBegging.BackColor = Drawing.Color.Green
            btnBegging.ForeColor = Drawing.Color.White
            btnBegging.Visible = True
            btnBegging.Text = "نرم افزاری با این نام وجود ندارد"
        End If

    End Sub

    Protected Sub btnBegging_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBegging.Click
        Response.Redirect("insert.aspx?auth=true")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("auth") = "true" Then
            PanelAuthentic.Visible = True
            PanelPreInsert.Visible = False
        End If
    End Sub
End Class
