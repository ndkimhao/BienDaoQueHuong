Public Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Share.OpenConnection()
        Dim dt As DataTable = Share.SQL.ExecuteQuery("select top 7 *,  rank() over (order by Gold desc) as Rank from Flaggings order by Rank asc")
        Dim result As String = ""
        For Each data As DataRow In dt.AsEnumerable()
            result += "<span>"
            result += Share.SQL.ExecuteQuery("select * from Users where ID=" + CStr(data("UserID")))(0)("CharacterName")
            result += " - </span><span class=""gold"">"
            result += Share.FormatNumber(data("Gold"))
            result += "</span><br />"
        Next
        litUsersCount.Text = Share.GetUsersCount()
        Share.CloseConnection()
        litPhuHo.Text = result
        litRegisterOrProfile.Text = Share.GetRegisterOrProfile(Session)
    End Sub
End Class