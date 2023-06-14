object dmCadastroFuncionario: TdmCadastroFuncionario
  OldCreateOrder = False
  Height = 244
  Width = 370
  object dspCadastroFuncionario: TDataSetProvider
    DataSet = qryCadastroFuncionario
    Left = 152
    Top = 80
  end
  object qryCadastroFuncionario: TFDQuery
    Connection = dmConexao.fdConnection
    UpdateOptions.AutoIncFields = 'COD'
    SQL.Strings = (
      'SELECT f.COD, f.CPF, f.NOME, f.DATNASC, '
      'f.GENERO, f.NACION, f.TIPFUNC, f.CARGO,'
      'f.DEPART, f.SIT, f.DATCAD, f.DATINAT, '
      'f.TELEFONE, f.CEP, f.UF, f.CIDADE,'
      'f.BAIRRO, f.TIPOLOGRADOURO, f.LOGRADOURO, '
      'f.NUMERO, f.COMPLEMENTO,f.TIPOENDERECO,'
      'f.CODUSUARIO'
      'FROM FUNCIONARIO f')
    Left = 152
    Top = 16
  end
  object cdsUsuarioFuncionario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarioFuncionario'
    Left = 280
    Top = 144
  end
  object dspUsuarioFuncionario: TDataSetProvider
    DataSet = qryUsuarioFuncionario
    Left = 280
    Top = 80
  end
  object qryUsuarioFuncionario: TFDQuery
    Connection = dmConexao.fdConnection
    SQL.Strings = (
      'select * from usuario')
    Left = 280
    Top = 16
  end
  object cdsCadastroFuncionario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadastroFuncionario'
    Left = 152
    Top = 144
  end
end
