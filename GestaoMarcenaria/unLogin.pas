unit unLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, FireDAC.Stan.Param, FireDAC.Comp.Client;

type
  TfrmLogin = class(TForm)
    edtLogin: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnEntrar: TButton;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses unPrincipal, unDmLogin, uCriptografia, unDmConexao;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
var
  Query: TFDQuery;
begin

  // Modo teste
  if (edtLogin.text = 'teste') and (edtSenha.text = 'teste') then
  begin

    //ShowMessage('Sistema em Modo de Testes!');

    try
      Application.CreateForm(TFrmPrincipal, FrmPrincipal);
      FrmPrincipal.ShowModal;
    finally
      FrmPrincipal.Free;
      FrmPrincipal := nil;
    end;

  end
  else
  begin

    Query := TFDQuery.Create(nil);
    try
      Query.Connection := dmConexao.fdConnection;
      Query.SQL.text :=
        'SELECT COUNT(*) FROM USUARIO WHERE LOGIN = :login AND SENHA = :senha';
      Query.ParamByName('login').AsString := edtLogin.text;
      Query.ParamByName('senha').AsString :=
        CriptografarSenha(edtSenha.text, 855);
      Query.Open;

      if Query.Fields[0].AsInteger > 0 then
      begin

        try
          Application.CreateForm(TFrmPrincipal, FrmPrincipal);
          FrmPrincipal.ShowModal;
        finally
          FrmPrincipal.Free;
          FrmPrincipal := nil;
        end;
      end

      else
        ShowMessage('Usuário ou senha inválidos');
    finally
      Query.Free;
    end;
  end;

end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Action := caFree; // Liberar memória do formulário de login
  Application.Terminate;
end;

end.
