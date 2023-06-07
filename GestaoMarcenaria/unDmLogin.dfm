object dmLogin: TdmLogin
  OldCreateOrder = False
  Height = 236
  Width = 361
  object qryLogin: TFDQuery
    Connection = dmConexao.fdConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'select LOGIN, SENHA from usuario')
    Left = 168
    Top = 24
  end
  object dspLogin: TDataSetProvider
    DataSet = qryLogin
    Left = 168
    Top = 88
  end
  object cdsLogin: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLogin'
    Left = 168
    Top = 152
  end
end
