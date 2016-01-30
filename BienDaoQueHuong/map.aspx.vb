Public Partial Class map
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Share.CheckLogin(Session, Response) Then
            Share.OpenConnection()
            Dim data As DataRow = Share.GetUserData(Session)
            hidMapX.Value = data("MapX")
            hidMapY.Value = data("MapY")
            hidShipID.Value = data("CurrentShip")
            litGold.Text = data("Gold")
            hidAllowRestart.Value = CStr((data("Gold") + data("Bank")) < 50000).ToLower()
            hidCharacterName.Value = data("CharacterName")
            Share.CloseConnection()
        End If
    End Sub
End Class