object dmRelatorioUsuario: TdmRelatorioUsuario
  OldCreateOrder = False
  Height = 264
  Width = 362
  object dspRelatorioUsuario: TDataSetProvider
    DataSet = qryRelatorioUsuario
    Left = 160
    Top = 104
  end
  object qryRelatorioUsuario: TFDQuery
    Connection = dmConexao.fdConnection
    UpdateOptions.AutoIncFields = 'COD'
    SQL.Strings = (
      'select u.COD, NOME, LOGIN, TELEFONE, EMAIL, CODPERFIL, SIT, '
      'DATCAD, DATINAT, case sit when 1 then '#39'Ativo'#39' '
      'when 0 then '#39'Inativo'#39' end as Situacao,'
      'p.descricao Perfil'
      'from usuario u'
      'join perfil p on u.codperfil = p.cod'
      ';')
    Left = 160
    Top = 40
  end
  object cdsRelatorioUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelatorioUsuario'
    Left = 160
    Top = 168
  end
end
