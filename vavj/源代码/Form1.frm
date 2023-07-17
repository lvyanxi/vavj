VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   7410
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   13860
   LinkTopic       =   "Form1"
   ScaleHeight     =   7410
   ScaleWidth      =   13860
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton Command1 
      Caption         =   "ok"
      Height          =   375
      Left            =   11640
      TabIndex        =   3
      Top             =   6960
      Width           =   1095
   End
   Begin VB.TextBox Text2 
      Height          =   6015
      Left            =   480
      TabIndex        =   2
      Text            =   "Text2"
      Top             =   360
      Width           =   11775
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   1800
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   6840
      Width           =   9495
   End
   Begin VB.Label Label1 
      Caption         =   "vavj>"
      Height          =   375
      Left            =   1200
      TabIndex        =   1
      Top             =   6960
      Width           =   735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Dim userInput As String
    userInput = Text1.Text
    
    Dim command As String
    Dim argument As String
    
    ' 解析命令和参数
    Dim spaceIndex As Integer
    spaceIndex = InStr(userInput, " ")
    If spaceIndex > 0 Then
        command = Left(userInput, spaceIndex - 1)
        argument = Mid(userInput, spaceIndex + 1)
    Else
        command = userInput
        argument = ""
    End If
    
    ' 执行命令
    If command = "help" Then
        Text2.Text = "system studio & dr.83岁逮鼠冠军 联合制作" & vbCrLf & vbCrLf & "语法帮助" & vbCrLf & "printout <输出字符>" & vbCrLf & "mkfile <dir>" & vbCrLf & "addinfotofile <dir> <内容>"
    ElseIf command = "vavjinfo" Then
        Text2.Text = "版本信息：1.1.4" ' 将x.x.x替换为您的版本号
    ElseIf command = "printout" Then
        Text2.Text = argument
    ElseIf command = "mkfile" Then
        Dim filePath As String
        Dim fileName As String
        
        ' 解析路径和文件名
        Dim lastBackslashIndex As Integer
        lastBackslashIndex = InStrRev(argument, "\")
        If lastBackslashIndex > 0 Then
            filePath = Left(argument, lastBackslashIndex - 1)
            fileName = Mid(argument, lastBackslashIndex + 1)
        Else
            Text2.Text = "无效的路径和文件名。请按照格式mkfile <dir> <文件名>输入。"
            Exit Sub
        End If
        
        ' 创建文件
        Dim fileNumber As Integer
        fileNumber = FreeFile
        Open filePath & "\" & fileName For Output As fileNumber
        Close fileNumber
        
        Text2.Text = "已成功创建文件：" & filePath & "\" & fileName
    ElseIf command = "addinfotofile" Then
        
       
        
        ' 解析路径和内容
        Dim lastSpaceIndex As Integer
        lastSpaceIndex = InStrRev(argument, " ")
        If lastSpaceIndex > 0 Then
            filePath = Left(argument, lastSpaceIndex - 1)
            content = Mid(argument, lastSpaceIndex + 1)
        Else
            Text2.Text = "无效的路径和内容。请按照格式addinfotofile <dir> <内容>输入。"
            Exit Sub
        End If
        
        ' 写入文件
       
        fileNumber = FreeFile
        Open filePath For Append As fileNumber
        Print #fileNumber, content
        Close fileNumber
        
        Text2.Text = "已成功向文件 " & filePath & " 中添加内容：" & vbCrLf & content
    Else
        Text2.Text = "未知命令，请输入help获取帮助。"
    End If
End Sub
