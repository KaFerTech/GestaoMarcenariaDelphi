unit unDmRelatorioUsuario;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider;

type
  TdmRelatorioUsuario = class(TDataModule)
    dspRelatorioUsuario: TDataSetProvider;
    qryRelatorioUsuario: TFDQuery;
    cdsRelatorioUsuario: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRelatorioUsuario: TdmRelatorioUsuario;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
