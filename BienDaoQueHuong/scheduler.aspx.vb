Public Partial Class scheduler
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("Password") = "BienDaoQueHuong.info_q7US2e9FMFw3ByGBU5DW" Then
            Share.OpenConnection()
            Dim dt As DataTable
            For i As Integer = 0 To 6
                dt = Share.SQL.ExecuteQuery(String.Format("select top 3 *,  rank() over (order by Gold desc) as Rank from Investment where IslandID={0} order by Rank asc", i))
                Dim sum As Integer = Share.SQL.ExecuteQuery(String.Format("select isNull(sum(Gold), 0) as Sum from Investment where IslandID={0}", i))(0)("Sum")
                Dim rate As Double = 0.1
                For Each dr As DataRow In dt.AsEnumerable()
                    Share.SQL.ExecuteCommand(String.Format("update Users set Bank=Bank+{0} where ID={1}", sum * rate, dr("UserID")))
                    rate -= 0.03
                Next
            Next

            Dim PrizeGold As Integer
            For i As Integer = 0 To 8
                dt = Share.SQL.ExecuteQuery(String.Format("select top 3 *,  row_number() over (order by Gold desc) as Rank from Records where IslandID={0} order by Rank", i))
                PrizeGold = 50000
                For j As Integer = 0 To 2
                    If dt(j) IsNot Nothing Then
                        Dim dr As DataRow = dt(j)
                        Share.SQL.ExecuteCommand(String.Format("update Users set Bank=Bank+{0} where ID={1}", PrizeGold, dr("UserID")))
                        PrizeGold -= 20000
                    End If
                Next
            Next
            dt = Share.SQL.ExecuteQuery(String.Format("select top 3 *,  row_number() over (order by Gold desc) as Rank from Flaggings order by Rank"))
            PrizeGold = 100000
            For j As Integer = 0 To 2
                If dt(j) IsNot Nothing Then
                    Dim dr As DataRow = dt(j)
                    Share.SQL.ExecuteCommand(String.Format("update Users set Bank=Bank+{0} where ID={1}", PrizeGold, dr("UserID")))
                    PrizeGold -= 40000
                End If
            Next
            Share.CloseConnection()
            Response.Write("OK - " + Now)
        Else
            Response.Write("Fail - " + Now)
        End If
    End Sub
End Class