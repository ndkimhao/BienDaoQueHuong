Public Partial Class intro
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Share.OpenConnection()
        litUsersCount.Text = Share.GetUsersCount()
        Share.CloseConnection()
        litRegisterOrProfile.Text = Share.GetRegisterOrProfile(Session)
    End Sub
End Class