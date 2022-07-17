Imports System.Data.SqlClient
Imports System.Data

Partial Class management_admin_Default
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Response.Redirect("insert.aspx")
    End Sub

    Protected Sub Button4_Click(sender As Object, e As System.EventArgs) Handles Button4.Click
        Response.Redirect("edit.aspx")
    End Sub

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click
        Response.Redirect("statistical.aspx")
    End Sub

    Protected Sub Button6_Click(sender As Object, e As System.EventArgs) Handles Button6.Click
        Response.Redirect("article.aspx")
    End Sub

    Protected Sub Button5_Click(sender As Object, e As System.EventArgs) Handles Button5.Click
        Response.Redirect("AddPicture.aspx")
    End Sub

    Protected Sub Button7_Click(sender As Object, e As System.EventArgs) Handles Button7.Click
        Response.Redirect("AddLabel.aspx")
    End Sub

    Protected Sub Button8_Click(sender As Object, e As System.EventArgs) Handles Button8.Click
        Response.Redirect("Req.aspx")
    End Sub

    Protected Sub Button9_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button9.Click
        Response.Redirect("aware.aspx")
    End Sub
    Protected Sub Button10_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button10.Click
        Response.Redirect("comment.aspx")
    End Sub

    Protected Sub Button11_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button11.Click
        Response.Redirect("newsLetter.aspx")
    End Sub

    Protected Sub Button12_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button12.Click
        Response.Redirect("SendEmail.aspx")
    End Sub

    Protected Sub Button13_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button13.Click
        Response.Redirect("contact.aspx")
    End Sub

    Protected Sub Button14_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button14.Click
        Response.Redirect("Application_And_Special_Apps.aspx")
    End Sub

    Protected Sub btnSitemap_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSitemap.Click

        Dim items As New List(Of Sitemap.SitemapItem)()
        ' Try
        Dim sqlconn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrAndroidConnectionString").ConnectionString)
        Dim sqlcom As New SqlCommand("exec [SiteMap]", sqlconn)
        Dim sqlda As New SqlDataAdapter(sqlcom)
        Dim ds As New DataSet
        sqlconn.Open()
        sqlda.Fill(ds)

        For i As Long = 0 To ds.Tables(0).Rows.Count - 1
            items.Add(New Sitemap.SitemapItem(String.Format("http://shaahroid.ir/Post/{0}/{1}.html", ds.Tables(0).Rows(i)("code").ToString, _
                                                            ds.Tables(0).Rows(i)("title").ToString), Nothing, Sitemap.ChangeFrequency.always, 1))
        Next

        sqlconn.Close()
        Dim sm As New Sitemap.XmlSitemapResult(items)
        sm.CreateXmlSitemap(Server.MapPath("~/sitemap.xml"))

        'Catch ex As Exception
        'End Try

    End Sub

End Class
