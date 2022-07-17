Imports Microsoft.VisualBasic

Public Class ApplicationSpecialApp

    Dim ds_query As New DS_ApplicationSpecialAppTableAdapters.SpecialDaysIsEnableTableAdapter
    Dim ds_FunctionalApps As New DS_ApplicationSpecialAppTableAdapters.tbl_Shaahr_FunctionalAppsTableAdapter
    Dim ds_SpecialDays As New DS_ApplicationSpecialAppTableAdapters.tbl_Shaahr_ListSpecialDaysTableAdapter
    Dim ds_SpecialApps As New DS_ApplicationSpecialAppTableAdapters.tbl_Shaahr_SpecialAppsTableAdapter

    Public Function insertFunctionalApps(ByVal CodeAndroid As Long) As Boolean
        ds_FunctionalApps.Insert(CodeAndroid)
    End Function

    Public Function insertDay(ByVal name As String) As Boolean
        ds_SpecialDays.InsertDay(name, 0)
    End Function


    Public Function UpdateDisabling() As Boolean
        ds_SpecialDays.UpdateAllDisabling()
    End Function


    Public Function UpdateEnabled(ByVal id As Long) As Boolean
        ds_SpecialDays.UpdateEnable(id)
    End Function


    Public Function InsertAppToSpecialDay(ByVal codeDay As Integer, ByVal CodeAndroid As Long) As Boolean
        ds_SpecialApps.InsertAppToSpecialDay(codeDay, CodeAndroid)
    End Function

    Public Function getEnableDay() As String
        Return ds_query.GetData().Rows(0)(1).ToString
    End Function

End Class
