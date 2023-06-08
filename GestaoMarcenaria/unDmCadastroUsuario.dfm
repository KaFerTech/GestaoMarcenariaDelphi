object dmCadastroUsuario: TdmCadastroUsuario
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 212
  Width = 338
  object dspCadastroUsuario: TDataSetProvider
    DataSet = qryCadastroUsuario
    Left = 152
    Top = 80
  end
  object qryCadastroUsuario: TFDQuery
    Connection = dmConexao.fdConnection
    UpdateOptions.AutoIncFields = 'COD'
    SQL.Strings = (
      'select u.COD, NOME, LOGIN, TELEFONE, EMAIL, '
      'CODPERFIL, SIT, DATCAD DATA_CADASTRO, '
      'DATINAT DATA_INATIVACAO, SENHA,'
      'case sit when 1 then '#39'Ativo'#39' '
      'when 0 then '#39'Inativo'#39' end as Situacao,'
      'p.descricao Perfil'
      'from usuario u'
      'join perfil p on u.codperfil = p.cod'
      ';')
    Left = 152
    Top = 16
  end
  object cdsPerfilUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPerfilUsuario'
    Left = 264
    Top = 144
  end
  object dspPerfilUsuario: TDataSetProvider
    DataSet = qryPerfilUsuario
    Left = 264
    Top = 80
  end
  object qryPerfilUsuario: TFDQuery
    Connection = dmConexao.fdConnection
    SQL.Strings = (
      'select * from perfil')
    Left = 264
    Top = 16
  end
  object cdsCadastroUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadastroUsuario'
    Left = 152
    Top = 144
  end
end
