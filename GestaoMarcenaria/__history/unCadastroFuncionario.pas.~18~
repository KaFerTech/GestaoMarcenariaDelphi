unit unCadastroFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unFormPadrao, Data.DB, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.WinXCtrls, RegularExpressions, Vcl.Mask, System.UITypes;

type
  TfrmCadastroFuncionario = class(TfrmPadrao)
    gbF1: TGroupBox;
    edtCpfFuncionario: TDBEdit;
    gbF3: TGroupBox;
    edtNomeFuncionario: TDBEdit;
    gbF4: TGroupBox;
    edtCodigoFuncionario: TDBEdit;
    gbF5: TGroupBox;
    tgsSituacaoFuncionario: TToggleSwitch;
    gbF7: TGroupBox;
    edtCepFuncionario: TDBEdit;
    gbF8: TGroupBox;
    edtUfFuncionario: TDBEdit;
    gbF9: TGroupBox;
    edtCidadeFuncionario: TDBEdit;
    gbF10: TGroupBox;
    edtBairroFuncionario: TDBEdit;
    gbF11: TGroupBox;
    edtTipoLogradouroFuncionario: TDBEdit;
    gbF12: TGroupBox;
    edtLogradouroFuncionario: TDBEdit;
    gbF13: TGroupBox;
    edtNumeroFuncionario: TDBEdit;
    gbF14: TGroupBox;
    edtComplementoFuncionario: TDBEdit;
    gbF6: TGroupBox;
    edtTelefoneFuncionario: TDBEdit;
    gbF15: TGroupBox;
    rdbComercial: TRadioButton;
    rdbResidencial: TRadioButton;
    GroupBox1: TGroupBox;
    edtDataInativacaoFuncionario: TDBEdit;
    GroupBox2: TGroupBox;
    edtDataInclusaoFuncionario: TDBEdit;
    dsCadastroFuncionario: TDataSource;
    GroupBox3: TGroupBox;
    edtDataNascimentoFuncionario: TDBEdit;
    GroupBox4: TGroupBox;
    edtCargoFuncionario: TDBEdit;
    GroupBox5: TGroupBox;
    rdbMasculino: TRadioButton;
    rdbFeminino: TRadioButton;
    GroupBox6: TGroupBox;
    edtDepartamentoFuncionario: TDBEdit;
    gbU6: TGroupBox;
    cboUsuarioFuncionario: TDBLookupComboBox;
    dsUsuarioFuncionario: TDataSource;
    GroupBox7: TGroupBox;
    edtNacionalidadeFuncionario: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure dsCadastroFuncionarioDataChange(Sender: TObject; Field: TField);
    procedure edtNomeFuncionarioExit(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaNomeGrid;
    procedure InclusaoEdicao;
    procedure DesativaCampos;
    function ValidarNomeCompleto(const NomeCompleto: string): Boolean;
  public
    { Public declarations }
  end;

var
  frmCadastroFuncionario: TfrmCadastroFuncionario;

implementation

uses unDmCadastroFuncionario;

{$R *.dfm}

procedure TfrmCadastroFuncionario.actAlterarExecute(Sender: TObject);
begin
  inherited;
  InclusaoEdicao;
  dmCadastroFuncionario.cdsCadastroFuncionario.Edit;
  edtCpfFuncionario.SetFocus;
end;

procedure TfrmCadastroFuncionario.actCancelarExecute(Sender: TObject);
begin
  if messagedlg('Deseja mesmo cancelar o registro?', mtconfirmation,
    [mbyes, mbno], 0) = mryes then
  begin
    dmCadastroFuncionario.cdsCadastroFuncionario.Cancel;
    DesativaCampos;
    inherited;
  end;
end;

procedure TfrmCadastroFuncionario.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if messagedlg('Deseja mesmo excluir o registro?', mtconfirmation,
    [mbyes, mbno], 0) = mryes then

  begin
    dmCadastroFuncionario.cdsCadastroFuncionario.delete;
    dmCadastroFuncionario.cdsCadastroFuncionario.ApplyUpdates(0);
  end;
end;

procedure TfrmCadastroFuncionario.actIncluirExecute(Sender: TObject);
begin
  inherited;
  InclusaoEdicao;
  dmCadastroFuncionario.cdsCadastroFuncionario.append;
  edtDataInclusaoFuncionario.text := FormatDateTime('dd/mm/yyyy', date);
  edtCpfFuncionario.SetFocus;
end;

procedure TfrmCadastroFuncionario.actSalvarExecute(Sender: TObject);
begin
  if tgsSituacaoFuncionario.state = tssOn then
  begin
    dmCadastroFuncionario.cdsCadastroFuncionario.FieldByName('Sit').text := '1';
    edtDataInativacaoFuncionario.text := '';
  end
  else
  begin
    dmCadastroFuncionario.cdsCadastroFuncionario.FieldByName('Sit').text := '0';
    edtDataInativacaoFuncionario.text := FormatDateTime('dd/mm/yyyy', date);
  end;

  if rdbComercial.Checked = true then
  begin
    dmCadastroFuncionario.cdsCadastroFuncionario.FieldByName('TIPOENDERECO')
      .text := 'C';
  end
  else
  begin
    dmCadastroFuncionario.cdsCadastroFuncionario.FieldByName('TIPOENDERECO')
      .text := 'R';
  end;

  if rdbMasculino.Checked = true then
  begin
    dmCadastroFuncionario.cdsCadastroFuncionario.FieldByName('GENERO')
      .text := 'M';
  end
  else
  begin
    dmCadastroFuncionario.cdsCadastroFuncionario.FieldByName('GENERO')
      .text := 'F';
  end;

  dmCadastroFuncionario.cdsCadastroFuncionario.post;
  if (dmCadastroFuncionario.cdsCadastroFuncionario.ChangeCount > 0) then
    dmCadastroFuncionario.cdsCadastroFuncionario.ApplyUpdates(-1);

  dmCadastroFuncionario.cdsCadastroFuncionario.Close;
  dmCadastroFuncionario.cdsCadastroFuncionario.Open;
  AtualizaNomeGrid;
  DesativaCampos;
  inherited;
end;

procedure TfrmCadastroFuncionario.AtualizaNomeGrid;
var
  i: Integer;
begin
  // Ajusta o tamanho dos campos do grid
  for i := 0 to dbgFormPadrao.Columns.Count - 1 do
  begin

    if dbgFormPadrao.Columns.Items[i].Title.caption = 'CODGENERO' then
    begin
      dbgFormPadrao.Columns[i].Visible := false;
    end;

    if dbgFormPadrao.Columns.Items[i].Title.caption = 'CODUSUARIO' then
    begin
      dbgFormPadrao.Columns[i].Visible := false;
    end;

    if dbgFormPadrao.Columns.Items[i].Title.caption = 'SIT' then
    begin
      dbgFormPadrao.Columns[i].Visible := false;
    end;

    if dbgFormPadrao.Columns.Items[i].Title.caption = 'CODTIPENDER' then
    begin
      dbgFormPadrao.Columns[i].Visible := false;
    end;

    dbgFormPadrao.Columns[i].Width := Canvas.TextWidth(dbgFormPadrao.Columns[i].Field.AsString) + 20;
  end;
end;

procedure TfrmCadastroFuncionario.DesativaCampos;
begin
  edtCpfFuncionario.Enabled := false;
  edtNomeFuncionario.Enabled := false;
  edtDataNascimentoFuncionario.Enabled := false;
  edtNacionalidadeFuncionario.Enabled := false;
  edtCargoFuncionario.Enabled := false;
  edtDepartamentoFuncionario.Enabled := false;
  edtTelefoneFuncionario.Enabled := false;
  edtCepFuncionario.Enabled := false;
  edtUfFuncionario.Enabled := false;
  edtCidadeFuncionario.Enabled := false;
  edtBairroFuncionario.Enabled := false;
  edtTipoLogradouroFuncionario.Enabled := false;
  edtLogradouroFuncionario.Enabled := false;
  edtNumeroFuncionario.Enabled := false;
  edtComplementoFuncionario.Enabled := false;
  cboUsuarioFuncionario.Enabled := false;
  tgsSituacaoFuncionario.Enabled := false;
  rdbComercial.Enabled := false;
  rdbResidencial.Enabled := false;
  rdbMasculino.Enabled := false;
  rdbFeminino.Enabled := false;
  tgsSituacaoFuncionario.state := tssOn;
end;

procedure TfrmCadastroFuncionario.dsCadastroFuncionarioDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;

  if not(dmCadastroFuncionario.cdsCadastroFuncionario.state in [dsEdit, dsInsert])
  then
  begin

    if dmCadastroFuncionario.cdsCadastroFuncionario.FieldByName('Sit').text = '1'
    then
    begin
      tgsSituacaoFuncionario.state := tssOn;
    end
    else
    begin
      tgsSituacaoFuncionario.state := tssOff;
    end;

    if dmCadastroFuncionario.cdsCadastroFuncionario.FieldByName('TIPOENDERECO').text = 'C' then
    begin
      rdbComercial.Checked := true;
    end
    else
    begin
      rdbResidencial.Checked := true;
    end;

    if dmCadastroFuncionario.cdsCadastroFuncionario.FieldByName('GENERO').text = 'M' then
    begin
      rdbMasculino.Checked := true;
    end
    else
    begin
      rdbFeminino.Checked := true;
    end;

  end;
end;

procedure TfrmCadastroFuncionario.edtNomeFuncionarioExit(Sender: TObject);
begin
  inherited;
  if not ValidarNomeCompleto(edtNomeFuncionario.Text) then
  begin
    ShowMessage('Insira o nome completo');
    edtNomeFuncionario.SetFocus;
  end;
end;

procedure TfrmCadastroFuncionario.FormCreate(Sender: TObject);
begin
  inherited;
  // criando o datamodule de clientes para uso
  if not Assigned(dmCadastroFuncionario) then
    dmCadastroFuncionario := tdmCadastroFuncionario.Create(nil);
  dsCadastroFuncionario.dataset := dmCadastroFuncionario.cdsCadastroFuncionario;
end;

procedure TfrmCadastroFuncionario.FormDestroy(Sender: TObject);
begin
  inherited;
  // fecha o data set e destruo objeto
  if Assigned(dmCadastroFuncionario) then
  begin
    dmCadastroFuncionario.cdsCadastroFuncionario.Close;
    freeandnil(dmCadastroFuncionario);
  end;
end;

procedure TfrmCadastroFuncionario.FormShow(Sender: TObject);
begin
  inherited;
  // abro o dataset
  dmCadastroFuncionario.cdsCadastroFuncionario.Open;
  dmCadastroFuncionario.cdsUsuarioFuncionario.Open;
  AtualizaNomeGrid;
end;

procedure TfrmCadastroFuncionario.InclusaoEdicao;
begin
  edtCpfFuncionario.Enabled := true;
  edtNomeFuncionario.Enabled := true;
  edtDataNascimentoFuncionario.Enabled := true;
  edtNacionalidadeFuncionario.Enabled := true;
  edtCargoFuncionario.Enabled := true;
  edtDepartamentoFuncionario.Enabled := true;
  edtTelefoneFuncionario.Enabled := true;
  edtCepFuncionario.Enabled := true;
  edtUfFuncionario.Enabled := true;
  edtCidadeFuncionario.Enabled := true;
  edtBairroFuncionario.Enabled := true;
  edtTipoLogradouroFuncionario.Enabled := true;
  edtLogradouroFuncionario.Enabled := true;
  edtNumeroFuncionario.Enabled := true;
  edtComplementoFuncionario.Enabled := true;
  cboUsuarioFuncionario.Enabled := true;
  tgsSituacaoFuncionario.Enabled := true;
  rdbComercial.Enabled := true;
  rdbResidencial.Enabled := true;
  rdbMasculino.Enabled := true;
  rdbFeminino.Enabled := true;
  tgsSituacaoFuncionario.state := tssOn;
end;

function TfrmCadastroFuncionario.ValidarNomeCompleto(const NomeCompleto: string): Boolean;
var
  RegEx: TRegEx;
begin
  RegEx := TRegEx.Create('^[A-Za-z]+(\s[A-Za-z]+)+$');
  Result := RegEx.IsMatch(NomeCompleto);
end;

end.
