Partial Public Class registerAJAXCheck
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ColumnName As String
        Dim ColumnValue As String
        If Request.QueryString.Item("txtEmail") Is Nothing Then
            ColumnName = "Username"
            ColumnValue = Request.QueryString.Item("txtUsername")
        Else
            ColumnName = "Email"
            ColumnValue = Request.QueryString.Item("txtEmail")
        End If
        Dim SQL As New SQLConnect()
        Dim dt As DataTable = SQL.ExecuteQuery(String.Format("select * from Users where {0} = N'{1}'", ColumnName, ColumnValue.Replace("'", "''")))
        Response.Write((dt(0) Is Nothing).ToString().ToLower())
        SQL.CloseConnection()
    End Sub
End Class