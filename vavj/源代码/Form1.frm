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
   StartUpPosition =   3  '����ȱʡ
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
    
    ' ��������Ͳ���
    Dim spaceIndex As Integer
    spaceIndex = InStr(userInput, " ")
    If spaceIndex > 0 Then
        command = Left(userInput, spaceIndex - 1)
        argument = Mid(userInput, spaceIndex + 1)
    Else
        command = userInput
        argument = ""
    End If
    
    ' ִ������
    If command = "help" Then
        Text2.Text = "system studio & dr.83�����ھ� ��������" & vbCrLf & vbCrLf & "�﷨����" & vbCrLf & "printout <����ַ�>" & vbCrLf & "mkfile <dir>" & vbCrLf & "addinfotofile <dir> <����>"
    ElseIf command = "vavjinfo" Then
        Text2.Text = "�汾��Ϣ��1.1.4" ' ��x.x.x�滻Ϊ���İ汾��
    ElseIf command = "printout" Then
        Text2.Text = argument
    ElseIf command = "mkfile" Then
        Dim filePath As String
        Dim fileName As String
        
        ' ����·�����ļ���
        Dim lastBackslashIndex As Integer
        lastBackslashIndex = InStrRev(argument, "\")
        If lastBackslashIndex > 0 Then
            filePath = Left(argument, lastBackslashIndex - 1)
            fileName = Mid(argument, lastBackslashIndex + 1)
        Else
            Text2.Text = "��Ч��·�����ļ������밴�ո�ʽmkfile <dir> <�ļ���>���롣"
            Exit Sub
        End If
        
        ' �����ļ�
        Dim fileNumber As Integer
        fileNumber = FreeFile
        Open filePath & "\" & fileName For Output As fileNumber
        Close fileNumber
        
        Text2.Text = "�ѳɹ������ļ���" & filePath & "\" & fileName
    ElseIf command = "addinfotofile" Then
        
       
        
        ' ����·��������
        Dim lastSpaceIndex As Integer
        lastSpaceIndex = InStrRev(argument, " ")
        If lastSpaceIndex > 0 Then
            filePath = Left(argument, lastSpaceIndex - 1)
            content = Mid(argument, lastSpaceIndex + 1)
        Else
            Text2.Text = "��Ч��·�������ݡ��밴�ո�ʽaddinfotofile <dir> <����>���롣"
            Exit Sub
        End If
        
        ' д���ļ�
       
        fileNumber = FreeFile
        Open filePath For Append As fileNumber
        Print #fileNumber, content
        Close fileNumber
        
        Text2.Text = "�ѳɹ����ļ� " & filePath & " ��������ݣ�" & vbCrLf & content
    Else
        Text2.Text = "δ֪���������help��ȡ������"
    End If
End Sub
