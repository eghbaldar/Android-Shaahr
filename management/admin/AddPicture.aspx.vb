Imports System.Data.SqlClient
Imports System.Data

Partial Class management_admin_AddPicture
    Inherits System.Web.UI.Page

    Dim ClassAndroid As New Android

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Title = "عکس های آلبومی نرم افزارها"
        If Not IsPostBack Then Fill(Request.QueryString("title"))
    End Sub

    Public Sub editPicture(sender As Object, e As CommandEventArgs)
        Panel_.Visible = True
        lblCode.Text = e.CommandArgument
        DL_Picture.DataBind()
    End Sub

    Sub Fill(search_ As String)

        Try
            Dim conn As SqlConnection
            Dim ds As New DataSet
            Dim comm As New SqlCommand
            Dim adapter As New SqlDataAdapter

            Dim connectionString As String = ConfigurationManager.ConnectionStrings("shaahrAndroidConnectionString").ConnectionString.ToString

            conn = New SqlConnection(connectionString)
            comm.Connection = conn

            comm.CommandText = "SELECT top 100 * FROM [tbl_shaahr_Android]   WHERE [title] like N'%" + search_ + "%' order by code desc"

            adapter.SelectCommand = comm

            adapter.Fill(ds)

            DG.DataSource = ds.Tables(0)

            DG.DataBind()

            conn.Close()
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As System.EventArgs) Handles btnSearch.Click
        Response.Redirect("AddPicture.aspx?title=" + txtSearch.Text)
        Panel_.Visible = False
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As System.EventArgs) Handles btnCancel.Click
        Panel_.Visible = False
    End Sub

    Protected Sub btnInsertPic_Click(sender As Object, e As System.EventArgs) Handles btnInsertPic.Click

        Dim Rnd As New Random
        Dim Filename As String = Rnd.Next(1, 1000).ToString + "-" + Guid.NewGuid().ToString().Replace("-", "")
        Dim FileInfo As New System.IO.FileInfo(FileUpload.FileName)
        FileUpload.SaveAs(MapPath("~\management\images\picture\" + Filename + FileInfo.Extension))

        ClassAndroid.InsertPicture(lblCode.Text, Filename + FileInfo.Extension)

        DL_Picture.DataBind()

    End Sub

    Public Sub deletePic(sender As Object, e As CommandEventArgs)
        ClassAndroid.DeletePicture(e.CommandArgument)
        DL_Picture.DataBind()
    End Sub

End Class
