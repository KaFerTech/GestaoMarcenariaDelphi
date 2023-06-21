unit unDmCadastroMaterial;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmCadastroMaterial = class(TDataModule)
    qryCadastroMaterial: TFDQuery;
    dspCadastroMaterial: TDataSetProvider;
    cdsCadastroMaterial: TClientDataSet;
    qryGrupoMaterial: TFDQuery;
    dspGrupoMaterial: TDataSetProvider;
    cdsGrupoMaterial: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadastroMaterial: TdmCadastroMaterial;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses UnDmConexao;

end.
