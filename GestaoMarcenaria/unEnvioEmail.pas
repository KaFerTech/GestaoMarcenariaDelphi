unit unEnvioEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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
    Edit6: TEdit;
    GroupBox4: TGroupBox;
    mmDescricao: TMemo;
    btnSalvar: TButton;
    btnCancelar: TButton;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    ImageList1: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnvioEmail: TfrmEnvioEmail;

implementation

{$R *.dfm}

end.
