Public Partial Class rank
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Share.OpenConnection()
        litUsersCount.Text = Share.GetUsersCount()

        litTopInvestment0.Text = GetTopInvestment(0)
        litTopInvestment1.Text = GetTopInvestment(1)
        litTopInvestment2.Text = GetTopInvestment(2)
        litTopInvestment3.Text = GetTopInvestment(3)
        litTopInvestment4.Text = GetTopInvestment(4)
        litTopInvestment5.Text = GetTopInvestment(5)
        litTopInvestment6.Text = GetTopInvestment(6)

        litTopIsland0.Text = GetTopIsland(0)
        litTopIsland1.Text = GetTopIsland(1)
        litTopIsland2.Text = GetTopIsland(2)
        litTopIsland3.Text = GetTopIsland(3)
        litTopIsland4.Text = GetTopIsland(4)
        litTopIsland5.Text = GetTopIsland(5)
        litTopIsland6.Text = GetTopIsland(6)
        litTopIsland7.Text = GetTopIsland(7)
        litTopIsland8.Text = GetTopIsland(8)

        litTopQuiz.Text = GetTopQuiz()

        Share.CloseConnection()
        litRegisterOrProfile.Text = Share.GetRegisterOrProfile(Session)
    End Sub

    Private Function GetTopQuiz() As String
        Dim dt As DataTable = Share.SQL.ExecuteQuery("select top 5 * from Quiz order by Points desc, Time asc, SubmittedDate asc")
        Dim result As String = ""
        For i As Integer = 0 To 4
            If dt(i) Is Nothing Then
                result += "<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>"
            Else
                Dim dr As DataRow = dt(i)
                Dim Time As String = ""
                Dim Minutes As Integer = Math.Floor(dr("Time") / 60)
                Dim Seconds As Integer = dr("Time") Mod 60
                If Minutes > 9 Then
                    Time += CStr(Minutes)
                Else
                    Time += "0" + CStr(Minutes)
                End If
                Time += ":"
                If Seconds > 9 Then
                    Time += CStr(Seconds)
                Else
                    Time += "0" + CStr(Seconds)
                End If

                result += "<tr><td>"
                result += Share.SQL.ExecuteQuery("select * from Users where ID=" + CStr(dr("UserID")))(0)("CharacterName")
                result += "</td><td>"
                result += CStr(dr("Points"))
                result += "</td><td>"
                result += Time
                result += "</td><td>"
                result += CStr(dr("SubmittedDate"))
                result += "</td></tr>"
            End If
        Next
        Return result
    End Function

    Private Function GetTopIsland(ByVal id As Integer)
        Dim dt As DataTable = Share.SQL.ExecuteQuery(String.Format("select top 5 *,  rank() over (order by Gold desc) as Rank from Records where IslandID={0} order by Rank asc", id))
        Dim result As String = ""
        For i As Integer = 0 To 4
            If dt(i) Is Nothing Then
                result += "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>"
            Else
                Dim dr As DataRow = dt(i)
                result += "<tr><td>"
                result += Share.SQL.ExecuteQuery("select * from Users where ID=" + CStr(dr("UserID")))(0)("CharacterName")
                result += "</td><td class=""gold"">"
                result += Share.FormatNumber(dr("Gold"))
                result += "</td></tr>"
            End If
        Next
        Return result
    End Function

    Private Function GetTopInvestment(ByVal id As Integer)
        Dim dt As DataTable = Share.SQL.ExecuteQuery(String.Format("select top 5 *,  rank() over (order by Gold desc) as Rank, cast(Gold as money)/cast(sum(Gold) over() as money)*100 as Rate from Investment where IslandID={0} order by Rank asc", id))
        Dim result As String = ""
        For i As Integer = 0 To 4
            If dt(i) Is Nothing Then
                result += "<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>"
            Else
                Dim dr As DataRow = dt(i)
                result += "<tr><td>"
                result += Share.SQL.ExecuteQuery("select * from Users where ID=" + CStr(dr("UserID")))(0)("CharacterName")
                result += "</td><td class=""gold"">"
                result += Share.FormatNumber(dr("Gold"))
                result += "</td><td class=""rate"">"
                result += CStr(Math.Round(dr("Rate"), 2))
                result += "</td></tr>"
            End If
        Next
        Return result
    End Function
End Class