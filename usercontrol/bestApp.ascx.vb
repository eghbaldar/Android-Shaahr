
Partial Class usercontrol_bestApp
    Inherits System.Web.UI.UserControl

    Public Function getLogo(ByVal logo As Object) As String
        If logo.ToString.Trim = String.Empty Then
            Return "http://shaahr.imagefly.io/q_low/http://shaahr.com/logo_shaahr.png"
        Else
            Return ResolveUrl("~/CopyLogo.aspx?P=" + logo.ToString.Trim + "&W=75&H=75")
        End If
    End Function

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

    Public Function getShortDetail(ByVal title As Object) As String
        If title.ToString.Length > 50 Then
            Return title.ToString.Substring(0, 50)
        Else
            Return title.ToString
        End If
    End Function

End Class
