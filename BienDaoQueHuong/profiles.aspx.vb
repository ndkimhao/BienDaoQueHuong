Public Partial Class profiles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Share.CheckLogin(Session, Response) Then
            Share.OpenConnection()

            Dim data As DataRow = Share.GetUserData(Session)
            lblCharacterName.Text = data("CharacterName")
            lblUsername.Text = String.Format("<h3 title=""Lần đăng nhập cuối: {0}&#13;&#10;Ngày đăng ký: {1}"">{2}", data("LastLogin"), data("RegistrationDate"), data("Username"))
            lblGold.Text = data("Gold")
            lblRank.Text = data("Rank")
            imgAvatar.ImageUrl = String.Format("image/avatar/{0}.png", data("AvatarID"))
            hidShipID.Value = data("CurrentShip")
            If data("CurrentShip") > -1 Then
                litItem.Text = String.Format("<img id=""imgShip"" src=""image/ship/{0}.png"">", data("CurrentShip") + 1)
            End If
            If data("CurrentFlag") > 0 Then
                litFlag.Text = String.Format("<span id=""spanFlag"">{0}</span>", data("CurrentFlag"))
            Else
                litFlag.Text = "<span id=""spanFlag"" class=""hide""></span>"
            End If

            Dim dt As DataTable = Share.SQL.ExecuteQuery(String.Format("select top 5 * from (select *,  rank() over (order by Gold desc) as Rank from Flaggings) as t where UserID={0} order by FlaggingDate desc", data("ID")))
            Dim result As String = ""
            For i As Integer = 0 To 4
                If dt(i) Is Nothing Then
                    result += "<tr><td></td><td></td><td></td></tr>"
                Else
                    result += "<tr><td>"
                    result += CStr(dt(i)("Rank"))
                    result += "</td><td class=""gold"">"
                    result += Share.FormatNumber(dt(i)("Gold"))
                    result += "</td><td>"
                    result += CStr(dt(i)("FlaggingDate"))
                    result += "</td></tr>"
                End If
            Next
            litFlagging.Text = result
            If (data("Gold") + data("Bank")) < 50000 Then
                litRestart.Text = " - <a id=""aRestart"" href=""#"">Khởi tạo lại TK</a>"
            End If

            Dim arrStringRank() As String = {"Nhất", "Nhì", "Ba"}
            Dim arrStringGame() As String = {"Thử Tài Trí Nhớ", "Lật Hình", "Xếp Hình", "Thử Tài Trí Nhớ", "Xếp Hình", "Lật Hình", "Sắp Xếp Tên Đảo", "Câu Cá", "Câu Cá"}
            Dim arrStringIsland() As String = {"đảo Phú Quốc", "Côn Đảo", "đảo Phú Quý", "đảo Trường Sa", "đảo Phan Vinh", "đảo Lý Sơn", "đảo Bạch Long Vĩ", "Bãi Câu 1", "Bãi Câu 2"}
            For i As Integer = 0 To 8
                dt = Share.SQL.ExecuteQuery(String.Format("select * from (select top 3 *,  row_number() over (order by Gold desc) as Rank from Records where IslandID={0} order by Rank) as t where UserID={1}", i, data("ID")))
                For j As Integer = 0 To 2
                    If dt(j) IsNot Nothing Then
                        Dim dr As DataRow = dt(j)
                        litPrize.Text += String.Format("<a title=""Hạng {0} trò chơi {1} tại {2}"" href=""#"">", arrStringRank(dr("Rank") - 1), arrStringGame(dr("IslandID")), arrStringIsland(dr("IslandID")))
                        If dr("Rank") = 1 Then
                            litPrize.Text += String.Format("<img src=""image/prize/1/{0}.png"" />", dr("IslandID"))
                        Else
                            litPrize.Text += String.Format("<img src=""image/prize/{0}.png"" />", dr("Rank"))
                        End If
                        litPrize.Text += "</a>"
                    End If
                Next
            Next
            dt = Share.SQL.ExecuteQuery(String.Format("select * from (select top 3 *,  row_number() over (order by Gold desc) as Rank from Flaggings order by Rank) as t where UserID={0}", data("ID")))
            For j As Integer = 0 To 2
                If dt(j) IsNot Nothing Then
                    Dim dr As DataRow = dt(j)
                    litPrize.Text += String.Format("<a title=""Hạng {0} Cắm Cờ"" href=""#""><img src=""image/prize/{1}.png"" /></a>", arrStringRank(dr("Rank") - 1), dr("Rank"))
                End If
            Next

            litUsersCount.Text = Share.GetUsersCount()
            Share.CloseConnection()
        End If
    End Sub
End Class