Imports System.Security.Cryptography

Public Class Share
    Public Shared SQL As SQLConnect

    Public Shared Function CheckLogin(ByVal Session As HttpSessionState, ByVal Response As HttpResponse) As Boolean
        If Session("Username") Is Nothing Then
            Response.Write("<script>alert(""Bạn phải đăng nhập mới có thể vào trang này được !"");window.location.href=""login.aspx"";</script>")
            Response.End()
            Return False
        Else
            Return True
        End If
    End Function

    Public Shared Function IsLogined(ByVal Session As HttpSessionState) As Boolean
        Return Session("Username") IsNot Nothing
    End Function

    Public Shared Function GetUsername(ByVal Session As HttpSessionState) As String
        Return Session("Username")
    End Function

    Public Shared Sub OpenConnection()
        SQL = New SQLConnect()
    End Sub

    Public Shared Sub CloseConnection()
        SQL.CloseConnection()
    End Sub

    Public Shared Function GetUserData(ByVal Session As HttpSessionState) As DataRow
        Dim Username As String = GetUsername(Session)
        Dim dt As DataTable = SQL.ExecuteQuery(String.Format("select * from (select *,  rank() over (order by (Gold+Bank) desc) as Rank from Users) as RankedUser where Username = N'{0}'", Username.Replace("'", "''")))
        Dim data As DataRow = dt(0)
        Return data
    End Function

    Public Shared Sub ChangeUserData(ByVal Session As HttpSessionState, ByVal ColumnName As String, ByVal ColumnValue As String)
        SQL.ExecuteCommand(String.Format("update Users set {0} = N'{1}' where Username = N'{2}'", ColumnName, ColumnValue.Replace("'", "''"), GetUsername(Session).Replace("'", "''")))
    End Sub

    Public Shared Function GetUsersCount() As String
        Dim result As String = "<span class=""red"">"
        result += CStr(SQL.ExecuteQuery("select count(*) as Count from Users")(0)("Count"))
        result += "</span> - Thành viên mới đăng ký: <span class=""blue"">"
        result += CStr(SQL.ExecuteQuery("select top 1 * from Users order by RegistrationDate desc")(0)("CharacterName"))
        result += "</span>"
        Return result
    End Function

    Public Shared Sub RegenerateSessionID(ByVal Context As HttpContext)
        Dim Manager As New SessionIDManager()
        Dim NewID As String = Manager.CreateSessionID(Context)
        Dim Redirected As Boolean = False
        Dim CookieAdded As Boolean = False
        Manager.SaveSessionID(Context, NewID, Redirected, CookieAdded)
    End Sub

    Public Shared Function GenerateMD5Hash(ByVal SourceText As String) As String
        Dim provider As MD5CryptoServiceProvider
        Dim bytValue() As Byte
        Dim bytHash() As Byte
        Dim strOutput As String = ""
        Dim i As Integer
        provider = New MD5CryptoServiceProvider()
        bytValue = System.Text.Encoding.Unicode.GetBytes(SourceText)
        bytHash = provider.ComputeHash(bytValue)
        provider.Clear()
        For i = 0 To bytHash.Length - 1
            strOutput &= bytHash(i).ToString("x").PadLeft(2, "0")
        Next
        Return strOutput
    End Function

    Public Shared Function GeneratePasswordHash(ByVal Password As String) As String
        Dim result As String = Password
        result = GenerateMD5Hash("ApxTndlFcz4YfYL2" + result + "qgXlnsKRUPhRJqPB")
        result = GenerateMD5Hash("h5cn3vfl2nYOmJGV" + result + "2mGyZK3mj3giVAI0").ToUpper()
        result = GenerateMD5Hash("8fgXGYeqtJJsp90u" + result + "tNmjiJjgVzfk0L9g")
        result = GenerateMD5Hash("ptckQjYUCnYqkoDN" + result + "dw153mpohJgjFIMh").ToUpper()
        result = GenerateMD5Hash("JrB0ttQm7u17WtQB" + result + "2pcgyGu5Ng8Y983T")
        Return result
    End Function

    Public Shared Function GetRegisterOrProfile(ByVal Session As HttpSessionState) As String
        If IsLogined(Session) Then
            Return "<li><a href=""profiles.aspx"">Tài Khoản</a></li>"
        Else
            Return "<li><a href=""register.aspx"">Đăng Ký</a></li>"
        End If
    End Function

    Public Shared Function FormatNumber(ByVal number As Long) As String
        Return number.ToString("###,###,###,###")
    End Function
End Class
