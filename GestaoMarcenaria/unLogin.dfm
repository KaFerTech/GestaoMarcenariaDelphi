object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Marcenaria do Catarina'
  ClientHeight = 260
  ClientWidth = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 213
    Top = 53
    Width = 25
    Height = 13
    Caption = 'Login'
  end
  object Label2: TLabel
    Left = 213
    Top = 117
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object edtLogin: TEdit
    Left = 135
    Top = 72
    Width = 180
    Height = 21
    TabOrder = 0
    Text = 'teste'
  end
  object edtSenha: TEdit
    Left = 135
    Top = 136
    Width = 180
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    Text = 'teste'
  end
  object btnEntrar: TButton
    Left = 187
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Entrar'
    TabOrder = 2
    OnClick = btnEntrarClick
  end
end
