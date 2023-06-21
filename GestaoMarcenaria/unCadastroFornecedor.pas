unit unCadastroFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unFormPadrao, Data.DB, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.Mask, Vcl.DBCtrls, System.UITypes;

type
  TfrmCadastroFornecedor = class(TfrmPadrao)
    dsCadastroFornecedor: TDataSource;
    gbF1: TGroupBox;
    gbF2: TGroupBox;
    gbF3: TGroupBox;
    gbF4: TGroupBox;
    gbF5: TGroupBox;
    gbF7: TGroupBox;
    gbF8: TGroupBox;
    gbF9: TGroupBox;
    gbF10: TGroupBox;
    gbF11: TGroupBox;
    gbF12: TGroupBox;
    gbF13: TGroupBox;
    gbF14: TGroupBox;
    gbF6: TGroupBox;
    gbF15: TGroupBox;
    rdbComercial: TRadioButton;
    rdbResidencial: TRadioButton;
    edtCnpjFornecedor: TDBEdit;
    edtRazaoSocialFornecedor: TDBEdit;
    edtNomeFantasiaFornecedor: TDBEdit;
    edtCodigoFornecedor: TDBEdit;
    edtTelefoneFornecedor: TDBEdit;
    edtCepFornecedor: TDBEdit;
    edtUfFornecedor: TDBEdit;
    edtCidadeFornecedor: TDBEdit;
    edtBairroFornecedor: TDBEdit;
    edtTipoLogradouroFornecedor: TDBEdit;
    edtLogradouroFornecedor: TDBEdit;
    edtNumeroFornecedor: TDBEdit;
    edtComplementoFornecedor: TDBEdit;
    tgsSituacaoFornecedor: TToggleSwitch;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edtDataInclusaoFornecedor: TDBEdit;
    edtDataInativacaoFornecedor: TDBEdit;
    procedure actIncluirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure dsCadastroFornecedorDataChange(Sender: TObject; Field: TField);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaNomeGrid;
    procedure InclusaoEdicao;
    procedure DesativaCampos;
  public
    { Public declarations }
  end;

var
  frmCadastroFornecedor: TfrmCadastroFornecedor;

implementation

uses unDmCadastroFornecedor;

{$R *.dfm}

procedure TfrmCadastroFornecedor.actAlterarExecute(Sender: TObject);
begin
  inherited;
  InclusaoEdicao;
  dmCadastroFornecedor.cdsCadastroFornecedor.Edit;
  edtCnpjFornecedor.SetFocus;
end;

procedure TfrmCadastroFornecedor.actCancelarExecute(Sender: TObject);
begin
  if messagedlg('Deseja mesmo cancelar o registro?', mtconfirmation,
    [mbyes, mbno], 0) = mryes then
  begin
    dmCadastroFornecedor.cdsCadastroFornecedor.Cancel;
    DesativaCampos;
    inherited;
  end;
end;

procedure TfrmCadastroFornecedor.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if messagedlg('Deseja mesmo excluir o registro?', mtconfirmation,
    [mbyes, mbno], 0) = mryes then

  begin
    dmCadastroFornecedor.cdsCadastroFornecedor.delete;
    dmCadastroFornecedor.cdsCadastroFornecedor.ApplyUpdates(0);
  end;
end;

procedure TfrmCadastroFornecedor.actIncluirExecute(Sender: TObject);
begin
  inherited;
  InclusaoEdicao;
  dmCadastroFornecedor.cdsCadastroFornecedor.append;
  edtDataInclusaoFornecedor.text := FormatDateTime('dd/mm/yyyy', date);
  edtCnpjFornecedor.SetFocus;
end;

