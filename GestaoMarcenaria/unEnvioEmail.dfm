object frmEnvioEmail: TfrmEnvioEmail
  Left = 0
  Top = 0
  Caption = 'Configura'#231#245'es de E-mail'
  ClientHeight = 463
  ClientWidth = 406
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 390
    Height = 44
    Caption = 'Configura'#231#245'es do Servidor'
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 20
      Width = 22
      Height = 13
      Caption = 'Host'
    end
    object Label2: TLabel
      Left = 271
      Top = 20
      Width = 26
      Height = 13
      Caption = 'Porta'
    end
    object edtHost: TEdit
      Left = 48
      Top = 17
      Width = 217
      Height = 21
      TabOrder = 0
    end
    object edtPorta: TEdit
      Left = 303
      Top = 17
      Width = 84
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 58
    Width = 390
    Height = 71
    Caption = 'Configura'#231#227'o do Usu'#225'rio'
    TabOrder = 1
    object Label3: TLabel
      Left = 14
      Top = 19
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object Label4: TLabel
      Left = 12
      Top = 46
      Width = 30
      Height = 13
      Caption = 'Senha'
    end
    object edtEmailUsuario: TEdit
      Left = 48
      Top = 16
      Width = 339
      Height = 21
      TabOrder = 0
    end
    object edtSenha: TEdit
      Left = 48
      Top = 43
      Width = 339
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 138
    Width = 390
    Height = 71
    Caption = 'Cabe'#231'alho E-mail'
    TabOrder = 2
    object Label6: TLabel
      Left = 14
      Top = 46
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object Label5: TLabel
      Left = 3
      Top = 19
      Width = 39
      Height = 13
      Caption = 'Assunto'
    end
    object edtAssunto: TEdit
      Left = 48
      Top = 16
      Width = 339
      Height = 21
      TabOrder = 0
    end
    object Edit6: TEdit
      Left = 48
      Top = 43
      Width = 339
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 217
    Width = 390
    Height = 170
    Caption = 'Descri'#231#227'o'
    TabOrder = 3
    object mmDescricao: TMemo
      Left = 2
      Top = 15
      Width = 386
      Height = 153
      Align = alClient
      Lines.Strings = (
        'mmDescricao')
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = 16
      ExplicitWidth = 185
      ExplicitHeight = 89
    end
  end
  object btnSalvar: TButton
    Left = 80
    Top = 393
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 4
  end
  object btnCancelar: TButton
    Left = 239
    Top = 393
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 96
    Top = 432
  end
  object IdSMTP1: TIdSMTP
    SASLMechanisms = <>
    Left = 128
    Top = 432
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 160
    Top = 432
  end
  object ImageList1: TImageList
    Left = 192
    Top = 432
  end
end
