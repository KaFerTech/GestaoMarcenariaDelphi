object dmCadastroFornecedor: TdmCadastroFornecedor
  OldCreateOrder = False
  Height = 215
  Width = 333
  object qryCadastroFornecedor: TFDQuery
    Connection = dmConexao.fdConnection
    UpdateOptions.AutoIncFields = 'COD'
    SQL.Strings = (
      'select * from Fornecedor;')
    Left = 152
    Top = 16
  end
  object dspCadastroFornecedor: TDataSetProvider
    DataSet = qryCadastroFornecedor
    Left = 152
    Top = 80
  end
  object cdsCadastroFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadastroFornecedor'
    Left = 152
    Top = 144
  end
end
