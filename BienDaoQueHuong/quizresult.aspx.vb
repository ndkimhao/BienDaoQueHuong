Public Partial Class quizresult
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("Password") <> "BDQH_TS78ASDB78B" Then
            Response.Redirect("Default.aspx")
        End If
        Dim SQL As New SQLConnect()
        gvResult.DataSource = SQL.ExecuteQuery("select q.ID,UserID,Username,Email,CharacterName," + _
                                "'0'+CAST(Time/60 as varchar(2))+':'+CAST(Time%60 as varchar(2)) as DoTime,Points," + _
                                "SubmittedDate from Quiz q join Users u on q.UserID=u.ID " + _
                                "where QuizCode='" + Request.QueryString("QuizCode").Replace("'", "''") + "' " + _
                                "order by Points desc, Time asc, SubmittedDate asc ")
        SQL.CloseConnection()
        gvResult.DataBind()
    End Sub
End Class