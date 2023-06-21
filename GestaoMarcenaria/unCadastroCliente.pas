unit unCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unFormPadrao, Data.DB, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.Mask, Vcl.DBCtrls, System.UITypes;

type
  TfrmCadastroCliente = class(TfrmPadrao)
    gbCpfCnpj: TGroupBox;
    edtCpfCnpjCliente: TDBEdit;
    gbF3: TGroupBox;
    edtNomeCliente: TDBEdit;
    gbF4: TGroupBox;
    edtCodigoCliente: TDBEdit;
    gbF5: TGroupBox;
    tgsSituacaoCliente: TToggleSwitch;
    gbF7: TGroupBox;
    edtCepCliente: TDBEdit;
    gbF8: TGroupBox;
    edtUfCliente: TDBEdit;
    gbF9: TGroupBox;
    edtCidadeCliente: TDBEdit;
    gbF10: TGroupBox;
    edtBairroCliente: TDBEdit;
    gbF11: TGroupBox;
    edtTipoLogradouroCliente: TDBEdit;
    gbF12: TGroupBox;
    edtLogradouroCliente: TDBEdit;
    gbF13: TGroupBox;
    edtNumeroCliente: TDBEdit;
    gbF14: TGroupBox;
    edtComplementoCliente: TDBEdit;
    gbF6: TGroupBox;
    edtTelefoneCliente: TDBEdit;
    gbF15: TGroupBox;
    rdbComercial: TRadioButton;
    rdbResidencial: TRadioButton;
    GroupBox1: TGroupBox;
    edtDataInativacaoCliente: TDBEdit;
    GroupBox2: TGroupBox;
    edtDataInclusaoCliente: TDBEdit;
    GroupBox3: TGroupBox;
    rdbFisica: TRadioButton;
    RadioButton2: TRadioButton;
    dsCadastroCliente: TDataSource;
    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsCadastroClienteDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    procedure AtualizaNomeGrid;
    procedure InclusaoEdicao;
    procedure DesativaCampos;

  public
    { Public declarations }
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

uses unDmCadastroCliente;

procedure TfrmCadastroCliente.actAlterarExecute(Sender: TObject);
begin
  inherited;
  InclusaoEdicao;
  dmCadastroCliente.cdsCadastroCliente.Edit;
  edtCpfCnpjCliente.SetFocus;
end;

procedure TfrmCadastroCliente.actCancelarExecute(Sender: TObject);
begin
  if messagedlg('Deseja mesmo cancelar o registro?', mtconfirmation,
    [mbyes, mbno], 0) = mryes then
  begin
    dmCadastroCliente.cdsCadastroCliente.Cancel;
    DesativaCampos;
    inherited;
  end;
end;

procedure TfrmCadastroCliente.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if messagedlg('Deseja mesmo excluir o registro?', mtconfirmation,
    [mbyes, mbno], 0) = mryes then

  begin
    dmCadastroCliente.cdsCadastroCliente.delete;
    dmCadastroCliente.cdsCadastroCliente.ApplyUpdates(0);
  end;
end;

procedure TfrmCadastroCliente.actIncluirExecute(Sender: TObject);
begin
  inherited;
  InclusaoEdicao;
  dmCadastroCliente.cdsCadastroCliente.append;
  edtDataInclusaoCliente.text := FormatDateTime('dd/mm/yyyy', date);
  edtCpfCnpjCliente.SetFocus;
end;

