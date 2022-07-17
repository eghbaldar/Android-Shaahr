Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.SessionState
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.Services

Partial Class Management_UserControl_ucComments
    Inherits System.Web.UI.UserControl
    Dim parentID As Long
    Dim _PostId As Long
    Property PostID() As Long
        Get
            Return _PostId
        End Get
        Set(ByVal value As Long)
            _PostId = value
        End Set
    End Property

    Dim _ShowComment As Boolean
    Property ShowComment() As Boolean
        Get
            Return _ShowComment
        End Get
        Set(ByVal value As Boolean)
            _ShowComment = value
            If value = True Then
                hdShowComment.Value = 1
            Else
                hdShowComment.Value = 0
            End If

        End Set
    End Property

    Dim Action As New Software.BLL.Comments

    Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSend.Click

        If Session("randomStr") <> txtCap.Text Then
            Exit Sub
        End If
        Dim name_s As String
        Dim email_s As String
        If txtFullName.Text = "نام شما" Then
            name_s = "ناشناس"
        Else
            name_s = txtFullName.Text.Trim()
        End If
        If txtEmail.Text = "پست الکترونیک" Then
            email_s = ""
        Else
            email_s = txtEmail.Text.Trim()
        End If
        'If CapchaControl1.IsCorrect() Then
        Dim bolResult As Boolean = Action.Insert(0, _PostId, name_s, email_s, "<pre>" + txtNote.Text + "</pre>")
        If bolResult Then
            lblCommentMsg.Text = "کاربر محترم نظر شما دریافت شد"
            If Me.ShowComment = True Then Call BindData()
            Call EmptyForm()
        Else
            lblCommentMsg.Text = "خطا! دوباره سعی کنید."
        End If
        'End If
        '''''' Success Message
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "fade();", True)

    End Sub

    Private Sub EmptyForm()
        txtFullName.Text = "نام شما"
        txtEmail.Text = "پست الکترونیک"
        txtNote.Text = "نظر شما"
    End Sub

    Public Sub ShowContent()
        PostIdSaver.Value = Me.PostID

        'If Action.GetCountVoteForThisPost(Me._PostId) > 0 Then
        '    lblCountVote.Text = String.Format(" {0} ", Action.GetCountVoteForThisPost(Me.PostID))
        '    lblCountComment.Visible = True
        'End If

        If Not Page.IsPostBack Then
            Call BindData()
        End If

    End Sub

    Private Sub BindData()
        Dim Action As New Software.BLL.Comments
        Dim dt As DataTable = Action.SelectByMainComment2(Me.PostID, True)
        Repeater1.DataSource = dt
        Repeater1.DataBind()
    End Sub

    Protected Sub Repeater1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles Repeater1.ItemDataBound



        Dim lt As ListItemType = e.Item.ItemType
        If lt = ListItemType.Item Or lt = ListItemType.AlternatingItem Then
            Dim dv As DataRowView = TryCast(e.Item.DataItem, DataRowView)
            If dv IsNot Nothing Then
                Dim nestedRepeater As Repeater = TryCast(e.Item.FindControl("NestedRepeater"), Repeater)
                If nestedRepeater IsNot Nothing Then
                    Dim action As New Software.BLL.Comments
                    Dim dt As DataTable = action.SelectByParentID2(dv.Item("CommentId"), True)
                    nestedRepeater.DataSource = dt
                    nestedRepeater.DataBind()
                End If
            End If
        End If

    End Sub
    Public Sub insertResponse(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim B As Button = CType(sender, Button)
        Dim ss As String() = B.ClientID.Split("_")

        Dim name As String = String.Empty
        Dim email As String = String.Empty
        Dim note As String = String.Empty
        For i As Integer = 0 To Repeater1.Items.Count - 1

            Dim txtn As TextBox = CType(Repeater1.Items(i).FindControl("txt_n1"), TextBox)
            Dim txte As TextBox = CType(Repeater1.Items(i).FindControl("txt_e1"), TextBox)
            Dim txtd As TextBox = CType(Repeater1.Items(i).FindControl("txt_d1"), TextBox)

            Dim sn As String() = txtn.ClientID.Split("_")
            '' s(5) ---> local
            '' s(2) ---> Host
            If ss(4) = sn(5) Then
                name = txtn.Text
                email = txte.Text
                note = "<pre>" + txtd.Text + "</pre>"
            End If

        Next
        ''''''''''''''''''''''''''''
        If name = "نام شما" Then
            name = "ناشناس"
        End If
        If email = "پست الکترونیک" Then
            email = ""
        End If
        ''''''''''''''''''''''''''''
        Dim Action As New Software.BLL.Comments
        'Action.Insert(e.CommandArgument, _PostId, name, email, note)
        Action.Insert(Convert.ToInt64(e.CommandArgument), _PostId, name, email, note)
        Call BindData()
        'lblCountVote.Text = String.Format(" {0} ", Action.GetCountVoteForThisPost(Me.PostID))
        '''''' Success Message
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "fade();", True)

    End Sub
   
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        imgCap.ImageUrl = "~/captcha.aspx"
    End Sub

End Class