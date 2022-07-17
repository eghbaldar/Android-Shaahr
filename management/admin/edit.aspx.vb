
Partial Class management_admin_edit
    Inherits System.Web.UI.Page

    Dim ClassAnd As New Android

    Public Sub edit_(sender As Object, e As CommandEventArgs)



        lblCode.Text = e.CommandArgument

        txtName.Text = ClassAnd.AndroidWithCode(e.CommandArgument).Item("title")

        hypLinkCuurent.Text = ClassAnd.AndroidWithCode(e.CommandArgument).Item("filelink")
        hypLinkCuurent.NavigateUrl = ClassAnd.AndroidWithCode(e.CommandArgument).Item("filelink")

        txtFileLink.Text = ClassAnd.AndroidWithCode(e.CommandArgument).Item("filelink")

        hypLinkDataCuurent.Text = ClassAnd.AndroidWithCode(e.CommandArgument).Item("filedatalink")
        hypLinkDataCuurent.NavigateUrl = ClassAnd.AndroidWithCode(e.CommandArgument).Item("filedatalink")

        txtFileDataLink.Text = ClassAnd.AndroidWithCode(e.CommandArgument).Item("filedatalink")

        txtDetailSmall.Value = ClassAnd.AndroidWithCode(e.CommandArgument).Item("details")
        txtDetailBig.Value = ClassAnd.AndroidWithCode(e.CommandArgument).Item("bigdetails")

        hypPicture.NavigateUrl = "~\management\images\" + ClassAnd.AndroidWithCode(e.CommandArgument).Item("picturepath")

        lblPicture.Text = ClassAnd.AndroidWithCode(e.CommandArgument).Item("picturepath")

        lblCat.Text = getName(ClassAnd.AndroidWithCode(e.CommandArgument).Item("code_category"))
        lblCatCode.Text = ClassAnd.AndroidWithCode(e.CommandArgument).Item("code_category")

        If ClassAnd.AndroidWithCode(e.CommandArgument).Item("logo").ToString.Trim = "" Then
            imgLogo.ImageUrl = "http://shaahr.com/logo_shaahr.png"
        Else
            imgLogo.ImageUrl = "~\management\images\logo\" + ClassAnd.AndroidWithCode(e.CommandArgument).Item("logo")
        End If

        lblLogo.Text = ClassAnd.AndroidWithCode(e.CommandArgument).Item("logo").ToString.Trim



        Try

            If Val(ClassAnd.AndroidWithCode(e.CommandArgument).Item("googlerate")) <> 0 Then
                rblGoogle.Items(Val(ClassAnd.AndroidWithCode(e.CommandArgument).Item("googlerate")) - 1).Selected = True
            Else
                rblGoogle.ClearSelection()
            End If

        Catch ex As Exception
        End Try

        txtGoogleDownload.Text = ClassAnd.AndroidWithCode(e.CommandArgument).Item("googledownload")

        txtCompany.Value = ClassAnd.AndroidWithCode(e.CommandArgument).Item("developers")

        txtPrice.Text = ClassAnd.AndroidWithCode(e.CommandArgument).Item("price")

        lblCountBuy.Text = ClassAnd.AndroidWithCode(e.CommandArgument).Item("countbuy")

        txtSize.Text = ClassAnd.AndroidWithCode(e.CommandArgument).Item("sizefile")

        Select Case Convert.ToBoolean(ClassAnd.AndroidWithCode(e.CommandArgument).Item("language"))
            Case True
                cmbLanguage.SelectedIndex = 0
            Case False
                cmbLanguage.SelectedIndex = 1
        End Select

        txtVersion.Text = ClassAnd.AndroidWithCode(e.CommandArgument).Item("version")

        txtNewVersion.Value = ClassAnd.AndroidWithCode(e.CommandArgument).Item("detailnewversion")

        Select Case Convert.ToBoolean(ClassAnd.AndroidWithCode(e.CommandArgument).Item("show"))
            Case True
                rb_Show.SelectedIndex = 0
            Case False
                rb_Show.SelectedIndex = 1
        End Select

        Select Case Convert.ToBoolean(ClassAnd.AndroidWithCode(e.CommandArgument).Item("type"))
            Case True
                rbType.SelectedIndex = 0
            Case False
                rbType.SelectedIndex = 1
        End Select



    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As System.EventArgs) Handles btnUpdate.Click

        '/********************* Picture ****************/
        Dim Rnd As New Random
        Dim Filename As String = Rnd.Next(1, 1000).ToString + "-" + Guid.NewGuid().ToString().Replace("-", "")
        Dim FileInfo As System.IO.FileInfo
        Dim FilePic As String = ""
        If FileUpload.FileName <> "" Then
            FileInfo = New System.IO.FileInfo(FileUpload.FileName)
            FileUpload.SaveAs(MapPath("~\management\images\" + Filename + FileInfo.Extension))
            FilePic = Filename + FileInfo.Extension
        Else
            FilePic = lblPicture.Text
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
        ElseIf imgLogo.ImageUrl <> "" Then
            FilePicLogo = lblLogo.Text
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
        ''/******************* Typee ********************/
        Dim T As Boolean
        If rbType.Items(0).Selected Then T = True
        If rbType.Items(1).Selected Then T = False

        ClassAnd.AndroidUpdate(txtName.Text, txtFileLink.Text, txtFileDataLink.Text, FilePic, txtDetailSmall.Value, R, Val(lblCatCode.Text), FilePicLogo, Val(rblGoogle.SelectedValue), _
                                txtGoogleDownload.Text, txtDetailBig.Value, txtCompany.Value, _
                             Val(txtPrice.Text), txtSize.Text, L, txtVersion.Text, txtNewVersion.Value, Val(lblCode.Text), T)

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

    Private Function getName(code As String) As String

        Select Case Val(code)
            Case "1"
                Return "ارتباطی"
            Case "2"
                Return "ابزار"
            Case "3"
                Return "همراه بانک"
            Case "4"
                Return "سخنگو"
            Case "5"
                Return "آنتی ویروس"
            Case "6"
                Return "خبری و اطلاع رسانی"
            Case "7"
                Return "انواع کتاب"
            Case "8"
                Return "نرم افزارهای فارسی"
            Case "9"
                Return "آموزشی"
            Case "10"
                Return "امنیتی"
            Case "11"
                Return "اینترنتی"
            Case "12"
                Return "آب و هوا"
            Case "13"
                Return "آموزشی و مهندسی"
            Case "14"
                Return "تقویم"
            Case "15"
                Return "فرهنگ لغات"
            Case "16"
                Return "سرگرمی"
            Case "17"
                Return "هنری"
            Case "18"
                Return "ورزشی"
            Case "19"
                Return "سیستمی"
            Case "20"
                Return "عکس ، تصویر و مدیا"
            Case "21"
                Return "مذهبی"
            Case "22"
                Return "مکان یابی"
            Case "23"
                Return "مسنجر و چت"
            Case "24"
                Return "نوشتاری ، خواندنی و آفیس"
            Case "25"
                Return "پزشکی ، بهداشت"
            Case "26"
                Return "متفرقه"
            Case "27"
                Return "استراتژی"
            Case "28"
                Return "بازی سه بعدی"
            Case "29"
                Return "بازی HD"
            Case "30"
                Return "ترستانک"
            Case "31"
                Return "رکوردزنی"
            Case "32"
                Return "هیجان انگیز"
            Case "33"
                Return "شتاب سنج"
            Case "34"
                Return "نشانه گیری"
            Case "35"
                Return "اکشن"
            Case "36"
                Return "تیر اندازی"
            Case "37"
                Return "رزمی"
            Case "38"
                Return "فکری و پازل"
            Case "39"
                Return "کارتی"
            Case "40"
                Return "کلاسیک"
            Case "41"
                Return "ماجرایی"
            Case "42"
                Return "مسابقه ای"
            Case "43"
                Return "ورزشی"
            Case "44"
                Return "شبیه ساز"
            Case "45"
                Return "متفرقه"

        End Select


    End Function

    Protected Sub Drp_program_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles Drp_program.SelectedIndexChanged
        lblCatCode.Text = Drp_program.SelectedValue
    End Sub
    Protected Sub Drg_Game_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles Drg_Game.SelectedIndexChanged
        lblCatCode.Text = Drg_Game.SelectedValue
    End Sub

    Public Function getImgLogo(logo As Object) As String
        If logo.ToString.Trim = "" Then
            Return "http://shaahr.com/logo_shaahr.png"
        Else
            Return "~\management\images\logo\" + logo
        End If
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

End Class
