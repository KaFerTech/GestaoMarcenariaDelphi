unit unEstoqueMaterial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unFormPadrao, Data.DB, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.WinXCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, System.UITypes;

type
  TfrmEstoqueMaterial = class(TfrmPadrao)
    dsEstoqueMaterial: TDataSource;
    gbF4: TGroupBox;
    edtCodigoEstoqueMaterial: TDBEdit;
    gbF5: TGroupBox;
    tgsSituacaoEstoqueMaterial: TToggleSwitch;
    GroupBox1: TGroupBox;
    edtDataInativacaoEstoqueMaterial: TDBEdit;
    GroupBox2: TGroupBox;
    edtDataInclusaoEstoqueMaterial: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsEstoqueMaterialDataChange(Sender: TObject; Field: TField);
    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaNomeGrid;
    procedure InclusaoEdicao;
    procedure DesativaCampos;
  public
    { Public declarations }
  end;

var
  frmEstoqueMaterial: TfrmEstoqueMaterial;

implementation

{$R *.dfm}

uses unDmEstoqueMaterial;

procedure TfrmEstoqueMaterial.actAlterarExecute(Sender: TObject);
begin
  inherited;
  InclusaoEdicao;
  dmEstoqueMaterial.cdsEstoqueMaterial.Edit;
//  edtNomeMaterial.SetFocus;
end;

procedure TfrmEstoqueMaterial.actCancelarExecute(Sender: TObject);
begin
  if messagedlg('Deseja mesmo cancelar o registro?', mtconfirmation,
    [mbyes, mbno], 0) = mryes then
  begin
    dmEstoqueMaterial.cdsEstoqueMaterial.Cancel;
    DesativaCampos;
    inherited;
  end;
end;

procedure TfrmEstoqueMaterial.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if messagedlg('Deseja mesmo excluir o registro?', mtconfirmation,
    [mbyes, mbno], 0) = mryes then

  begin
    dmEstoqueMaterial.cdsEstoqueMaterial.delete;
    dmEstoqueMaterial.cdsEstoqueMaterial.ApplyUpdates(0);
  end;
end;

procedure TfrmEstoqueMaterial.actIncluirExecute(Sender: TObject);
begin
  inherited;
  InclusaoEdicao;
  dmEstoqueMaterial.cdsEstoqueMaterial.append;
  edtDataInclusaoEstoqueMaterial.text := FormatDateTime('dd/mm/yyyy', date);
//  edtNomeMaterial.SetFocus;
end;

procedure TfrmEstoqueMaterial.actSalvarExecute(Sender: TObject);
begin
  if tgsSituacaoEstoqueMaterial.state = tssOn then
  begin
    dmEstoqueMaterial.cdsEstoqueMaterial.FieldByName('Sit').text := '1';
    edtDataInativacaoEstoqueMaterial.text := '';
  end
  else
  begin
    dmEstoqueMaterial.cdsEstoqueMaterial.FieldByName('Sit').text := '0';
    edtDataInativacaoEstoqueMaterial.text := FormatDateTime('dd/mm/yyyy', date);
  end;

  dmEstoqueMaterial.cdsEstoqueMaterial.post;
  if (dmEstoqueMaterial.cdsEstoqueMaterial.ChangeCount > 0) then
    dmEstoqueMaterial.cdsEstoqueMaterial.ApplyUpdates(-1);

  dmEstoqueMaterial.cdsEstoqueMaterial.Close;
  dmEstoqueMaterial.cdsEstoqueMaterial.Open;
  AtualizaNomeGrid;
  DesativaCampos;
  inherited;
end;

procedure TfrmEstoqueMaterial.AtualizaNomeGrid;
var
  i: Integer;
begin
  // Ajusta o tamanho dos campos do grid
  for i := 0 to dbgFormPadrao.Columns.Count - 1 do
  begin
    if dbgFormPadrao.Columns.Items[i].Title.caption = 'CODSIT' then
    begin
      dbgFormPadrao.Columns[i].Visible := false;
    end;
    dbgFormPadrao.Columns[i].Width := Canvas.TextWidth(dbgFormPadrao.Columns[i].Field.AsString) + 20;
  end;
end;

procedure TfrmEstoqueMaterial.DesativaCampos;
begin
//  edtNomeMaterial.Enabled := false;
//  tgsSituacaoEstoqueMaterial.Enabled := false;
//  tgsSituacaoEstoqueMaterial.state := tssOn;
end;

procedure TfrmEstoqueMaterial.dsEstoqueMaterialDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  if not(dmEstoqueMaterial.cdsEstoqueMaterial.state in [dsEdit, dsInsert])
  then
  begin

    if dmEstoqueMaterial.cdsEstoqueMaterial.FieldByName('Sit').text = '1'
    then
    begin
      tgsSituacaoEstoqueMaterial.state := tssOn;
    end
    else
    begin
      tgsSituacaoEstoqueMaterial.state := tssOff;
    end;
  end;
end;

procedure TfrmEstoqueMaterial.FormCreate(Sender: TObject);
begin
  inherited;
  // criando o datamodule de clientes para uso
  if not Assigned(dmEstoqueMaterial) then
    dmEstoqueMaterial := tdmEstoqueMaterial.Create(nil);
  dsEstoqueMaterial.dataset := dmEstoqueMaterial.cdsEstoqueMaterial;
end;

procedure TfrmEstoqueMaterial.FormDestroy(Sender: TObject);
begin
  inherited;
  // fecha o data set e destruo objeto
  if Assigned(dmEstoqueMaterial) then
  begin
    dmEstoqueMaterial.cdsEstoqueMaterial.Close;
    freeandnil(dmEstoqueMaterial);
  end;
end;

procedure TfrmEstoqueMaterial.FormShow(Sender: TObject);
begin
  inherited;
  // abro o dataset
  dmEstoqueMaterial.cdsEstoqueMaterial.Open;
  AtualizaNomeGrid;
end;

procedure TfrmEstoqueMaterial.InclusaoEdicao;
begin
//  edtNomeMaterial.Enabled := true;
//  tgsSituacaoEstoqueMaterial.Enabled := true;
//  tgsSituacaoEstoqueMaterial.state := tssOn;
end;

end.
