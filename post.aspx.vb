
Partial Class Default2
    Inherits System.Web.UI.Page
    Dim ClassAndroid As New Android

    Public Sub Download(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim s As String() = e.CommandArgument.ToString.Split("|")
        ClassAndroid.insertDownVisit(s(1), Request.UserHostAddress, True)
        ClassAndroid.UpdateDownload(s(1))
        Response.Redirect(s(0))

    End Sub

    Public Function GetStar(ByVal p As Object) As String

        Dim Num As Integer = Val(p.ToString) * 15

        Select Case Num
            Case 0
                Return "~/content/images/star/star_0.jpg"
            Case 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
                Return "~/content/images/star/star_0-5.jpg"
            Case 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
                Return "~/content/images/star/star_1.jpg"
            Case 21, 22, 23, 24, 25, 26, 27, 28, 29, 30
                Return "~/content/images/star/star_1-5.jpg"
            Case 31, 32, 33, 34, 35, 36, 37, 38, 39, 40
                Return "~/content/images/star/star_2.jpg"
            Case 41, 42, 43, 44, 45, 46, 47, 48, 49, 50
                Return "~/content/images/star/star_2-5.jpg"
            Case 51, 52, 53, 54, 55, 56, 57, 58, 59, 60
                Return "~/content/images/star/star_3.jpg"
            Case 61, 62, 63, 64, 65, 66, 67, 68, 69, 70
                Return "~/content/images/star/star_3-5.jpg"
            Case 71, 72, 73, 74, 75, 76, 77, 78, 79, 80
                Return "~/content/images/star/star_4.jpg"
            Case 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99
                Return "~/content/images/star/star_4-5.jpg"
            Case Is >= 100
                Return "~/content/images/star/star_5.jpg"

        End Select
    End Function
    Public Function GetStar2(ByVal p As Object) As String

        Dim Num As Byte = Val(p.ToString)

        Select Case Num
            Case 1
                Return "~/content/images/star2/rating_1.gif"
            Case 2
                Return "~/content/images/star2/rating_1-5.gif"
            Case 3
                Return "~/content/images/star2/rating_2.gif"
            Case 4
                Return "~/content/images/star2/rating_2-5.gif"
            Case 5
                Return "~/content/images/star2/rating_3.gif"
            Case 6
                Return "~/content/images/star2/rating_3-5.gif"
            Case 7
                Return "~/content/images/star2/rating_4.gif"
            Case 8
                Return "~/content/images/star2/rating_4-5.gif"
            Case 9
                Return "~/content/images/star2/rating_5.gif"
        End Select
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim PostID As Integer

        'Try

        PostID = Convert.ToInt64(Page.RouteData.Values("code").ToString())
        '--Comment
        ucComments1.PostID = PostID
        ucComments1.ShowComment = True
        ucComments1.ShowContent()
        '--MetaTag
        litMetaTag.Text = Server.HtmlDecode(ClassAndroid.getMetaTag(PostID))

        If Not ClassAndroid.getShowApp(PostID) Then
            DivPost.Visible = False
            DivEmpty.Visible = True
        End If

        Title = ClassAndroid.getTitleByCode(PostID)

        If Not IsPostBack Then ClassAndroid.insertDownVisit(Page.RouteData.Values("code"), Request.UserHostAddress, False)

        lblOrgCode.Text = Page.RouteData.Values("code").ToString()

        lblOrgCodeCat.Text = ClassAndroid.getCodeCatbyCodeAnd(lblOrgCode.Text)

        If Not IsPostBack Then ClassAndroid.UpdateVisit(lblOrgCode.Text)


        'Catch ex As Exception

        'End Try

    End Sub

    Public Function getDownload_() As String
        Try
            Return String.Format("تعداد دانلود: {0}", ClassAndroid.getDownload(lblOrgCode.Text))
        Catch ex As Exception
            Return ""
        End Try
    End Function
    Public Function getVisit_() As String
        Try
            Return String.Format("تعداد بازدید: {0}", ClassAndroid.getVisit(lblOrgCode.Text))
        Catch ex As Exception
            Return ""
        End Try
    End Function
    Public Function getNamefile_(ByVal name As Object) As String
        'Try

        Return System.IO.Path.GetFileName(name.ToString) '& "(" & FI.Length.ToString & ")"

        'Catch ex As Exception
        '    Return ""
        'End Try
    End Function
    Public Function getVolume_() As String
        Try
            Return ""
        Catch ex As Exception
            Return ""
        End Try
    End Function
    Public Function GetRate(ByVal code As Object) As String
        Try
            Return ClassAndroid.GetRateOfDownload(Val(code))
        Catch ex As Exception
            Return "0"
        End Try
    End Function

    Public Sub Redirect2(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim Res As String() = e.CommandArgument.ToString.Split("|")
        Response.Redirect(ResolveUrl("Post/" + Res(0).Trim() + "/" + Res(1).Trim.Replace(" ", "-").Trim() + ".html"))

    End Sub

    Public Function getLogo(ByVal logo As Object) As String
        If logo.ToString.Trim = String.Empty Then
            Return "http://shaahr.com/logo_shaahr.png"
        Else
            Return "~\management\images\logo\" + logo.ToString.Trim
        End If
    End Function

    Public Sub DownloadData(ByVal sender As Object, ByVal e As CommandEventArgs)

        Response.Redirect(e.CommandArgument)

    End Sub

    Protected Sub btnAwarApp_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAwarApp.Click
        ClassAndroid.InsertAware(lblOrgCode.Text, 1, awarApp_txtDetail.Text, awarApp_txtEmail.Text)
    End Sub

    Protected Sub btnAwarLink_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAwarLink.Click
        ClassAndroid.InsertAware(lblOrgCode.Text, 0, awarLink_txtDetail.Text, awarLink_txtEmail.Text)
    End Sub

    Public Sub Redir(ByVal sender As Object, ByVal e As CommandEventArgs)

        '<a href='<%# "Post/" + Eval("code","{0}").trim() + "/" + Eval("title","{0}").Trim.Replace(" ", "-").Trim() + ".html" %>'
        '    <img src='<%# Eval("logo", "management\images\logo\{0}") %>' "  />
        '</a>
        Dim s() As String = e.CommandArgument.ToString.Split("|")

        Response.Redirect("~/Post/" + s(0) + "/" + s(1).Trim.Replace(" ", "-").Trim() + ".html")

    End Sub

    Public Function getDateShamsi_(ByVal date_ As Object) As String
        Return ShamsiDate.Miladi2Shamsi(date_.ToString, ShamsiDate.ShowType.LongDate)
    End Function

End Class
