object dmCadastroCliente: TdmCadastroCliente
  OldCreateOrder = False
  Height = 234
  Width = 304
  object qryCadastroCliente: TFDQuery
    Connection = dmConexao.fdConnection
    SQL.Strings = (
      'SELECT '
      'a.COD, a.TIPOPESSOA CODTIPOPESSOA, '
      'case a.TIPOPESSOA when '#39'F'#39' then '#39'Fisica'#39' when '#39'J'#39' '
      'then '#39'Juridica'#39' end as TIPOPESSOA,'
      'a.CPFCNPJ, a.NOME, a.SIT CODSIT,'
      'case a.SIT when '#39'1'#39' then '#39'Ativo'#39' when '#39'0'#39' then '
      #39'Inativo'#39' end as SITUACAO,'
      'a.DATCAD, a.DATINAT, a.TELEFONE, a.CEP, a.UF, '
      'a.CIDADE, a.BAIRRO, a.TIPOLOGRADOURO, a.LOGRADOURO,'
      'a.NUMERO, a.COMPLEMENTO, '
      'a.TIPOENDERECO CODTIPOENDERECO,'
      'case a.TIPOENDERECO when '#39'C'#39' then '#39'Comercial'#39' '
      'when '#39'R'#39' then '#39'Residencial'#39' end as TIPO_ENDERECO'
      'FROM CLIENTE a ')
    Left = 152
    Top = 16
  end
  object dstCadastroCliente: TDataSetProvider
    DataSet = qryCadastroCliente
    Left = 152
    Top = 80
  end
  object cdsCadastroCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dstCadastroCliente'
    Left = 152
    Top = 144
  end
end