procedure TfrmCadastroFornecedor.actSalvarExecute(Sender: TObject);
begin
  if tgsSituacaoFornecedor.state = tssOn then
  begin
    dmCadastroFornecedor.cdsCadastroFornecedor.FieldByName('Sit').text := '1';
    edtDataInativacaoFornecedor.text := '';
  end
  else
  begin
    dmCadastroFornecedor.cdsCadastroFornecedor.FieldByName('Sit').text := '0';
    edtDataInativacaoFornecedor.text := FormatDateTime('dd/mm/yyyy', date);
  end;

  if rdbComercial.Checked = true then
  begin
    dmCadastroFornecedor.cdsCadastroFornecedor.FieldByName('TIPOENDERECO')
      .text := 'C';
  end
  else
  begin
    dmCadastroFornecedor.cdsCadastroFornecedor.FieldByName('TIPOENDERECO')
      .text := 'R';
  end;

  dmCadastroFornecedor.cdsCadastroFornecedor.post;
  if (dmCadastroFornecedor.cdsCadastroFornecedor.ChangeCount > 0) then
    dmCadastroFornecedor.cdsCadastroFornecedor.ApplyUpdates(-1);

  dmCadastroFornecedor.cdsCadastroFornecedor.Close;
  dmCadastroFornecedor.cdsCadastroFornecedor.Open;
  AtualizaNomeGrid;
  DesativaCampos;
  inherited;
end;

procedure TfrmCadastroFornecedor.AtualizaNomeGrid;
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

procedure TfrmCadastroFornecedor.DesativaCampos;
begin
  dbgFormPadrao.Enabled := false;
  edtCnpjFornecedor.Enabled := false;
  edtRazaoSocialFornecedor.Enabled := false;
  edtNomeFantasiaFornecedor.Enabled := false;
  edtTelefoneFornecedor.Enabled := false;
  edtCepFornecedor.Enabled := false;
  edtUfFornecedor.Enabled := false;
  edtCidadeFornecedor.Enabled := false;
  edtBairroFornecedor.Enabled := false;
  edtTipoLogradouroFornecedor.Enabled := false;
  edtLogradouroFornecedor.Enabled := false;
  edtNumeroFornecedor.Enabled := false;
  edtComplementoFornecedor.Enabled := false;
  tgsSituacaoFornecedor.Enabled := false;
  rdbComercial.Enabled := false;
  rdbResidencial.Enabled := false;
end;

procedure TfrmCadastroFornecedor.dsCadastroFornecedorDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  if not(dmCadastroFornecedor.cdsCadastroFornecedor.state in [dsEdit, dsInsert])
  then
  begin

    if dmCadastroFornecedor.cdsCadastroFornecedor.FieldByName('Sit').text = '1'
    then
    begin
      tgsSituacaoFornecedor.state := tssOn;
    end
    else
    begin
      tgsSituacaoFornecedor.state := tssOff;
    end;

    if dmCadastroFornecedor.cdsCadastroFornecedor.FieldByName('TIPOENDERECO')
      .text = 'C' then
    begin
      rdbComercial.Checked := true;
    end
    else
    begin
      rdbResidencial.Checked := true;
    end;
  end;

end;

procedure TfrmCadastroFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(dmCadastroFornecedor) then
    dmCadastroFornecedor := tdmCadastroFornecedor.Create(nil);
  dsCadastroFornecedor.dataset := dmCadastroFornecedor.cdsCadastroFornecedor;
end;

procedure TfrmCadastroFornecedor.FormDestroy(Sender: TObject);
begin
  inherited;
  // fecha o data set e destruo objeto
  if Assigned(dmCadastroFornecedor) then
  begin
    dmCadastroFornecedor.cdsCadastroFornecedor.Close;
    freeandnil(dmCadastroFornecedor);
  end;
end;

procedure TfrmCadastroFornecedor.FormShow(Sender: TObject);
begin
  inherited;
  dmCadastroFornecedor.cdsCadastroFornecedor.Open;
  AtualizaNomeGrid;
end;

procedure TfrmCadastroFornecedor.InclusaoEdicao;
begin
  edtCnpjFornecedor.Enabled := true;
  edtRazaoSocialFornecedor.Enabled := true;
  edtNomeFantasiaFornecedor.Enabled := true;
  edtTelefoneFornecedor.Enabled := true;
  edtCepFornecedor.Enabled := true;
  edtUfFornecedor.Enabled := true;
  edtCidadeFornecedor.Enabled := true;
  edtBairroFornecedor.Enabled := true;
  edtTipoLogradouroFornecedor.Enabled := true;
  edtLogradouroFornecedor.Enabled := true;
  edtNumeroFornecedor.Enabled := true;
  edtComplementoFornecedor.Enabled := true;
  tgsSituacaoFornecedor.Enabled := true;
  rdbComercial.Enabled := true;
  rdbResidencial.Enabled := true;
end;

end.
