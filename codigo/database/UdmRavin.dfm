object dmRavin: TdmRavin
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 421
  Width = 603
  object drvBancoDeDados: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\Guilhermehillesheim\Documents\Delphi-Avancado\database\' +
      'libmysql.dll'
    Left = 40
    Top = 80
  end
  object wtcBancoDeDados: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 40
    Top = 136
  end
  object cnxBancoDeDados: TFDConnection
    Params.Strings = (
      'Port='
      'Server='
      'DriverID=MySQL')
    LoginPrompt = False
    AfterConnect = cnxBancoDeDadosAfterConnect
    BeforeConnect = cnxBancoDeDadosBeforeConnect
    Left = 40
    Top = 30
  end
end
