unit unCadastroUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unFormPadrao, Data.DB, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.WinXCtrls, Vcl.Buttons, RegularExpressions, System.UITypes;

type
  TfrmCadastroUsuario = class(TfrmPadrao)
    gbU1: TGroupBox;
    edtNomeUsuario: TDBEdit;
    dsCadastroUsuario: TDataSource;
    gbU2: TGroupBox;
    gbU4: TGroupBox;
    gbU5: TGroupBox;
    gbU6: TGroupBox;
    gbU8: TGroupBox;
    gbU9: TGroupBox;
    gbU10: TGroupBox;
    gbU11: TGroupBox;
    edtLoginUsuario: TDBEdit;
    edtTelefoneUsuario: TDBEdit;
    edtEmailUsuario: TDBEdit;
    gbU7: TGroupBox;
    tgsSituacaoUsuario: TToggleSwitch;
    edtDataInclusaoUsuario: TDBEdit;
    edtDataInativacaoUsuario: TDBEdit;
    edtConfirmaSenhaUsuario: TEdit;
    gbU3: TGroupBox;
    edtCodigoUsuario: TDBEdit;
    btnVerSenha: TSpeedButton;
    cboPerfilUsuario: TDBLookupComboBox;
    dsPerfil: TDataSource;
    edtSenhaUsuario: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVerSenhaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnVerSenhaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actAlterarExecute(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure dsCadastroUsuarioDataChange(Sender: TObject; Field: TField);
    procedure edtLoginUsuarioEnter(Sender: TObject);
    procedure edtNomeUsuarioExit(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaNomeGrid;
    procedure InclusaoEdicao;
    procedure DesativaCampos;
    procedure GeraLogin;
    function ValidarNomeCompleto(const NomeCompleto: string): Boolean;
  public
    { Public declarations }
  end;

var
  frmCadastroUsuario: TfrmCadastroUsuario;

implementation

uses unDmCadastroUsuario, uCriptografia;

{$R *.dfm}

procedure TfrmCadastroUsuario.actAlterarExecute(Sender: TObject);
begin
  inherited;
  InclusaoEdicao;
  edtConfirmaSenhaUsuario.Text := edtSenhaUsuario.Text;
  dmCadastroUsuario.cdsCadastroUsuario.Edit;
  edtNomeUsuario.SetFocus;
end;

procedure TfrmCadastroUsuario.actCancelarExecute(Sender: TObject);
begin
  if messagedlg('Deseja mesmo cancelar o registro?', mtconfirmation,
    [mbyes, mbno], 0) = mryes then
  begin
    dmCadastroUsuario.cdsCadastroUsuario.Cancel;
    DesativaCampos;
    inherited;
  end;
end;

procedure TfrmCadastroUsuario.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if messagedlg('Deseja mesmo excluir o registro?', mtconfirmation,
    [mbyes, mbno], 0) = mryes then

  begin
    dmCadastroUsuario.cdsCadastroUsuario.delete;
    dmCadastroUsuario.cdsCadastroUsuario.ApplyUpdates(0);
  end;
end;

procedure TfrmCadastroUsuario.actIncluirExecute(Sender: TObject);
begin
  inherited;
  InclusaoEdicao;
  dmCadastroUsuario.cdsCadastroUsuario.append;
  edtDataInclusaoUsuario.text := FormatDateTime('dd/mm/yyyy', date);
  edtNomeUsuario.SetFocus;
end;

procedure TfrmCadastroUsuario.actSalvarExecute(Sender: TObject);
begin

  if edtSenhaUsuario.text = edtConfirmaSenhaUsuario.text then
  begin
    if tgsSituacaoUsuario.state = tssOn then
    begin
      dmCadastroUsuario.cdsCadastroUsuario.FieldByName('Sit').text := '1';
      edtDataInativacaoUsuario.text := '';
    end
    else
    begin
      dmCadastroUsuario.cdsCadastroUsuario.FieldByName('Sit').text := '0';
      edtDataInativacaoUsuario.text := FormatDateTime('dd/mm/yyyy', date);
    end;

    dmCadastroUsuario.cdsCadastroUsuario.FieldByName('Senha').text :=
      CriptografarSenha(edtConfirmaSenhaUsuario.text, 855);

    dmCadastroUsuario.cdsCadastroUsuario.post;
    if (dmCadastroUsuario.cdsCadastroUsuario.ChangeCount > 0) then
      dmCadastroUsuario.cdsCadastroUsuario.ApplyUpdates(-1);

    dmCadastroUsuario.cdsCadastroUsuario.Close;
    dmCadastroUsuario.cdsCadastroUsuario.Open;
    AtualizaNomeGrid;
    DesativaCampos;
    inherited;
  end
  else
  begin
    ShowMessage('As duas senhas devem ser iguais!')
  end;



end;

procedure TfrmCadastroUsuario.AtualizaNomeGrid;
var
  i: Integer;
begin
  // Ajusta o tamanho dos campos do grid
  for i := 0 to dbgFormPadrao.Columns.Count - 1 do
  begin

    if dbgFormPadrao.Columns.Items[i].Title.caption = 'SENHA' then
    begin
      dbgFormPadrao.Columns[i].Visible := false;
    end;

    if dbgFormPadrao.Columns.Items[i].Title.caption = 'IDPERFIL' then
    begin
      dbgFormPadrao.Columns[i].Visible := false;
    end;

    if dbgFormPadrao.Columns.Items[i].Title.caption = 'SIT' then
    begin
      dbgFormPadrao.Columns[i].Visible := false;
    end;

    dbgFormPadrao.Columns[i].Width :=
      Canvas.TextWidth(dbgFormPadrao.Columns[i].Field.AsString) + 20;
  end;
end;

procedure TfrmCadastroUsuario.btnVerSenhaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  edtSenhaUsuario.PasswordChar := #0;
end;

procedure TfrmCadastroUsuario.btnVerSenhaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  edtSenhaUsuario.PasswordChar := '*';
end;

procedure TfrmCadastroUsuario.DesativaCampos;
begin
  edtNomeUsuario.Enabled := false;
  edtLoginUsuario.Enabled := false;
  edtTelefoneUsuario.Enabled := false;
  edtEmailUsuario.Enabled := false;
  cboPerfilUsuario.Enabled := false;
  tgsSituacaoUsuario.Enabled := false;
  edtSenhaUsuario.Enabled := false;
  edtConfirmaSenhaUsuario.Enabled := false;
  edtConfirmaSenhaUsuario.Text := '';
end;

procedure TfrmCadastroUsuario.dsCadastroUsuarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if dmCadastroUsuario.cdsCadastroUsuario.FieldByName('Sit').text = '1' then
  begin
    tgsSituacaoUsuario.state := tssOn;
  end
  else
  begin
    tgsSituacaoUsuario.state := tssOff;
  end;

  edtSenhaUsuario.text := DescriptografarSenha
    (dmCadastroUsuario.cdsCadastroUsuario.FieldByName('Senha').text, 855);

end;

procedure TfrmCadastroUsuario.edtLoginUsuarioEnter(Sender: TObject);
begin
  inherited;
  if (dmCadastroUsuario.cdsCadastroUsuario.state <> dsEdit) and (edtLoginUsuario.Text = '') then GeraLogin;
end;

procedure TfrmCadastroUsuario.edtNomeUsuarioExit(Sender: TObject);
begin
  inherited;
  if not ValidarNomeCompleto(edtNomeUsuario.Text) then
  begin
    ShowMessage('Insira o nome completo');
    edtNomeUsuario.SetFocus;
  end;
end;

procedure TfrmCadastroUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  // criando o datamodule de clientes para uso
  if not Assigned(dmCadastroUsuario) then
    dmCadastroUsuario := tdmCadastroUsuario.Create(nil);
  dsCadastroUsuario.dataset := dmCadastroUsuario.cdsCadastroUsuario;
end;

procedure TfrmCadastroUsuario.FormDestroy(Sender: TObject);
begin
  inherited;
  // fecha o data set e destruo objeto
  if Assigned(dmCadastroUsuario) then
  begin
    dmCadastroUsuario.cdsCadastroUsuario.Close;
    freeandnil(dmCadastroUsuario);
  end;
end;

procedure TfrmCadastroUsuario.FormShow(Sender: TObject);
begin
  inherited;
  // abro o dataset
  dmCadastroUsuario.cdsCadastroUsuario.Open;
  dmCadastroUsuario.cdsPerfilUsuario.Open;
  AtualizaNomeGrid;
end;

procedure TfrmCadastroUsuario.GeraLogin;
var
  NomeCompleto, PrimeiroNome, UltimoNome: string;
  EspacoPosicao: Integer;
begin
  edtLoginUsuario.Text := '';
  NomeCompleto := edtNomeUsuario.Text;

  // Extrair o primeiro nome
  EspacoPosicao := Pos(' ', NomeCompleto);
  if EspacoPosicao > 0 then
    PrimeiroNome := Copy(NomeCompleto, 1, EspacoPosicao - 1)
  else
    PrimeiroNome := NomeCompleto;

  // Extrair o �ltimo nome
  EspacoPosicao := LastDelimiter(' ', NomeCompleto);
  if EspacoPosicao > 0 then
    UltimoNome := Copy(NomeCompleto, EspacoPosicao + 1, Length(NomeCompleto))
  else
    UltimoNome := NomeCompleto;

  // Exibir os resultados
    edtLoginUsuario.Text := PrimeiroNome + '.' + UltimoNome;
end;

procedure TfrmCadastroUsuario.InclusaoEdicao;
begin
  edtNomeUsuario.Enabled := true;
  edtLoginUsuario.Enabled := true;
  edtTelefoneUsuario.Enabled := true;
  edtEmailUsuario.Enabled := true;
  cboPerfilUsuario.Enabled := true;
  tgsSituacaoUsuario.Enabled := true;
  tgsSituacaoUsuario.state := tssOn;
  edtSenhaUsuario.Enabled := true;
  edtConfirmaSenhaUsuario.Enabled := true;
end;

function TfrmCadastroUsuario.ValidarNomeCompleto(const NomeCompleto: string): Boolean;
var
  RegEx: TRegEx;
begin
  RegEx := TRegEx.Create('^[A-Za-z]+(\s[A-Za-z]+)+$');
  Result := RegEx.IsMatch(NomeCompleto);
end;

end.
