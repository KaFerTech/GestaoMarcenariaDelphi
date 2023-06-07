unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.ExtCtrls, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.ToolWin, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    mmPrincipal: TMainMenu;
    mmCadastros: TMenuItem;
    mmCadastroUsuarios: TMenuItem;
    N1: TMenuItem;
    mmCadastroClientes: TMenuItem;
    mmEstoque: TMenuItem;
    mmCadastroFornecedores: TMenuItem;
    mmCadastroFuncionarios: TMenuItem;
    mmEstoqueMateriais: TMenuItem;
    N2: TMenuItem;
    mmGrupoMateriais: TMenuItem;
    mmCadastroMateriais: TMenuItem;
    mmServico: TMenuItem;
    mmOrcamento: TMenuItem;
    mmOrdemServico: TMenuItem;
    mmVendas: TMenuItem;
    mmCompras: TMenuItem;
    mmRelatórios: TMenuItem;
    mmAjuda: TMenuItem;
    mmSobre: TMenuItem;
    tbPrincipal: TToolBar;
    actListPrincipal: TActionList;
    imgListPrincipal: TImageList;
    StatusBar1: TStatusBar;
    btnCadastroCliente: TToolButton;
    btnCadastroFornecedor: TToolButton;
    ToolButton5: TToolButton;
    btnEstoqueMaterial: TToolButton;
    ToolButton9: TToolButton;
    btnOrcamento: TToolButton;
    btnOrdemServico: TToolButton;
    actCadastroUsuario: TAction;
    actCadastroFuncionario: TAction;
    actCadastroCliente: TAction;
    actCadastroFornecedor: TAction;
    actCadastroMaterial: TAction;
    actGrupoMaterial: TAction;
    actEstoqueMaterial: TAction;
    actOrcamento: TAction;
    actOrdemServico: TAction;
    actSobre: TAction;
    N3: TMenuItem;
    mmFecharSistema: TMenuItem;
    actFecharSistema: TAction;
    ToolButton1: TToolButton;
    btnFecharSistema: TToolButton;
    Panel1: TPanel;
    actContasPagar: TAction;
    actContasReceber: TAction;
    mmFinanceiro: TMenuItem;
    mmContasPagar: TMenuItem;
    mmContasReceber: TMenuItem;
    ToolButton2: TToolButton;
    btnContaPagar: TToolButton;
    btnContaReceber: TToolButton;
    ToolButton6: TToolButton;
    btnVenda: TToolButton;
    actCompras: TAction;
    actVendas: TAction;
    btnCompra: TToolButton;
    mmRealizarVenda: TMenuItem;
    mmRealizarCompra: TMenuItem;
    actRelUsuario: TAction;
    mmRelUsuario: TMenuItem;
    procedure actCadastroUsuarioExecute(Sender: TObject);
    procedure btnFecharSistemaClick(Sender: TObject);
    procedure actFecharSistemaExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSobreExecute(Sender: TObject);
    procedure actCadastroFornecedorExecute(Sender: TObject);
    procedure actCadastroFuncionarioExecute(Sender: TObject);
    procedure actCadastroClienteExecute(Sender: TObject);
    procedure actCadastroMaterialExecute(Sender: TObject);
    procedure actGrupoMaterialExecute(Sender: TObject);
    procedure actEstoqueMaterialExecute(Sender: TObject);
    procedure actOrdemServicoExecute(Sender: TObject);
    procedure actOrcamentoExecute(Sender: TObject);
    procedure actContasPagarExecute(Sender: TObject);
    procedure actContasReceberExecute(Sender: TObject);
    procedure actVendasExecute(Sender: TObject);
    procedure actComprasExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actRelUsuarioExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var
      autenticado: boolean;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses unLogin, unSobre, unCadastroUsuario, unCadastroFornecedor,
  unCadastroCliente, unCadastroMaterial, unGrupoMaterial, unEstoqueMaterial,
  unOrcamento, unOrdemServico, unContasPagar, unContasReceber,
  unCadastroFuncionario, unCompras, unVendas, unRelatorioUsuario;

procedure TfrmPrincipal.actCadastroClienteExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
    frmCadastroCliente.ShowModal;
  finally
    frmCadastroCliente.Free;
    frmCadastroCliente := nil;
  end;
end;