procedure TfrmCadastroCliente.actSalvarExecute(Sender: TObject);
begin
  if tgsSituacaoCliente.state = tssOn then
  begin
    dmCadastroCliente.cdsCadastroCliente.FieldByName('CODSIT').text := '1';
    edtDataInativacaoCliente.text := '';
  end
  else
  begin
    dmCadastroCliente.cdsCadastroCliente.FieldByName('CODSIT').text := '0';
    edtDataInativacaoCliente.text := FormatDateTime('dd/mm/yyyy', date);
  end;

  if rdbComercial.Checked = true then
  begin
    dmCadastroCliente.cdsCadastroCliente.FieldByName('CODTIPOENDERECO')
      .text := 'C';
  end
  else
  begin
    dmCadastroCliente.cdsCadastroCliente.FieldByName('CODTIPOENDERECO')
      .text := 'R';
  end;

  dmCadastroCliente.cdsCadastroCliente.post;
  if (dmCadastroCliente.cdsCadastroCliente.ChangeCount > 0) then
    dmCadastroCliente.cdsCadastroCliente.ApplyUpdates(-1);

  dmCadastroCliente.cdsCadastroCliente.Close;
  dmCadastroCliente.cdsCadastroCliente.Open;
  AtualizaNomeGrid;
  DesativaCampos;
  inherited;
end;

procedure TfrmCadastroCliente.AtualizaNomeGrid;
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

    dbgFormPadrao.Columns[i].Width :=
      Canvas.TextWidth(dbgFormPadrao.Columns[i].Field.AsString) + 20;
  end;
end;

procedure TfrmCadastroCliente.DesativaCampos;
begin
  dbgFormPadrao.Enabled := false;
  edtCpfCnpjCliente.Enabled := false;
  edtNomeCliente.Enabled := false;
  edtTelefoneCliente.Enabled := false;
  edtCepCliente.Enabled := false;
  edtUfCliente.Enabled := false;
  edtCidadeCliente.Enabled := false;
  edtBairroCliente.Enabled := false;
  edtTipoLogradouroCliente.Enabled := false;
  edtLogradouroCliente.Enabled := false;
  edtNumeroCliente.Enabled := false;
  edtComplementoCliente.Enabled := false;
  tgsSituacaoCliente.Enabled := false;
  rdbComercial.Enabled := false;
  rdbResidencial.Enabled := false;
end;

procedure TfrmCadastroCliente.dsCadastroClienteDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  if not(dmCadastroCliente.cdsCadastroCliente.state in [dsEdit, dsInsert]) then
  begin

    if dmCadastroCliente.cdsCadastroCliente.FieldByName('CODSIT').text = '1' then
    begin
      tgsSituacaoCliente.state := tssOn;
    end
    else
    begin
      tgsSituacaoCliente.state := tssOff;
    end;

    if dmCadastroCliente.cdsCadastroCliente.FieldByName('CODTIPOENDERECO').text = 'C'
    then
    begin
      rdbComercial.Checked := true;
    end
    else
    begin
      rdbResidencial.Checked := true;
    end;
  end;

end;

procedure TfrmCadastroCliente.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(dmCadastroCliente) then
    dmCadastroCliente := tdmCadastroCliente.Create(nil);
  dsCadastroCliente.dataset := dmCadastroCliente.cdsCadastroCliente;
end;

procedure TfrmCadastroCliente.FormDestroy(Sender: TObject);
begin
  inherited;
  // fecha o data set e destruo objeto
  if Assigned(dmCadastroCliente) then
  begin
    dmCadastroCliente.cdsCadastroCliente.Close;
    freeandnil(dmCadastroCliente);
  end;
end;

procedure TfrmCadastroCliente.FormShow(Sender: TObject);
begin
  inherited;
  dmCadastroCliente.cdsCadastroCliente.Open;
  AtualizaNomeGrid;
end;

procedure TfrmCadastroCliente.InclusaoEdicao;
begin
  edtCpfCnpjCliente.Enabled := true;
  edtNomeCliente.Enabled := true;
  edtTelefoneCliente.Enabled := true;
  edtCepCliente.Enabled := true;
  edtUfCliente.Enabled := true;
  edtCidadeCliente.Enabled := true;
  edtBairroCliente.Enabled := true;
  edtTipoLogradouroCliente.Enabled := true;
  edtLogradouroCliente.Enabled := true;
  edtNumeroCliente.Enabled := true;
  edtComplementoCliente.Enabled := true;
  tgsSituacaoCliente.Enabled := true;
  rdbComercial.Enabled := true;
  rdbResidencial.Enabled := true;
end;

end.
