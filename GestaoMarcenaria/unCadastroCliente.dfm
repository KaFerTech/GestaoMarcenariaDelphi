inherited frmCadastroCliente: TfrmCadastroCliente
  Caption = 'Cadastro de Clientes'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgFormPadrao: TDBGrid
    DataSource = dsCadastroCliente
  end
  object gbCpfCnpj: TGroupBox [3]
    Left = 150
    Top = 56
    Width = 225
    Height = 41
    Caption = 'CPF / CNPJ'
    TabOrder = 3
    object edtCpfCnpjCliente: TDBEdit
      Left = 3
      Top = 15
      Width = 219
      Height = 21
      DataField = 'CPFCNPJ'
      DataSource = dsCadastroCliente
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF3: TGroupBox [4]
    Left = 400
    Top = 56
    Width = 358
    Height = 41
    Caption = 'Nome'
    TabOrder = 4
    object edtNomeCliente: TDBEdit
      Left = 3
      Top = 15
      Width = 352
      Height = 21
      DataField = 'NOME'
      DataSource = dsCadastroCliente
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF4: TGroupBox [5]
    Left = 875
    Top = 56
    Width = 117
    Height = 41
    Caption = 'C'#243'digo'
    TabOrder = 5
    object edtCodigoCliente: TDBEdit
      Left = 3
      Top = 15
      Width = 111
      Height = 21
      DataField = 'COD'
      DataSource = dsCadastroCliente
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF5: TGroupBox [6]
    Left = 875
    Top = 150
    Width = 117
    Height = 41
    Caption = 'Situa'#231#227'o do Cadastro'
    TabOrder = 6
    object tgsSituacaoCliente: TToggleSwitch
      Left = 3
      Top = 16
      Width = 72
      Height = 20
      Enabled = False
      State = tssOn
      TabOrder = 0
    end
  end
  object gbF7: TGroupBox [7]
    Left = 8
    Top = 173
    Width = 97
    Height = 41
    Caption = 'CEP'
    TabOrder = 7
    object edtCepCliente: TDBEdit
      Left = 3
      Top = 15
      Width = 91
      Height = 21
      DataField = 'CEP'
      DataSource = dsCadastroCliente
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF8: TGroupBox [8]
    Left = 126
    Top = 173
    Width = 83
    Height = 41
    Caption = 'UF'
    TabOrder = 8
    object edtUfCliente: TDBEdit
      Left = 3
      Top = 15
      Width = 77
      Height = 21
      DataField = 'UF'
      DataSource = dsCadastroCliente
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF9: TGroupBox [9]
    Left = 228
    Top = 173
    Width = 297
    Height = 41
    Caption = 'Cidade'
    TabOrder = 9
    object edtCidadeCliente: TDBEdit
      Left = 3
      Top = 15
      Width = 291
      Height = 21
      DataField = 'CIDADE'
      DataSource = dsCadastroCliente
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF10: TGroupBox [10]
    Left = 544
    Top = 173
    Width = 297
    Height = 41
    Caption = 'Bairro'
    TabOrder = 10
    object edtBairroCliente: TDBEdit
      Left = 3
      Top = 15
      Width = 291
      Height = 21
      DataField = 'BAIRRO'
      DataSource = dsCadastroCliente
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF11: TGroupBox [11]
    Left = 8
    Top = 231
    Width = 217
    Height = 41
    Caption = 'Tipo do Logradouro'
    TabOrder = 11
    object edtTipoLogradouroCliente: TDBEdit
      Left = 3
      Top = 15
      Width = 211
      Height = 21
      DataField = 'TIPOLOGRADOURO'
      DataSource = dsCadastroCliente
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF12: TGroupBox [12]
    Left = 247
    Top = 231
    Width = 594
    Height = 41
    Caption = 'Logradouro'
    TabOrder = 12
    object edtLogradouroCliente: TDBEdit
      Left = 3
      Top = 15
      Width = 588
      Height = 21
      DataField = 'LOGRADOURO'
      DataSource = dsCadastroCliente
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF13: TGroupBox [13]
    Left = 8
    Top = 287
    Width = 129
    Height = 41
    Caption = 'Numero'
    TabOrder = 13
    object edtNumeroCliente: TDBEdit
      Left = 3
      Top = 15
      Width = 123
      Height = 21
      DataField = 'NUMERO'
      DataSource = dsCadastroCliente
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF14: TGroupBox [14]
    Left = 158
    Top = 287
    Width = 515
    Height = 41
    Caption = 'Complemento'
    TabOrder = 14
    object edtComplementoCliente: TDBEdit
      Left = 3
      Top = 15
      Width = 509
      Height = 21
      DataField = 'COMPLEMENTO'
      DataSource = dsCadastroCliente
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF6: TGroupBox [15]
    Left = 8
    Top = 119
    Width = 281
    Height = 41
    Caption = 'Telefone'
    TabOrder = 15
    object edtTelefoneCliente: TDBEdit
      Left = 3
      Top = 15
      Width = 275
      Height = 21
      DataField = 'TELEFONE'
      DataSource = dsCadastroCliente
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF15: TGroupBox [16]
    Left = 690
    Top = 287
    Width = 151
    Height = 41
    Caption = 'Tipo do Endere'#231'o'
    TabOrder = 16
    object rdbComercial: TRadioButton
      Left = 6
      Top = 16
      Width = 62
      Height = 17
      Caption = 'Comercial'
      Checked = True
      Enabled = False
      TabOrder = 0
      TabStop = True
    end
    object rdbResidencial: TRadioButton
      Left = 74
      Top = 16
      Width = 72
      Height = 17
      Caption = 'Residencial'
      Enabled = False
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox [17]
    Left = 875
    Top = 197
    Width = 117
    Height = 41
    Caption = 'Data de Inativa'#231#227'o'
    TabOrder = 17
    object edtDataInativacaoCliente: TDBEdit
      Left = 3
      Top = 15
      Width = 111
      Height = 21
      DataField = 'DATINAT'
      DataSource = dsCadastroCliente
      Enabled = False
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox [18]
    Left = 875
    Top = 103
    Width = 117
    Height = 41
    Caption = 'Data de Inclus'#227'o'
    TabOrder = 18
    object edtDataInclusaoCliente: TDBEdit
      Left = 3
      Top = 15
      Width = 111
      Height = 21
      DataField = 'DATCAD'
      DataSource = dsCadastroCliente
      Enabled = False
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox [19]
    Left = 8
    Top = 56
    Width = 116
    Height = 41
    Caption = 'Tipo'
    TabOrder = 19
    object rdbFisica: TRadioButton
      Left = 6
      Top = 16
      Width = 62
      Height = 17
      Caption = 'Fisica'
      Checked = True
      Enabled = False
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 57
      Top = 16
      Width = 58
      Height = 17
      Caption = 'Juridica'
      Enabled = False
      TabOrder = 1
    end
  end
  object dsCadastroCliente: TDataSource
    DataSet = dmCadastroCliente.cdsCadastroCliente
    OnDataChange = dsCadastroClienteDataChange
    Left = 232
    Top = 368
  end
end
