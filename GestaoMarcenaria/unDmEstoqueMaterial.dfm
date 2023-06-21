object dmEstoqueMaterial: TdmEstoqueMaterial
  OldCreateOrder = False
  Height = 271
  Width = 347
  object qryEstoqueMaterial: TFDQuery
    Connection = dmConexao.fdConnection
    UpdateOptions.AutoIncFields = 'COD'
    Left = 168
    Top = 40
  end
  object dspEstoqueMaterial: TDataSetProvider
    DataSet = qryEstoqueMaterial
    Left = 168
    Top = 104
  end
  object cdsEstoqueMaterial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstoqueMaterial'
    Left = 168
    Top = 168
  end
end
