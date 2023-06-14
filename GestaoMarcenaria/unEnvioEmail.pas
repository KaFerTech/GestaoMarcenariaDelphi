unit unEnvioEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  IdMessage, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, IdBaseComponent, IdComponent,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  Vcl.StdCtrls;

type
  TfrmEnvioEmail = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    edtHost: TEdit;
    Label2: TLabel;
    edtPorta: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtEmailUsuario: TEdit;
    edtSenha: TEdit;
    Label6: TLabel;
    Label5: TLabel;
    edtAssunto: TEdit;
    edtEmail: TEdit;
    GroupBox4: TGroupBox;
    mmDescricao: TMemo;
    btnSalvar: TButton;
    btnCancelar: TButton;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    ImageList1: TImageList;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtHostKeyPress(Sender: TObject; var Key: Char);
    procedure edtPortaKeyPress(Sender: TObject; var Key: Char);
    procedure edtEmailUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure edtAssuntoKeyPress(Sender: TObject; var Key: Char);
    procedure edtEmailKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure proEnviaEmail;
  public
    { Public declarations }
  end;

var
  frmEnvioEmail: TfrmEnvioEmail;

implementation

{$R *.dfm}

procedure TfrmEnvioEmail.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmEnvioEmail.btnSalvarClick(Sender: TObject);
begin
  // proSalvConfiguracoes;
  proEnviaEmail;
end;

procedure TfrmEnvioEmail.edtAssuntoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edtEmail.SetFocus;
end;

procedure TfrmEnvioEmail.edtEmailKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    mmDescricao.SetFocus;
end;

procedure TfrmEnvioEmail.edtEmailUsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    edtSenha.SetFocus;
end;

procedure TfrmEnvioEmail.edtHostKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edtPorta.SetFocus;
end;

procedure TfrmEnvioEmail.edtPortaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edtEmailUsuario.SetFocus;
end;

procedure TfrmEnvioEmail.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edtAssunto.SetFocus;
end;

procedure TfrmEnvioEmail.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 Then
    close;
end;

procedure TfrmEnvioEmail.FormShow(Sender: TObject);
begin
  edtHost.Text := 'smtp.gmail.com';
  edtPorta.Text := '465';
  edtEmailUsuario.Text := 'fernandeskaique77@gmail.com';
  // edtSenha.Text := '';
  edtAssunto.Text := 'Teste de Envio de Email Pelo Delphi';
  edtEmail.Text := 'kaique.fnds@hotmail.com';
  edtSenha.SetFocus;
end;

procedure TfrmEnvioEmail.proEnviaEmail;
begin

  with IdSMTP1 do
  begin
    try
      IdSMTP1.Connect('0');
    Except
      ShowMessage('Erro');
    end;

    Host := edtHost.Text;
    Port := StrtoInt(edtPorta.Text);
    Username := edtEmailUsuario.Text;
    Password := edtSenha.Text;

    IdMessage1.From.Address := edtEmailUsuario.Text;
    IdMessage1.Subject := edtAssunto.Text;

    IdMessage1.Recipients.EMailAddresses := edtEmail.Text;

    IdMessage1.Body := mmDescricao.Lines;

    if not IdSMTP1.Connected then
    begin
      IdSMTP1.Connect;
    end;

  end;

end;

end.
