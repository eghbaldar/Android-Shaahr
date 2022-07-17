Imports Microsoft.VisualBasic

Public Class MyShaahr

    Dim DS_CMS_Contact As New DS_MyShaahrTableAdapters.CMS_ContactTableAdapter

    Public Function InsertCMSContact(ByVal FnLn As String, ByVal email As String, _
                                     ByVal tell As String, ByVal Group As String, ByVal cuase As String, ByVal ip As String) As Boolean
        Try
            DS_CMS_Contact.InsertContact(FnLn, email, tell, Group, cuase, 1, ip, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate) + "/" + Now.TimeOfDay.ToString.Substring(0, 8))
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

End Class
