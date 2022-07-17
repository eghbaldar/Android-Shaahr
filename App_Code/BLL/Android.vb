Imports Microsoft.VisualBasic
Imports System.Data

Public Class Android

    Dim DS_Andr As New ds_androidTableAdapters.shaahr_AndroidTableAdapter
    Dim DS_Query As New ds_androidTableAdapters.Query
    Dim DS_Article As New ds_androidTableAdapters.shaahr_articleTableAdapter
    Dim DS_Req As New ds_androidTableAdapters.shaahr_ReuqestOrBuyTableAdapter
    Dim DS_Pic As New ds_androidTableAdapters.shaahr_PicturesTableAdapter
    Dim DS_AndroidWithCode As New ds_androidTableAdapters.shaahr_AndroidbyCodeTableAdapter
    Dim DS_DownVisit As New ds_androidTableAdapters.Shaahr_DownloadVisitTableAdapter
    Dim DS_Aware As New ds_androidTableAdapters.shaahr_awareTableAdapter
    Dim DS_Slide As New ds_androidTableAdapters.SlideMasterPageTableAdapter

    Public Function InsertAandr(Title As String, FileLink As String, FileDataLink As String, PicturePath As String, Details As String, show As Boolean, codeCat As Integer) As Boolean
        Try
            DS_Andr.Insert_Android(Title, 0, 0, FileLink, FileDataLink, PicturePath, Details, Date.Now, show, codeCat)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Sub UpdateDownload(code As Long)
        DS_Andr.UpdateDownload(code)
    End Sub

    Public Sub UpdateVisit(code As Long)
        DS_Andr.UpdateVisit(code)
    End Sub

    Public Sub UpdateVisitWebsite()
        DS_Query.UpdateVisiteWehbsite()
    End Sub

    Public Function getAlldownloaded() As String
        Return DS_Query.getAllDownload
    End Function

    Public Function getVisitedWebsite() As String
        Return DS_Query.getVisitedWebsite
    End Function

    Public Function getCountBook() As String
        Return DS_Query.getAllCountBook
    End Function

    Public Function getCountAllProgram() As String
        Return DS_Query.getCountAllProgram
    End Function

    Public Function getCountAllGame() As String
        Return DS_Query.getCountAllGame
    End Function

    Public Function getVisitAllApp() As String
        Return DS_Query.getVisitAllApps
    End Function

    Public Sub InsertArticle(title As String, text As String, show As Boolean)
        DS_Article.InsertQuery(title, text, show)
    End Sub

    Public Function getTextByID(id As Integer) As String
        Return DS_Article.getTextByID(id)
    End Function

    Public Sub UpdateText(text As String, id As Integer)
        DS_Article.UpdateText(text, id)
    End Sub

    Public Function getTitleArticle(id As Integer) As String
        Return DS_Article.getTitleArticle(id)
    End Function

    Public Sub UpdatePicturePath(pic As String, code As Integer)
        DS_Query.UpdatePicturePath(pic, code)
    End Sub

    Public Function UpdateCatByCode(cat As Integer, code As Integer)
        DS_Query.UpdateCatByCode(cat, code)
    End Function

    Public Sub InsertReq(name As String, email As String, phone As String, detail As String, link As String, price As String, type As Boolean)
        DS_Req.InsertQuery(name, email, phone, detail, link, price, type, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate) + "||" + Now.TimeOfDay.ToString.Substring(0, 8))
    End Sub

    Public Sub DeleteReq(code As Integer)
        DS_Req.DeleteQuery(code)
    End Sub

    Public Function InsertPicture(code As Long, filename As String) As Boolean
        DS_Pic.InsertPicture(code, filename)
        Return True
    End Function

    Public Function DeletePicture(id As Long) As Boolean
        DS_Pic.DeletePicture(id)
        Return True
    End Function

    Public Function GetLabel(code As Long) As String
        Return DS_Query.getTextLabel(code)
    End Function

    Public Function UpdateLabel(code As Long, label As String)
        DS_Query.UpdateLabel(code, label)
    End Function

    Public Function getDownload(code As Long) As String
        Return DS_Query.getCountDownloadByCode(code)
    End Function

    Public Function getVisit(code As Long) As String
        Return DS_Query.getCountVisitByCode(code)
    End Function

    Public Function getSmallDetails(code As Long) As String
        Return DS_Query.getSmallDetail(code)
    End Function

    Public Function UpdateSmallDetails(code As Long, details As String)
        DS_Query.UpdateSmallDetails(details, code)
        Return True
    End Function

    '/**********************/

    Public Function AndroidWithCode(code As Long) As DataRow
        Dim dt As DataTable = DS_AndroidWithCode.GetData(code)
        Return dt.Rows(0)
    End Function

    Public Function AndroidUpdate(ByVal Title As String, ByVal FileLink As String, ByVal FileDataLink As String, ByVal PicturePath As String, _
                                  ByVal Details As String, ByVal Show As Boolean, ByVal Code_Category As Integer, ByVal logo As String, ByVal googleRate As Integer, ByVal googleDownload As String, _
                                         ByVal BigDetails As String, ByVal Developers As String, ByVal Price As Integer, ByVal SizeFile As String, ByVal Language As Boolean _
                                         , ByVal Version As String, ByVal DetailNewVersion As String, ByVal code As Long, ByVal type As Boolean) As Boolean
        DS_AndroidWithCode.UpdateAndroid(Title, FileLink, FileDataLink, PicturePath, Details, Show, Code_Category, logo, googleRate, googleDownload, _
                                         BigDetails, Developers, Price, SizeFile, Language, Version, DetailNewVersion, type, code)
    End Function

    Public Function AndroidInsert(ByVal Title As String, ByVal FileLink As String, ByVal FileDataLink As String, ByVal PicturePath As String, _
                                  ByVal Details As String, ByVal Show As Boolean, ByVal Code_Category As Integer, ByVal logo As String, ByVal googleRate As Integer, ByVal googleDownload As String, _
                                         ByVal BigDetails As String, ByVal Developers As String, ByVal Price As Integer, ByVal SizeFile As String, ByVal Language As Boolean _
                                         , ByVal Version As String, ByVal DetailNewVersion As String, ByVal type As Boolean) As Boolean
        DS_AndroidWithCode.InsertAndroid(Title, 0, 0, FileLink, FileDataLink, PicturePath, Details, Date.Now, Show, Code_Category, _
                                         logo, googleRate, googleDownload, BigDetails, Developers, Price, SizeFile, Language, Version, DetailNewVersion, 0, type)
    End Function

    Public Function insertDownVisit(ByVal CodeAnd As Long, ByVal user_ip As String, ByVal type As Boolean) As Boolean
        DS_DownVisit.InsertDownloadVisit(CodeAnd, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), Now.TimeOfDay.ToString.Substring(0, 8), User_IP, Type)
    End Function

    Public Function getCodeCatbyCodeAnd(ByVal code As Long) As Long
        Return DS_Query.getCodeCatbyCodeAnd(code)
    End Function

    Public Function InsertAware(ByVal codeAnd As Long, ByVal Type As Byte, ByVal SmallDetail As String, ByVal email As String) As Boolean
        DS_Aware.InsertAware(codeAnd, Type, SmallDetail, email)
    End Function

    Public Function GetRateOfDownload(ByVal code As Long) As String
        Return DS_Query.sp_getRateOfDownload(code)
    End Function

    Public Function Slide() As DataTable

        Return DS_Slide.GetData()
        'Dim dt As DataTable = DS_Slide.GetData()
        'Select Case index
        '    Case 1
        '        Return dt.Rows(0)
        '    Case 2
        '        Return dt.Rows(1)
        '    Case 3
        '        Return dt.Rows(2)
        'End Select

    End Function

    Public Function getTitleByCode(ByVal code As Long) As String
        Return DS_Query.getTitleByCode(code)
    End Function

    Public Function UpdateVisitArticle(ByVal ID As Integer)
        DS_Article.UpdateVisitArticle(ID)
    End Function

    Public Function getShowApp(ByVal code As Long) As Boolean
        Return DS_Query.getShowApp(code)
    End Function

    Dim DS_metaTag As New ds_androidTableAdapters.MetaTagTableAdapter
    Public Function getMetaTag(ByVal code As Long) As String
        Dim Res As String
        Res += " <meta name=""Description"" content=""" + RemoveHtmlTags(DS_metaTag.GetData(code).Rows(0)(1).ToString) + """ />" & vbCrLf
        Res += "<meta name=""Keywords"" content=""" + DS_metaTag.GetData(code).Rows(0)(0).ToString + """ />" & vbCrLf
        Res += String.Format("<link rel=""canonical"" href=""{0}"" />" & vbCrLf, DS_metaTag.GetData(code).Rows(0)(2).ToString)
        Return Res
    End Function


    Public Shared Function RemoveHtmlTags(ByVal text As String) As String
        Return IIf(String.IsNullOrEmpty(text), String.Empty, Regex.Replace(text, "<(.|\n)*?>", String.Empty))
    End Function

End Class
