Public Partial Class game
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Share.CheckLogin(Session, Response) Then
            Dim SQL As New SQLConnect()
            Dim dt As DataTable = SQL.ExecuteQuery("select top 5 * from Questions order by newID()")
            Dim Result As String = ""
            For i As Integer = 0 To 4
                Dim dr As DataRow = dt(i)
                Result += dr("Question") + "||" + dr("Answer")
                If i < 4 Then
                    Result += "|||"
                End If
            Next
            hidQuestionAnswer.Value = Result
        End If
    End Sub
End Class