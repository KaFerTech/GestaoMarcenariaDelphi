inherited frmCadastroFornecedor: TfrmCadastroFornecedor
  Caption = 'Cadastro de Fornecedores'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgFormPadrao: TDBGrid
    DataSource = dsCadastroFornecedor
  end
  object gbF1: TGroupBox [3]
    Left = 8
    Top = 56
    Width = 225
    Height = 41
    Caption = 'CNPJ'
    TabOrder = 3
    object edtCnpjFornecedor: TDBEdit
      Left = 3
      Top = 15
      Width = 219
      Height = 21
      DataField = 'CNPJ'
      DataSource = dsCadastroFornecedor
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF2: TGroupBox [4]
    Left = 256
    Top = 56
    Width = 281
    Height = 41
    Caption = 'Raz'#227'o Social'
    TabOrder = 4
    object edtRazaoSocialFornecedor: TDBEdit
      Left = 3
      Top = 15
      Width = 275
      Height = 21
      DataField = 'RAZAOSOCIAL'
      DataSource = dsCadastroFornecedor
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF3: TGroupBox [5]
    Left = 560
    Top = 56
    Width = 281
    Height = 41
    Caption = 'Nome Fantasia'
    TabOrder = 5
    object edtNomeFantasiaFornecedor: TDBEdit
      Left = 3
      Top = 15
      Width = 275
      Height = 21
      DataField = 'NOMEFANTASIA'
      DataSource = dsCadastroFornecedor
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF4: TGroupBox [6]
    Left = 875
    Top = 56
    Width = 117
    Height = 41
    Caption = 'C'#243'digo'
    TabOrder = 6
    object edtCodigoFornecedor: TDBEdit
      Left = 3
      Top = 15
      Width = 111
      Height = 21
      DataField = 'COD'
      DataSource = dsCadastroFornecedor
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF5: TGroupBox [7]
    Left = 875
    Top = 150
    Width = 117
    Height = 41
    Caption = 'Situa'#231#227'o do Cadastro'
    TabOrder = 7
    object tgsSituacaoFornecedor: TToggleSwitch
      Left = 3
      Top = 16
      Width = 72
      Height = 20
      Enabled = False
      State = tssOn
      TabOrder = 0
    end
  end
  object gbF7: TGroupBox [8]
    Left = 8
    Top = 173
    Width = 97
    Height = 41
    Caption = 'CEP'
    TabOrder = 8
    object edtCepFornecedor: TDBEdit
      Left = 3
      Top = 15
      Width = 91
      Height = 21
      DataField = 'CEP'
      DataSource = dsCadastroFornecedor
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF8: TGroupBox [9]
    Left = 126
    Top = 173
    Width = 83
    Height = 41
    Caption = 'UF'
    TabOrder = 9
    object edtUfFornecedor: TDBEdit
      Left = 3
      Top = 15
      Width = 77
      Height = 21
      DataField = 'UF'
      DataSource = dsCadastroFornecedor
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF9: TGroupBox [10]
    Left = 228
    Top = 173
    Width = 297
    Height = 41
    Caption = 'Cidade'
    TabOrder = 10
    object edtCidadeFornecedor: TDBEdit
      Left = 3
      Top = 15
      Width = 291
      Height = 21
      DataField = 'CIDADE'
      DataSource = dsCadastroFornecedor
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF10: TGroupBox [11]
    Left = 544
    Top = 173
    Width = 297
    Height = 41
    Caption = 'Bairro'
    TabOrder = 11
    object edtBairroFornecedor: TDBEdit
      Left = 3
      Top = 15
      Width = 291
      Height = 21
      DataField = 'BAIRRO'
      DataSource = dsCadastroFornecedor
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF11: TGroupBox [12]
    Left = 8
    Top = 231
    Width = 217
    Height = 41
    Caption = 'Tipo do Logradouro'
    TabOrder = 12
    object edtTipoLogradouroFornecedor: TDBEdit
      Left = 3
      Top = 15
      Width = 211
      Height = 21
      DataField = 'TIPOLOGRADOURO'
      DataSource = dsCadastroFornecedor
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF12: TGroupBox [13]
    Left = 247
    Top = 231
    Width = 594
    Height = 41
    Caption = 'Logradouro'
    TabOrder = 13
    object edtLogradouroFornecedor: TDBEdit
      Left = 3
      Top = 15
      Width = 588
      Height = 21
      DataField = 'LOGRADOURO'
      DataSource = dsCadastroFornecedor
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF13: TGroupBox [14]
    Left = 8
    Top = 287
    Width = 129
    Height = 41
    Caption = 'Numero'
    TabOrder = 14
    object edtNumeroFornecedor: TDBEdit
      Left = 3
      Top = 15
      Width = 123
      Height = 21
      DataField = 'NUMERO'
      DataSource = dsCadastroFornecedor
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF14: TGroupBox [15]
    Left = 158
    Top = 287
    Width = 515
    Height = 41
    Caption = 'Complemento'
    TabOrder = 15
    object edtComplementoFornecedor: TDBEdit
      Left = 3
      Top = 15
      Width = 509
      Height = 21
      DataField = 'COMPLEMENTO'
      DataSource = dsCadastroFornecedor
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF6: TGroupBox [16]
    Left = 8
    Top = 119
    Width = 281
    Height = 41
    Caption = 'Telefone'
    TabOrder = 16
    object edtTelefoneFornecedor: TDBEdit
      Left = 3
      Top = 15
      Width = 275
      Height = 21
      DataField = 'TELEFONE'
      DataSource = dsCadastroFornecedor
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF15: TGroupBox [17]
    Left = 690
    Top = 287
    Width = 151
    Height = 41
    Caption = 'Tipo do Endere'#231'o'
    TabOrder = 17
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
  object GroupBox1: TGroupBox [18]
    Left = 875
    Top = 197
    Width = 117
    Height = 41
    Caption = 'Data de Inativa'#231#227'o'
    TabOrder = 18
    object edtDataInativacaoFornecedor: TDBEdit
      Left = 3
      Top = 15
      Width = 111
      Height = 21
      DataField = 'DATINAT'
      DataSource = dsCadastroFornecedor
      Enabled = False
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox [19]
    Left = 875
    Top = 103
    Width = 117
    Height = 41
    Caption = 'Data de Inclus'#227'o'
    TabOrder = 19
    object edtDataInclusaoFornecedor: TDBEdit
      Left = 3
      Top = 15
      Width = 111
      Height = 21
      DataField = 'DATCAD'
      DataSource = dsCadastroFornecedor
      Enabled = False
      TabOrder = 0
    end
  end
  inherited imgListFormPadrao: TImageList
    Left = 120
  end
  inherited actFormPadrao: TActionList
    Left = 24
  end
  object dsCadastroFornecedor: TDataSource
    DataSet = dmCadastroFornecedor.cdsCadastroFornecedor
    OnDataChange = dsCadastroFornecedorDataChange
    Left = 232
    Top = 368
  end
end
