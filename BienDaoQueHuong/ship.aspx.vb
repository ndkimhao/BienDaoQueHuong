Public Partial Class ship
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Share.CheckLogin(Session, Response) Then
            Share.OpenConnection()
            Dim data As DataRow = Share.GetUserData(Session)
            hidShipID.Value = data("CurrentShip")
            Share.CloseConnection()
        End If
    End Sub
End Class