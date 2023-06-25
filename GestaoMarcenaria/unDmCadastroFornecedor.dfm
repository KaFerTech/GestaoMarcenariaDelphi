object dmCadastroFornecedor: TdmCadastroFornecedor
  OldCreateOrder = False
  Height = 215
  Width = 333
  object qryCadastroFornecedor: TFDQuery
    Connection = dmConexao.fdConnection
    UpdateOptions.AutoIncFields = 'COD'
    SQL.Strings = (
      'SELECT a.COD, a.CNPJ, a.RAZAOSOCIAL, a.NOMEFANTASIA, '
      'a.SIT CODSIT, case a.SIT when '#39'1'#39' Then '#39'Ativo'#39
      'when '#39'0'#39' then '#39'Inativo'#39' end as SITUACAO,'
      'a.DATCAD, a.DATINAT, a.TELEFONE, a.CEP, a.UF, '
      'a.CIDADE, a.BAIRRO, a.TIPOLOGRADOURO, a.LOGRADOURO,'
      'a.NUMERO, a.COMPLEMENTO, a.TIPOENDERECO CODTIPOENDERECO,'
      'case a.TIPOENDERECO when '#39'C'#39' Then '#39'Comercial'#39
      'when '#39'R'#39' then '#39'Residencial'#39' end as TIPOENDERECO'
      'FROM FORNECEDOR a ')
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
