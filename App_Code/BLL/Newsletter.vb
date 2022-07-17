Imports Microsoft.VisualBasic
Imports System.Data

Public Class Newsletter

    Dim DS_Query As New ds_NewsLetterTableAdapters.Query
    Dim DS_NewsLetter As New ds_NewsLetterTableAdapters.shaahr_newsletterTableAdapter
    Dim DS_LastAndroid As New ds_NewsLetterTableAdapters.LastAndroidTableAdapter

    Public Function InsertNewsLetter(ByVal name As String, ByVal email As String) As Boolean
        DS_NewsLetter.InsertNewsLetter(name, email)
    End Function

    Public Function getNameByEmail(ByVal email As String) As String
        DS_NewsLetter.getNameByEmail(email)
    End Function

    Public Function getListOfEmailNewsLetter() As DataTable
        Return DS_NewsLetter.GetData
    End Function

    Public Function getLastAndroid() As DataRow
        Return DS_LastAndroid.GetData.Rows(0)
    End Function

    Public Function getValidEmailNewsletter(ByVal email As String) As Boolean
        If DS_NewsLetter.getValidEmailNewsletter(email) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function getCountUsersNewsletter() As String
        Return DS_Query.CountUsersNewsletter
    End Function

End Class
