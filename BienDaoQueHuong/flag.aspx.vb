Public Partial Class flag
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Share.CheckLogin(Session, Response) Then
            Share.OpenConnection()
            Dim data As DataRow = Share.GetUserData(Session)
            litFlag.Text = data("CurrentFlag")
            Share.CloseConnection()
        End If
    End Sub
End Class