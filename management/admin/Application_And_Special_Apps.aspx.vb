
Partial Class management_admin_Application_And_Special_Apps
    Inherits System.Web.UI.Page

    Dim class_ As New ApplicationSpecialApp

    Public Sub InsertApplication(ByVal sender As Object, ByVal e As CommandEventArgs)
        class_.insertFunctionalApps(e.CommandArgument)
        gr_ListFunctional.DataBind()
    End Sub

    Protected Sub inserSpceialDay_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles inserSpceialDay.Click
        class_.insertDay(txtSpecialDay.Text)
        gr_SpecialDays.DataBind()
        drpList.DataBind()
    End Sub

    Public Function getBack(ByVal flag As Object) As System.Drawing.Color
        Select Case Convert.ToBoolean(flag)
            Case True
                Return Drawing.Color.Green
            Case False
                Return Drawing.Color.Red
        End Select
    End Function

    Public Sub updateFlag(ByVal sender As Object, ByVal e As CommandEventArgs)
        class_.UpdateDisabling()
        class_.UpdateEnabled(e.CommandArgument)
        gr_SpecialDays.DataBind()
    End Sub

    Protected Sub inserAppSpecial_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles inserAppSpecial.Click
        class_.InsertAppToSpecialDay(drpList.SelectedValue, txtCodeApp.Text)
        gr_ListApps.DataBind()
    End Sub

End Class
