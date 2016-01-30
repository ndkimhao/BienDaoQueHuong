Imports System.Data
Imports System.IO
Imports System.Configuration
Imports System.Web
Imports System.Data.SqlClient
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Public Class SQLConnect
    Public conn As SqlConnection

    Public Sub New()
        OpenConnection()
    End Sub

    Public Sub OpenConnection()
        conn = New SqlConnection("Server=localhost;User ID=sa;Password=123456;Database=BienDaoQueHuong")
        'conn = New SqlConnection("Data Source=10.0.0.109;Initial Catalog=kimhieuBDQH;User Id=kimhieuBDQH;Password=GAf016baolt")
        'conn = New SqlConnection("Server=MB2D76\sql2008;User ID=bie40d12_BienDaoQueHuong;Password=74WNsfKYxdel0z7p;Database=bie40d12_BienDaoQueHuong")
        'conn = New SqlConnection("workstation id=BienDaoQueHuong.mssql.somee.com;packet size=4096;user id=kimhao0004_SQLLogin_1;pwd=udlnx1merk;data source=BienDaoQueHuong.mssql.somee.com;persist security info=False;initial catalog=BienDaoQueHuong")
        conn.Open()
    End Sub

    Public Sub CloseConnection()
        conn.Close()
        conn.Dispose()
        conn = Nothing
    End Sub

    Public Sub ExecuteCommand(ByVal SQLString As String)
        Dim cmd As New SqlCommand(SQLString, conn)
        cmd.ExecuteNonQuery()
    End Sub

    Public Function ExecuteQuery(ByVal SQLString As String) As DataTable
        Dim adapt As New SqlDataAdapter(SQLString, conn)
        Dim dt As New DataTable()
        adapt.Fill(dt)
        Return dt
    End Function
End Class