procedure TfrmPrincipal.actCadastroFornecedorExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadastroFornecedor, frmCadastroFornecedor);
    frmCadastroFornecedor.ShowModal;
  finally
    frmCadastroFornecedor.Free;
    frmCadastroFornecedor := nil;
  end;
end;

procedure TfrmPrincipal.actCadastroFuncionarioExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadastroFuncionario, frmCadastroFuncionario);
    frmCadastroUsuario.ShowModal;
  finally
    frmCadastroUsuario.Free;
    frmCadastroUsuario := nil;
  end;
end;

procedure TfrmPrincipal.actCadastroMaterialExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadastroMaterial, frmCadastroMaterial);
    frmCadastroMaterial.ShowModal;
  finally
    frmCadastroMaterial.Free;
    frmCadastroMaterial := nil;
  end;
end;

procedure TfrmPrincipal.actCadastroUsuarioExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadastroUsuario, frmCadastroUsuario);
    frmCadastroUsuario.ShowModal;
  finally
    frmCadastroUsuario.Free;
    frmCadastroUsuario := nil;
  end;
end;

procedure TfrmPrincipal.actComprasExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCompras, frmCompras);
    frmCompras.ShowModal;
  finally
    frmCompras.Free;
    frmCompras := nil;
  end;
end;

procedure TfrmPrincipal.actContasPagarExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmContasPagar, frmContasPagar);
    frmContasPagar.ShowModal;
  finally
    frmContasPagar.Free;
    frmContasPagar := nil;
  end;
end;

procedure TfrmPrincipal.actContasReceberExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmContasReceber, frmContasReceber);
    frmContasReceber.ShowModal;
  finally
    frmContasReceber.Free;
    frmContasReceber := nil;
  end;
end;

procedure TfrmPrincipal.actEstoqueMaterialExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmEstoqueMaterial, frmEstoqueMaterial);
    frmEstoqueMaterial.ShowModal;
  finally
    frmEstoqueMaterial.Free;
    frmEstoqueMaterial := nil;
  end;
end;

procedure TfrmPrincipal.actFecharSistemaExecute(Sender: TObject);
begin
  if messagedlg('Deseja mesmo sair do sistema?', mtconfirmation, [mbyes, mbno],
    0) = mryes then
  begin
    Application.Terminate;
  end;
end;

procedure TfrmPrincipal.actGrupoMaterialExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmGrupoMaterial, frmGrupoMaterial);
    frmGrupoMaterial.ShowModal;
  finally
    frmGrupoMaterial.Free;
    frmGrupoMaterial := nil;
  end;
end;

procedure TfrmPrincipal.actOrcamentoExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmOrcamento, frmOrcamento);
    frmOrcamento.ShowModal;
  finally
    frmOrcamento.Free;
    frmOrcamento := nil;
  end;
end;

procedure TfrmPrincipal.actOrdemServicoExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmOrdemServico, frmOrdemServico);
    frmOrdemServico.ShowModal;
  finally
    frmOrdemServico.Free;
    frmOrdemServico := nil;
  end;
end;

procedure TfrmPrincipal.actRelUsuarioExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmRelatorioUsuario, frmRelatorioUsuario);
    frmRelatorioUsuario.ShowModal;
  finally
    frmRelatorioUsuario.Free;
    frmRelatorioUsuario := nil;
  end;
end;

procedure TfrmPrincipal.actSobreExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmSobre, frmSobre);
    frmSobre.ShowModal;
  finally
    frmSobre.Free;
    frmSobre := nil;
  end;
end;

procedure TfrmPrincipal.actVendasExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmVendas, frmVendas);
    frmVendas.ShowModal;
  finally
    frmVendas.Free;
    frmVendas := nil;
  end;
end;

procedure TfrmPrincipal.btnFecharSistemaClick(Sender: TObject);
begin
  if messagedlg('Deseja mesmo sair do sistema?', mtconfirmation, [mbyes, mbno],
    0) = mryes then
  begin
    Application.Terminate;
    frmLogin.Close;
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
  frmLogin.Close;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

  //autenticado := false;
  //Self.Visible := False;

//  frmLogin.Hide;
//  Application.MainFormOnTaskbar := True;


end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
//  frmLogin.Visible := false;
////  frmLogin.Hide; // Ocultar o formulário de login
//  frmPrincipal.Show; // Ocultar o formulário de login
//  Application.MainFormOnTaskbar := True;
//  Application.BringToFront; // Trazer o aplicativo para a frente
end;

end.
