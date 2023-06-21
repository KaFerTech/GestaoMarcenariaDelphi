unit unDmCadastroCliente;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmCadastroCliente = class(TDataModule)
    qryCadastroCliente: TFDQuery;
    dstCadastroCliente: TDataSetProvider;
    cdsCadastroCliente: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadastroCliente: TdmCadastroCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses UnDmConexao;

end.
