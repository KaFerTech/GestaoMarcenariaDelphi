object dmConexao: TdmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 224
  Width = 377
  object fdConnection: TFDConnection
    ConnectionName = 'ConexaoMarcenaria'
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'CharacterSet=UTF8'
      
        'Database=C:\Users\kaiqu\OneDrive\Documentos\GitHub\GestaoMarcena' +
        'riaDelphi\GestaoMarcenaria\Win32\Debug\DBMARCENARIADOCATARINA.FD' +
        'B'
      'DriverID=FbDriverLink')
    Left = 176
    Top = 32
  end
  object fbDriverLink: TFDPhysFBDriverLink
    DriverID = 'FbDriverLink'
    Left = 176
    Top = 88
  end
  object wcConexao: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 176
    Top = 152
  end
end
