unit unGrupoMaterial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unFormPadrao, Data.DB, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.WinXCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, System.UITypes;

type
  TfrmGrupoMaterial = class(TfrmPadrao)
    gbF4: TGroupBox;
    edtCodigoGrupoMaterial: TDBEdit;
    gbF5: TGroupBox;
    tgsSituacaoGrupoMaterial: TToggleSwitch;
    GroupBox1: TGroupBox;
    edtDataInativacaoGrupoMaterial: TDBEdit;
    GroupBox2: TGroupBox;
    edtDataInclusaoGrupoMaterial: TDBEdit;
    gbF3: TGroupBox;
    edtNomeGrupoMaterial: TDBEdit;
    dsGrupoMaterial: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsGrupoMaterialDataChange(Sender: TObject; Field: TField);
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
  frmGrupoMaterial: TfrmGrupoMaterial;

implementation

{$R *.dfm}

uses unDmGrupoMaterial;

procedure TfrmGrupoMaterial.actAlterarExecute(Sender: TObject);
begin
  inherited;
  InclusaoEdicao;
  dmGrupoMaterial.cdsGrupoMaterial.Edit;
  edtNomeGrupoMaterial.SetFocus;
end;

procedure TfrmGrupoMaterial.actCancelarExecute(Sender: TObject);
begin
  if messagedlg('Deseja mesmo cancelar o registro?', mtconfirmation,
    [mbyes, mbno], 0) = mryes then
  begin
    dmGrupoMaterial.cdsGrupoMaterial.Cancel;
    DesativaCampos;
    inherited;
  end;
end;

procedure TfrmGrupoMaterial.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if messagedlg('Deseja mesmo excluir o registro?', mtconfirmation,
    [mbyes, mbno], 0) = mryes then

  begin
    dmGrupoMaterial.cdsGrupoMaterial.delete;
    dmGrupoMaterial.cdsGrupoMaterial.ApplyUpdates(0);
  end;
end;

procedure TfrmGrupoMaterial.actIncluirExecute(Sender: TObject);
begin
  inherited;
  InclusaoEdicao;
  dmGrupoMaterial.cdsGrupoMaterial.append;
  edtDataInclusaoGrupoMaterial.text := FormatDateTime('dd/mm/yyyy', date);
  edtNomeGrupoMaterial.SetFocus;
end;

procedure TfrmGrupoMaterial.actSalvarExecute(Sender: TObject);
begin
  if tgsSituacaoGrupoMaterial.state = tssOn then
  begin
    dmGrupoMaterial.cdsGrupoMaterial.FieldByName('CODSIT').text := '1';
    edtDataInativacaoGrupoMaterial.text := '';
  end
  else
  begin
    dmGrupoMaterial.cdsGrupoMaterial.FieldByName('CODSIT').text := '0';
    edtDataInativacaoGrupoMaterial.text := FormatDateTime('dd/mm/yyyy', date);
  end;

  dmGrupoMaterial.cdsGrupoMaterial.post;
  if (dmGrupoMaterial.cdsGrupoMaterial.ChangeCount > 0) then
    dmGrupoMaterial.cdsGrupoMaterial.ApplyUpdates(-1);

  dmGrupoMaterial.cdsGrupoMaterial.Close;
  dmGrupoMaterial.cdsGrupoMaterial.Open;
  AtualizaNomeGrid;
  DesativaCampos;
  inherited;
end;

procedure TfrmGrupoMaterial.AtualizaNomeGrid;
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

procedure TfrmGrupoMaterial.DesativaCampos;
begin
  edtNomeGrupoMaterial.Enabled := false;
  tgsSituacaoGrupoMaterial.Enabled := false;
end;

procedure TfrmGrupoMaterial.dsGrupoMaterialDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  if not(dmGrupoMaterial.cdsGrupoMaterial.state in [dsEdit, dsInsert])
  then
  begin

    if dmGrupoMaterial.cdsGrupoMaterial.FieldByName('CODSIT').text = '1'
    then
    begin
      tgsSituacaoGrupoMaterial.state := tssOn;
    end
    else
    begin
      tgsSituacaoGrupoMaterial.state := tssOff;
    end;

  end;
end;

procedure TfrmGrupoMaterial.FormCreate(Sender: TObject);
begin
  inherited;
  // criando o datamodule de clientes para uso
  if not Assigned(dmGrupoMaterial) then
    dmGrupoMaterial := tdmGrupoMaterial.Create(nil);
  dsGrupoMaterial.dataset := dmGrupoMaterial.cdsGrupoMaterial;
end;

procedure TfrmGrupoMaterial.FormDestroy(Sender: TObject);
begin
  inherited;
  // fecha o data set e destruo objeto
  if Assigned(dmGrupoMaterial) then
  begin
    dmGrupoMaterial.cdsGrupoMaterial.Close;
    freeandnil(dmGrupoMaterial);
  end;
end;

procedure TfrmGrupoMaterial.FormShow(Sender: TObject);
begin
  inherited;
  // abro o dataset
  dmGrupoMaterial.cdsGrupoMaterial.Open;
  AtualizaNomeGrid;
end;

procedure TfrmGrupoMaterial.InclusaoEdicao;
begin
  edtNomeGrupoMaterial.Enabled := true;
  tgsSituacaoGrupoMaterial.Enabled := true;
end;

end.
