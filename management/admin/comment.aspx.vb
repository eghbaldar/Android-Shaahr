
Partial Class management_admin_comment
    Inherits System.Web.UI.Page

    'Dim class_comment As New comme
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '
        If gvCommentList.Rows.Count > 0 Then gvCommentList.HeaderRow.TableSection = TableRowSection.TableHeader
        For Each gvr As GridViewRow In gvCommentList.Rows
            Dim cb As CheckBox = CType(gvr.FindControl("chkSelectRecord"), CheckBox)
            ClientScript.RegisterArrayDeclaration("CheckBoxIDs", String.Concat("'", cb.ClientID, "'"))
        Next
        '
    End Sub

    Protected Sub gvCommentList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvCommentList.SelectedIndexChanged
        '
        Dim NewsCommentBLL As New software.BLL.Comments
        Dim CommentId As Integer = CInt(gvCommentList.SelectedValue)
        Dim row As GridViewRow = gvCommentList.SelectedRow
        Dim lblVisible As Label = DirectCast(row.FindControl("lblVisible"), Label)

        'lblVisible.Text = "<div class=""BadStatus"">انتشار یافته</div>"
        'NewsCommentBLL.ChangeVisable(CommentId, True)
        '
    End Sub

    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        '

        Dim NewsCommentBLL As New Software.BLL.Comments
        Dim CommentID As Long
        For Each row As GridViewRow In gvCommentList.Rows
            Dim cb As CheckBox = row.FindControl("chkSelectRecord")
            If cb.Checked = True Then
                Dim lbl As Label = DirectCast(row.FindControl("lblCommentId"), Label)
                CommentID = lbl.Text
                'Response.Write(CommentID & "<br/>")
                NewsCommentBLL.Delete(CommentID)
            End If
        Next
        gvCommentList.DataBind()
        ''
    End Sub

    Protected Sub btnRead_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRead.Click
        '
        Dim NewsCommentBLL As New Software.BLL.Comments
        Dim CommentID As Long
        For Each row As GridViewRow In gvCommentList.Rows
            Dim cb As CheckBox = row.FindControl("chkSelectRecord")
            If cb.Checked = True Then
                Dim lbl As Label = DirectCast(row.FindControl("lblCommentId"), Label)
                CommentID = lbl.Text
                'Response.Write(CommentID & "<br/>")
                NewsCommentBLL.ChangeVisable(CommentID, True)
            End If
        Next
        gvCommentList.DataBind()
        '
    End Sub

    Protected Sub btnunRead_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnunRead.Click
        Dim NewsCommentBLL As New software.BLL.Comments
        Dim CommentID As Long
        For Each row As GridViewRow In gvCommentList.Rows
            Dim cb As CheckBox = row.FindControl("chkSelectRecord")
            If cb.Checked = True Then
                Dim lbl As Label = DirectCast(row.FindControl("lblCommentId"), Label)
                CommentID = lbl.Text
                'Response.Write(CommentID & "<br/>")
                NewsCommentBLL.ChangeVisable(CommentID, False)
            End If
        Next
        gvCommentList.DataBind()
    End Sub
End Class
