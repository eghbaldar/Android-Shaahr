Imports System.Data
Partial Class usercontrol_slide
    Inherits System.Web.UI.UserControl
    Dim ClassAnd As New Android

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim dt As DataTable = ClassAnd.Slide()
        Dim row1 As DataRow = dt.Rows(0)
        Dim row2 As DataRow = dt.Rows(1)
        Dim row3 As DataRow = dt.Rows(2)

        Try
            lblTitle1.Text = row1.Item("title")
            lblDetail1.Text = row1.Item("Details")
            img1.ImageUrl = "~\management\images\" + row1.Item("PicturePath")
            A1.HRef = "http://android.shaahr.com/Post/" + Str(row1.Item("code")).Trim + "/" + row1.Item("title")
            A11.HRef = "http://android.shaahr.com/Post/" + Str(row1.Item("code")).Trim + "/" + row1.Item("title")
            A111.HRef = "http://android.shaahr.com/Post/" + Str(row1.Item("code")).Trim + "/" + row1.Item("title")
            AA1.HRef = "http://android.shaahr.com/Post/" + Str(row1.Item("code")).Trim + "/" + row1.Item("title")
            lblType1.Text = IIf(row1.Item("type") = 0, "بازی", "برنامه")
        Catch ex As Exception
        End Try

        Try
            lblTitle2.Text = row2.Item("title")
            lblDetail2.Text = row2.Item("Details")
            img2.ImageUrl = "~\management\images\" + row2.Item("PicturePath")
            A2.HRef = "http://android.shaahr.com/Post/" + Str(row2.Item("code")).Trim + "/" + row2.Item("title")
            A22.HRef = "http://android.shaahr.com/Post/" + Str(row2.Item("code")).Trim + "/" + row2.Item("title")
            A222.HRef = "http://android.shaahr.com/Post/" + Str(row2.Item("code")).Trim + "/" + row2.Item("title")
            AA2.HRef = "http://android.shaahr.com/Post/" + Str(row2.Item("code")).Trim + "/" + row2.Item("title")
            lblType2.Text = IIf(row2.Item("type") = 0, "بازی", "برنامه")
        Catch ex As Exception
        End Try

        Try
            lblTitle3.Text = row3.Item("title")
            lblDetail3.Text = row3.Item("Details")
            img3.ImageUrl = "~\management\images\" + row3.Item("PicturePath")
            A3.HRef = "http://android.shaahr.com/Post/" + Str(row3.Item("code")).Trim + "/" + row3.Item("title")
            A33.HRef = "http://android.shaahr.com/Post/" + Str(row3.Item("code")).Trim + "/" + row3.Item("title")
            A333.HRef = "http://android.shaahr.com/Post/" + Str(row3.Item("code")).Trim + "/" + row3.Item("title")
            AA3.HRef = "http://android.shaahr.com/Post/" + Str(row3.Item("code")).Trim + "/" + row3.Item("title")
            lblType3.Text = IIf(row3.Item("type") = 0, "بازی", "برنامه")
        Catch ex As Exception
        End Try


    End Sub


End Class
