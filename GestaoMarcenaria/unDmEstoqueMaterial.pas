unit unDmEstoqueMaterial;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmEstoqueMaterial = class(TDataModule)
    qryEstoqueMaterial: TFDQuery;
    dspEstoqueMaterial: TDataSetProvider;
    cdsEstoqueMaterial: TClientDataSet;
    qryFuncionario: TFDQuery;
    dspFuncionario: TDataSetProvider;
    cdsFuncionario: TClientDataSet;
    qryMaterias: TFDQuery;
    dspMateriais: TDataSetProvider;
    cdsMateriais: TClientDataSet;
    qryItensEstoque: TFDQuery;
    dspItensEstoque: TDataSetProvider;
    cdsItensEstoque: TClientDataSet;
    qryMateriaisEmEstoque: TFDQuery;
    dspMateriaisEmEstoque: TDataSetProvider;
    cdsMateriaisEmEstoque: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEstoqueMaterial: TdmEstoqueMaterial;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses UnDmConexao;

end.
