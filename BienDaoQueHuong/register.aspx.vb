Public Partial Class register
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Share.IsLogined(Session) Then
            Response.Write("<script>alert(""Bạn đã có tài khoản rồi !"");window.location.href=""login.aspx"";</script>")
        Else
            Share.OpenConnection()
            If IsPostBack And Request.Form("txtUsername") IsNot Nothing Then
                Dim Username As String = Request.Form("txtUsername").Replace("'", "''")
                Dim Password As String = Request.Form("txtPassword").Replace("'", "''")
                Dim Email As String = Request.Form("txtEmail").Replace("'", "''")
                Dim CharacterName As String = Request.Form("txtCharacterName").Replace("'", "''")
                Dim AvatarID As Integer = Request.Form("hidAvatarID")

                Share.SQL.ExecuteCommand(String.Format("insert into Users(Username, Password, Email, CharacterName, AvatarID) values(N'{0}', N'{1}', N'{2}', N'{3}', {4})", Username, Share.GeneratePasswordHash(Password), Email, CharacterName, AvatarID))
                Response.Write("<script>alert(""Chúc mừng bạn đã đăng ký thành công !\nHãy đăng nhập ngay để vào chơi !"");window.location.href=""Default.aspx"";</script>")
            End If
            litUsersCount.Text = Share.GetUsersCount()
            Share.CloseConnection()
        End If
    End Sub
End Class