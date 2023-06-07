inherited frmCadastroUsuario: TfrmCadastroUsuario
  Caption = 'Cadastro de Usu'#225'rios'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgFormPadrao: TDBGrid
    DataSource = dsCadastroUsuario
  end
  object gbU1: TGroupBox [3]
    Left = 8
    Top = 56
    Width = 417
    Height = 41
    Caption = 'Nome Completo'
    TabOrder = 3
    object edtNomeUsuario: TDBEdit
      Left = 3
      Top = 15
      Width = 411
      Height = 21
      DataField = 'NOME'
      DataSource = dsCadastroUsuario
      Enabled = False
      TabOrder = 0
      OnExit = edtNomeUsuarioExit
    end
  end
  object gbU2: TGroupBox [4]
    Left = 447
    Top = 56
    Width = 386
    Height = 41
    Caption = 'Login do Usu'#225'rio'
    TabOrder = 4
    object edtLoginUsuario: TDBEdit
      Left = 3
      Top = 15
      Width = 380
      Height = 21
      DataField = 'LOGIN'
      DataSource = dsCadastroUsuario
      Enabled = False
      TabOrder = 0
      OnEnter = edtLoginUsuarioEnter
    end
  end
  object gbU4: TGroupBox [5]
    Left = 8
    Top = 127
    Width = 209
    Height = 42
    Caption = 'Telefone'
    TabOrder = 5
    object edtTelefoneUsuario: TDBEdit
      Left = 3
      Top = 16
      Width = 203
      Height = 21
      DataSource = dsCadastroUsuario
      Enabled = False
      TabOrder = 0
    end
  end
  object gbU5: TGroupBox [6]
    Left = 240
    Top = 127
    Width = 369
    Height = 42
    Caption = 'E-mail do Usu'#225'rio'
    TabOrder = 6
    object edtEmailUsuario: TDBEdit
      Left = 3
      Top = 16
      Width = 363
      Height = 21
      DataField = 'EMAIL'
      DataSource = dsCadastroUsuario
      Enabled = False
      TabOrder = 0
    end
  end
  object gbU6: TGroupBox [7]
    Left = 632
    Top = 127
    Width = 201
    Height = 42
    Caption = 'Perfil de Acesso'
    TabOrder = 7
    object cboPerfilUsuario: TDBLookupComboBox
      Left = 3
      Top = 16
      Width = 195
      Height = 21
      DataField = 'CODPERFIL'
      DataSource = dsCadastroUsuario
      Enabled = False
      KeyField = 'COD'
      ListField = 'DESCRICAO'
      ListSource = dsPerfil
      TabOrder = 0
    end
  end
  object gbU8: TGroupBox [8]
    Left = 875
    Top = 103
    Width = 117
    Height = 41
    Caption = 'Data de Inclus'#227'o'
    TabOrder = 8
    object edtDataInclusaoUsuario: TDBEdit
      Left = 3
      Top = 15
      Width = 111
      Height = 21
      DataField = 'DATCAD'
      DataSource = dsCadastroUsuario
      Enabled = False
      TabOrder = 0
    end
  end
  object gbU9: TGroupBox [9]
    Left = 875
    Top = 196
    Width = 117
    Height = 40
    Caption = 'Data de Inativa'#231#227'o'
    TabOrder = 9
    object edtDataInativacaoUsuario: TDBEdit
      Left = 3
      Top = 14
      Width = 111
      Height = 21
      DataField = 'DATINAT'
      DataSource = dsCadastroUsuario
      Enabled = False
      TabOrder = 0
    end
  end
  object gbU10: TGroupBox [10]
    Left = 8
    Top = 197
    Width = 289
    Height = 41
    Caption = 'Senha'
    TabOrder = 10
    object btnVerSenha: TSpeedButton
      Left = 268
      Top = 15
      Width = 21
      Height = 22
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF9F9F9CCCCCCCCCCCCF9F9F9FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6F00000000000002
        02020202020000000000006F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        C4C4C4000000343434D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFD7D7D73434340000
        00C3C3C3FFFFFFFFFFFFFFFFFFA9A9A9000000CDCDCDFFFFFFFFFFFF0D0D0D00
        00000000000D0D0DFFFFFFFFFFFFCDCDCD000000A9A9A9FFFFFFEAEAEA000000
        EDEDEDFFFFFFFFFFFF0D0D0D565656FFFFFFFFFFFF5656560D0D0DFFFFFFFFFF
        FFEDEDED000000EBEBEB131313A3A3A3FFFFFFFFFFFFF5F5F5000000FFFFFFFF
        FFFFFFFFFFFFFFFF000000F5F5F5FFFFFFFFFFFFA3A3A3131313141414A2A2A2
        FFFFFFFFFFFFF5F5F5000000FFFFFFFFFFFFFFFFFFFFFFFF000000F5F5F5FFFF
        FFFFFFFFA2A2A2141414EBEBEB000000EDEDEDFFFFFFFFFFFF0C0C0C575757FF
        FFFFFFFFFF5656560D0D0DFFFFFFFFFFFFEDEDED000000EBEBEBFFFFFFA9A9A9
        000000CECECEFFFFFFFFFFFF0D0D0D0000000000000D0D0DFFFFFFFFFFFFCECE
        CE000000A9A9A9FFFFFFFFFFFFFFFFFFC3C3C3000000343434D7D7D7FFFFFFFF
        FFFFFFFFFFFFFFFFD7D7D7353535000000C3C3C3FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF6F6F6F0000000000000202020202020000000000006E6E6EFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9CC
        CCCCCCCCCCF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnMouseDown = btnVerSenhaMouseDown
      OnMouseUp = btnVerSenhaMouseUp
    end
    object edtSenhaUsuario: TEdit
      Left = 3
      Top = 15
      Width = 267
      Height = 21
      Enabled = False
      PasswordChar = '*'
      TabOrder = 0
    end
  end
  object gbU11: TGroupBox [11]
    Left = 319
    Top = 197
    Width = 290
    Height = 41
    Caption = 'Confirmar Senha'
    TabOrder = 11
    object edtConfirmaSenhaUsuario: TEdit
      Left = 3
      Top = 15
      Width = 284
      Height = 21
      Enabled = False
      PasswordChar = '*'
      TabOrder = 0
    end
  end
  object gbU7: TGroupBox [12]
    Left = 875
    Top = 150
    Width = 117
    Height = 40
    Caption = 'Situa'#231#227'o do Cadastro'
    TabOrder = 12
    object tgsSituacaoUsuario: TToggleSwitch
      Left = 3
      Top = 15
      Width = 72
      Height = 20
      Enabled = False
      State = tssOn
      TabOrder = 0
    end
  end
  object gbU3: TGroupBox [13]
    Left = 875
    Top = 56
    Width = 117
    Height = 41
    Caption = 'C'#243'digo'
    TabOrder = 13
    object edtCodigoUsuario: TDBEdit
      Left = 3
      Top = 15
      Width = 111
      Height = 21
      DataField = 'COD'
      DataSource = dsCadastroUsuario
      Enabled = False
      TabOrder = 0
    end
  end
  object dsCadastroUsuario: TDataSource
    DataSet = dmCadastroUsuario.cdsCadastroUsuario
    OnDataChange = dsCadastroUsuarioDataChange
    Left = 232
    Top = 368
  end
  object dsPerfil: TDataSource
    DataSet = dmCadastroUsuario.cdsPerfilUsuario
    Left = 312
    Top = 368
  end
end
