Public Partial Class AJAXSubmit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Share.IsLogined(Session) Then
            Share.OpenConnection()
            Dim data As DataRow = Share.GetUserData(Session)
            If Request.Form("MapX") IsNot Nothing Then
                Share.ChangeUserData(Session, "MapX", CInt(Request.Form("MapX")))
                Share.ChangeUserData(Session, "MapY", CInt(Request.Form("MapY")))
            End If
            If Request.Form("DecrementGold") IsNot Nothing Then
                If data("Gold") < Request.Form("DecrementGold") Then
                    If Request.Form("Force") = "true" Then
                        Share.ChangeUserData(Session, "Gold", data("Gold") - Request.Form("DecrementGold"))
                        data = Share.GetUserData(Session)
                    End If
                    Response.Write("fail")
                Else
                    Share.ChangeUserData(Session, "Gold", data("Gold") - Request.Form("DecrementGold"))
                    data = Share.GetUserData(Session)
                End If
                Response.Write(Share.FormatNumber(data("Gold")))
            End If
            If Request.Form("IncrementGold") IsNot Nothing Then
                Share.ChangeUserData(Session, "Gold", data("Gold") + Request.Form("IncrementGold"))
                data = Share.GetUserData(Session)
                Response.Write(Share.FormatNumber(data("Gold")))
            End If
            If Request.Form("SetGold") IsNot Nothing Then
                Share.ChangeUserData(Session, "Gold", Request.Form("SetGold"))
            End If
            If Request.Form("RecordGold") IsNot Nothing Then
                Dim IslandID As Integer = CInt(Request.Form("IslandID"))
                Dim UserID As Integer = data("ID")
                Dim Gold As Integer = Request.Form("RecordGold")
                Share.SQL.ExecuteCommand(String.Format("insert into Records(IslandID, UserID, Gold) values({0}, {1}, {2})", IslandID, UserID, Gold))
            End If
            If Request.Form("GetGold") IsNot Nothing Then
                Response.Write(Share.FormatNumber(data("Gold")))
            End If
            If Request.Form("GetGoldBank") IsNot Nothing Then
                Response.Write(Share.FormatNumber(data("Gold")) + "|" + Share.FormatNumber(data("Bank")))
            End If
            If Request.Form("DepositGold") IsNot Nothing Then
                Share.ChangeUserData(Session, "Gold", data("Gold") - Request.Form("DepositGold"))
                Share.ChangeUserData(Session, "Bank", data("Bank") + Request.Form("DepositGold"))
                data = Share.GetUserData(Session)
                Response.Write(Share.FormatNumber(data("Gold")) + "|" + Share.FormatNumber(data("Bank")))
            End If
            If Request.Form("WithdrawGold") IsNot Nothing Then
                Share.ChangeUserData(Session, "Gold", data("Gold") + Request.Form("WithdrawGold"))
                Share.ChangeUserData(Session, "Bank", data("Bank") - Request.Form("WithdrawGold"))
                data = Share.GetUserData(Session)
                Response.Write(Share.FormatNumber(data("Gold")) + "|" + Share.FormatNumber(data("Bank")))
            End If
            If Request.Form("CurrentShip") IsNot Nothing Then
                Share.ChangeUserData(Session, "CurrentShip", Request.Form("CurrentShip"))
            End If
            If Request.Form("Tax") IsNot Nothing Then
                Share.ChangeUserData(Session, "CurrentFlag", data("Gold"))
                Share.ChangeUserData(Session, "Gold", data("Gold") - Math.Floor(data("Gold") * 0.2))
                data = Share.GetUserData(Session)
                Response.Write(Share.FormatNumber(data("Gold")) + "|" + CStr(data("CurrentFlag")))
            End If
            If Request.Form("GetFlag") IsNot Nothing Then
                Response.Write(Share.FormatNumber(data("CurrentFlag")))
            End If
            If Request.Form("Flag") IsNot Nothing Then
                Share.SQL.ExecuteQuery(String.Format("insert into Flaggings(UserID, Gold) values({0}, {1})", data("ID"), data("CurrentFlag")))
                Share.ChangeUserData(Session, "CurrentFlag", "0")
                Dim dt As DataTable = Share.SQL.ExecuteQuery(String.Format("select * from (select *,  rank() over (order by Gold desc) as Rank from Flaggings) as t where t.UserID={0} order by t.FlaggingDate desc", data("ID")))
                Dim Rank As Integer = dt(0)("Rank")
                Share.SQL.ExecuteCommand(String.Format("update Flaggings set FlaggingRank={0} where UserID={1} and FlaggingDate=(select max(FlaggingDate) from Flaggings where UserID={1})", Rank, data("ID")))
                Response.Write(Rank)
            End If
            If Request.Form("ShipWreck") IsNot Nothing Then
                Share.ChangeUserData(Session, "Gold", "0")
                Share.ChangeUserData(Session, "CurrentFlag", "0")
                Share.ChangeUserData(Session, "MapX", "950")
                Share.ChangeUserData(Session, "MapY", "1850")
                If data("Bank") < 50000 Then
                    Share.ChangeUserData(Session, "Bank", "50000")
                End If
            End If
            If Request.Form("Restart") IsNot Nothing Then
                Share.SQL.ExecuteCommand(String.Format("update Users set Gold=50000,Bank=0,CurrentShip=-1,CurrentFlag=0,MapX=950,MapY=1850 where ID={0}", data("ID")))
            End If
            If Request.Form("GetUserInvestment") IsNot Nothing Then
                Dim dt As DataTable = Share.SQL.ExecuteQuery(String.Format("select * from Investment where UserID={0} and IslandID={1}", data("ID"), CInt(Request.Form("GetUserInvestment"))))
                If dt(0) Is Nothing Then
                    Response.Write("0")
                Else
                    Response.Write(Share.FormatNumber(dt(0)("Gold")))
                End If
            End If
            If Request.Form("Investment") IsNot Nothing Then
                If data("Bank") < 100000 Then
                    Response.Write("Bạn phải có tối thiểu 100.000 vàng trong ngân hàng thì mới đầu tư được")
                Else
                    If data("Gold") < Request.Form("Gold") Then
                        Response.Write(String.Format("Bạn không có đủ {0} vàng để đầu tư", Request.Form("Gold")))
                    Else
                        Dim dr As DataRow = Share.SQL.ExecuteQuery(String.Format("select * from Investment where UserID={0} and IslandID={1}", data("ID"), CInt(Request.Form("Investment"))))(0)
                        If dr Is Nothing OrElse dr("Gold") + Request.Form("Gold") <= 100000000 Then
                            Share.ChangeUserData(Session, "Gold", data("Gold") - Request.Form("Gold"))
                            Dim dt As DataTable = Share.SQL.ExecuteQuery(String.Format("select * from Investment where UserID={0} and IslandID={1}", data("ID"), CInt(Request.Form("Investment"))))
                            If dt(0) Is Nothing Then
                                Share.SQL.ExecuteCommand(String.Format("insert into Investment values({0}, {1}, {2})", data("ID"), CInt(Request.Form("Investment")), CInt(Request.Form("Gold"))))
                            Else
                                Share.SQL.ExecuteCommand(String.Format("update Investment set Gold=Gold+{0} where UserID={1} and IslandID={2}", CInt(Request.Form("Gold")), data("ID"), CInt(Request.Form("Investment"))))
                            End If
                        Else
                            Response.Write("Bạn chỉ được đầu tư tối đa 100,000,000 vàng")
                        End If
                    End If
                End If
            End If
            If Request.Form("ChangePassword") IsNot Nothing Then
                If data("Password") = Request.Form("OldPassword") Then
                    Share.ChangeUserData(Session, "Password", Share.GeneratePasswordHash(Request.Form("ChangePassword")))
                Else
                    Response.Write("Mật khẩu cũ không chính xác")
                End If
            End If
            If Request.Form("GoodSea") IsNot Nothing Then
                If data("Gold") >= 300000 Then
                    Response.Write("fail")
                Else
                    Share.ChangeUserData(Session, "Gold", data("Gold") + 300000)
                End If
            End If
            If Request.Form("GetInvestmentTop") IsNot Nothing Then
                Dim dt As DataTable = Share.SQL.ExecuteQuery(String.Format("select top 5 *,  rank() over (order by Gold desc) as Rank, cast(Gold as money)/cast(sum(Gold) over() as money)*100 as Rate from Investment where IslandID={0} order by Rank asc", CInt(Request.Form("GetInvestmentTop"))))
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
                Response.Write(result)
            End If
            If Request.Form("GetTopIsland") IsNot Nothing Then
                Dim dt As DataTable = Share.SQL.ExecuteQuery(String.Format("select top 5 *,  rank() over (order by Gold desc) as Rank from Records where IslandID={0} order by Rank asc", CInt(Request.Form("GetTopIsland"))))
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
                Response.Write(result)
            End If
            If Request.Form("GetOtherShip") IsNot Nothing Then
                Dim result As String = ""
                Dim dt As DataTable = Share.SQL.ExecuteQuery(String.Format("select * from (select top 10 * from Users where (CurrentShip!=-1) and (ID!={0}) order by LastLogin desc) as t order by LastLogin asc", data("ID")))
                For Each dr As DataRow In dt.AsEnumerable()
                    result += CStr(dr("CurrentShip"))
                    result += "|"
                    result += CStr(dr("MapX"))
                    result += "|"
                    result += CStr(dr("MapY"))
                    result += "|"
                    result += CStr(dr("CharacterName"))
                    result += "||"
                Next
                Response.Write(result)
            End If
            If Request.Form("QuizCodeCheck") IsNot Nothing Then
                If Share.SQL.ExecuteQuery(String.Format("select ID from QuizCodes where QuizCode=N'{0}' and State=1", Request.Form("QuizCodeCheck").Replace("'", "''"))).Rows.Count <> 0 Then
                    If (Request.Form("QuizCodeCheck") = "") OrElse Share.SQL.ExecuteQuery(String.Format("select ID from Quiz where QuizCode=N'{0}' and UserID={1}", Request.Form("QuizCodeCheck").Replace("'", "''"), data("ID"))).Rows.Count = 0 Then
                        Response.Write("ok")
                    End If
                End If
            End If
            If Request.Form("QuizTime") IsNot Nothing Then
                If (Request.Form("QuizCode") = "") OrElse (Share.SQL.ExecuteQuery(String.Format("select ID from Quiz where QuizCode=N'{0}' and UserID={1}", Request.Form("QuizCode").Replace("'", "''"), data("ID"))).Rows.Count = 0) Then
                    Share.SQL.ExecuteCommand(String.Format("insert into Quiz(UserID, QuizCode, Time, Points) values({0}, N'{1}', {2}, {3})", data("ID"), Request.Form("QuizCode").Replace("'", "''"), CInt(Request.Form("QuizTime")), CInt(Request.Form("QuizPoints"))))
                End If
            End If
            Share.CloseConnection()
        End If
    End Sub
End Class