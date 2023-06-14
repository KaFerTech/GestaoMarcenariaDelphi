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
      'f.GENERO CODGENERO, '
      'case f.genero when '#39'M'#39' then '#39'Masculino'#39' '
      'when '#39'F'#39' then '#39'Feminino'#39' end as GENERO,'
      'f.NACION, f.TIPFUNC, f.CARGO,'
      'f.DEPART, f.SIT, '
      'case f.sit when 1 then '#39'Ativo'#39' '
      'when 0 then '#39'Inativo'#39' end as SITUACAO,'
      'f.DATCAD, f.DATINAT, '
      'f.TELEFONE, f.CEP, f.UF, f.CIDADE,'
      'f.BAIRRO, f.TIPOLOGRADOURO, f.LOGRADOURO, '
      'f.NUMERO, f.COMPLEMENTO,f.TIPOENDERECO CODTIPENDER,'
      'case f.TIPOENDERECO when '#39'R'#39' then '#39'Residencial'#39' '
      'when '#39'C'#39' then '#39'Comercial'#39' end as TIPOENDERECO,'
      'f.CODUSUARIO, u.NOME USUARIO'
      'FROM FUNCIONARIO f'
      'JOIN USUARIO u ON u.COD = f.CODUSUARIO')
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
