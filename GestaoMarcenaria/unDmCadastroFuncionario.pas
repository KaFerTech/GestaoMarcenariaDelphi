unit unDmCadastroFuncionario;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider;

type
  TdmCadastroFuncionario = class(TDataModule)
    dspCadastroFuncionario: TDataSetProvider;
    qryCadastroFuncionario: TFDQuery;
    cdsUsuarioFuncionario: TClientDataSet;
    dspUsuarioFuncionario: TDataSetProvider;
    qryUsuarioFuncionario: TFDQuery;
    cdsCadastroFuncionario: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadastroFuncionario: TdmCadastroFuncionario;

implementation

uses UnDmConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
