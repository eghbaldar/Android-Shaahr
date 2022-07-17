Imports System.Data.SqlClient
Imports System.Data

Partial Class management_admin_AddLabel
    Inherits System.Web.UI.Page

    Dim ClassAndroid As New Android

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Title = "اضافه کردن برچسب"
        If Not IsPostBack Then Fill(Request.QueryString("title"))
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
        Response.Redirect("AddLabel.aspx?title=" + txtSearch.Text)
        Panel_.Visible = False
    End Sub

    Public Sub editLabel(sender As Object, e As CommandEventArgs)
        Try
            Panel_.Visible = True
            lblCode.Text = e.CommandArgument
            txtlabel.Text = ClassAndroid.GetLabel(e.CommandArgument)
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btneditLabel_Click(sender As Object, e As System.EventArgs) Handles btneditLabel.Click
        ClassAndroid.UpdateLabel(lblCode.Text, txtlabel.Text)
        txtlabel.Text = ""
        Panel_.Visible = False
    End Sub

    Protected Sub AddTag_Click(sender As Object, e As System.EventArgs) Handles AddTag.Click
        Taglist.Items.Add("<a  style='text-decoration:none;color:#479BEF;' href='" + TagLink.Text.ToString + "' target='_blank'>" + TagName.Text.ToString + "</a>,")
    End Sub

    Protected Sub TagTransfer_Click(sender As Object, e As System.EventArgs) Handles TagTransfer.Click
        Dim Res As String
        For i As Byte = 0 To Taglist.Items.Count - 1
            Res += Taglist.Items(i).Value.ToString
        Next
        txtlabel.Text = Res
    End Sub

    Protected Sub btnDeleteTag_Click(sender As Object, e As System.EventArgs) Handles btnDeleteTag.Click
        ClassAndroid.UpdateLabel(lblCode.Text, "")
        txtlabel.Text = ""
    End Sub

End Class
