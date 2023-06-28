inherited frmOrdemServico: TfrmOrdemServico
  Caption = 'Ordem de Servi'#231'o'
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox [3]
    Left = 875
    Top = 197
    Width = 117
    Height = 41
    Caption = 'Data do Status'
    TabOrder = 3
    object edtDataStatusOS: TDBEdit
      Left = 3
      Top = 15
      Width = 111
      Height = 21
      DataField = 'DATINAT'
      Enabled = False
      TabOrder = 0
    end
  end
  object gbF5: TGroupBox [4]
    Left = 875
    Top = 150
    Width = 117
    Height = 41
    Caption = 'Status da OS'
    TabOrder = 4
    object cboStatusOS: TDBComboBox
      Left = 3
      Top = 15
      Width = 111
      Height = 21
      Items.Strings = (
        'Or'#231'amento'
        'Aguardando aprova'#231#227'o'
        'Planejamento e projeto'
        'Aguardando confirma'#231#227'o'
        'Em produ'#231#227'o'
        'Acabamento'
        'Montagem'
        'Testes e qualidade'
        'Entrega')
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox [5]
    Left = 875
    Top = 103
    Width = 117
    Height = 41
    Caption = 'Data de Inclus'#227'o'
    TabOrder = 5
    object edtDataInclusaoOS: TDBEdit
      Left = 3
      Top = 15
      Width = 111
      Height = 21
      DataField = 'DATCAD'
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
    object edtCodigoOS: TDBEdit
      Left = 3
      Top = 15
      Width = 111
      Height = 21
      DataField = 'COD'
      Enabled = False
      TabOrder = 0
    end
  end
end
