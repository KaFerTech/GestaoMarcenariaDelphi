inherited frmEstoqueMaterial: TfrmEstoqueMaterial
  Caption = 'Estoque de Materiais'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgFormPadrao: TDBGrid
    DataSource = dsEstoqueMaterial
  end
  object gbF4: TGroupBox [3]
    Left = 875
    Top = 56
    Width = 117
    Height = 41
    Caption = 'C'#243'digo'
    TabOrder = 3
    object edtCodigoEstoqueMaterial: TDBEdit
      Left = 3
      Top = 15
      Width = 111
      Height = 21
      DataField = 'COD'
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF5: TGroupBox [4]
    Left = 875
    Top = 150
    Width = 117
    Height = 41
    Caption = 'Situa'#231#227'o do Cadastro'
    TabOrder = 4
    object tgsSituacaoEstoqueMaterial: TToggleSwitch
      Left = 3
      Top = 16
      Width = 72
      Height = 20
      Enabled = False
      State = tssOn
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox [5]
    Left = 875
    Top = 197
    Width = 117
    Height = 41
    Caption = 'Data de Inativa'#231#227'o'
    TabOrder = 5
    object edtDataInativacaoEstoqueMaterial: TDBEdit
      Left = 3
      Top = 15
      Width = 111
      Height = 21
      DataField = 'DATINAT'
      Enabled = False
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox [6]
    Left = 875
    Top = 103
    Width = 117
    Height = 41
    Caption = 'Data de Inclus'#227'o'
    TabOrder = 6
    object edtDataInclusaoEstoqueMaterial: TDBEdit
      Left = 3
      Top = 15
      Width = 111
      Height = 21
      DataField = 'DATCAD'
      Enabled = False
      TabOrder = 0
    end
  end
  object dsEstoqueMaterial: TDataSource
    DataSet = dmEstoqueMaterial.cdsEstoqueMaterial
    OnDataChange = dsEstoqueMaterialDataChange
    Left = 232
    Top = 368
  end
end
