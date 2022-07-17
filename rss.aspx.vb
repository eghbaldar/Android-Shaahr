Imports System.Data.SqlClient
Imports System.Data

Partial Class rss
    Inherits System.Web.UI.Page


    Public Function RemoveIllegalCharacters(ByVal input As Object) As String

        Dim data As String = input.ToString
        data = data.Replace("&", "&amp;")
        data = data.Replace("\", "&quot;")
        data = data.Replace("'", "&apos;")
        data = data.Replace("<", "&lt;")
        data = data.Replace(">", "&gt;")

        Return data

    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try
            Dim sqlconn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrAndroidConnectionString").ConnectionString)
            Dim sqlcom As New SqlCommand("exec [Today_RSS]", sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlconn.Open()
            sqlda.Fill(ds)
            RepeaterRSS.DataSource = sqlcom.ExecuteReader()
            RepeaterRSS.DataBind()
            sqlconn.Close()
        Catch ex As Exception

        End Try


    End Sub


End Class
