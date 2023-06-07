unit unRelatorioUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB;

type
  TfrmRelatorioUsuario = class(TForm)
    RLReport1: TRLReport;
    dsRelatorioUsuario: TDataSource;
    RLBand1: TRLBand;
    RLDetailGrid1: TRLDetailGrid;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText7: TRLDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioUsuario: TfrmRelatorioUsuario;

implementation

{$R *.dfm}

uses unDmRelatorioUsuario;



procedure TfrmRelatorioUsuario.FormCreate(Sender: TObject);
begin
  if not Assigned(dmRelatorioUsuario) then
    dmRelatorioUsuario := tdmRelatorioUsuario.Create(nil);
  dsRelatorioUsuario.dataset := dmRelatorioUsuario.cdsRelatorioUsuario;
end;

procedure TfrmRelatorioUsuario.FormDestroy(Sender: TObject);
begin
  if Assigned(dmRelatorioUsuario) then
  begin
    dmRelatorioUsuario.cdsRelatorioUsuario.Close;
    freeandnil(dmRelatorioUsuario);
  end;
end;

procedure TfrmRelatorioUsuario.FormShow(Sender: TObject);
begin
  dmRelatorioUsuario.cdsRelatorioUsuario.Open;
end;

end.