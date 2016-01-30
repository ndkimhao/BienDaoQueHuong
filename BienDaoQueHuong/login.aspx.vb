Public Partial Class login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Share.IsLogined(Session) Then
            Response.Redirect("map.aspx")
        Else
            Share.OpenConnection()
            If IsPostBack And Request.Form("txtUsername") IsNot Nothing Then
                Dim Username As String = Request.Form("txtUsername").Replace("'", "''")
                Dim Password As String = Request.Form("txtPassword").Replace("'", "''")

                Dim dt As DataTable = Share.SQL.ExecuteQuery(String.Format("select * from Users where Username = N'{0}' and Password = N'{1}'", Username, Share.GeneratePasswordHash(Password)))
                If dt(0) Is Nothing Then
                    Session("Username") = Nothing
                    Response.Write("<script>alert(""Tên đăng nhập hoặc mật khẩu sai !\nVui lòng thử lại !"");</script>")
                Else
                    Share.SQL.ExecuteCommand(String.Format("update Users set LastLogin = getDate() where Username = N'{0}'", Username))
                    If Request.Form("chRemember") = "Remember" Then
                        Dim SessionID As String = Session.SessionID
                        Response.Cookies("ASP.NET_SessionId").Expires = DateTime.Now.AddDays(7)
                        Response.Cookies("ASP.NET_SessionId").Value = SessionID
                    End If
                    Session("Username") = Username
                    Response.Redirect("profiles.aspx")
                End If
            Else
                Share.RegenerateSessionID(Context)
            End If
            litUsersCount.Text = Share.GetUsersCount()
            Share.CloseConnection()
        End If
    End Sub
End Class