unit unDmLogin;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider,
  Datasnap.DBClient;

type
  TdmLogin = class(TDataModule)
    qryLogin: TFDQuery;
    dspLogin: TDataSetProvider;
    cdsLogin: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmLogin: TdmLogin;

implementation

uses unDmConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
