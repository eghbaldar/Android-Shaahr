
Partial Class _Default
    Inherits System.Web.UI.Page
    Dim classAndroid As New Android
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "شهروید ، دانلود بازی و برنامه ها و مقالات آموزشی آندرویدی"
        If Not IsPostBack Then classAndroid.UpdateVisitWebsite()
    End Sub

End Class
