program GestaoMarcenaria;

uses
  Vcl.Forms,
  unLogin in 'unLogin.pas' {frmLogin},
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unFormPadrao in 'unFormPadrao.pas' {frmPadrao},
  unDmConexao in 'unDmConexao.pas' {dmConexao: TDataModule},
  unCadastroUsuario in 'unCadastroUsuario.pas' {frmCadastroUsuario},
  unDmCadastroUsuario in 'unDmCadastroUsuario.pas' {dmCadastroUsuario: TDataModule},
  unDmLogin in 'unDmLogin.pas' {dmLogin: TDataModule},
  unCadastroFornecedor in 'unCadastroFornecedor.pas' {frmCadastroFornecedor},
  unDmCadastroFornecedor in 'unDmCadastroFornecedor.pas' {dmCadastroFornecedor: TDataModule},
  uCriptografia in 'uCriptografia.pas',
  unCadastroCliente in 'unCadastroCliente.pas' {frmCadastroCliente},
  unSobre in 'unSobre.pas' {frmSobre},
  unCadastroMaterial in 'unCadastroMaterial.pas' {frmCadastroMaterial},
  unGrupoMaterial in 'unGrupoMaterial.pas' {frmGrupoMaterial},
  unEstoqueMaterial in 'unEstoqueMaterial.pas' {frmEstoqueMaterial},
  unOrcamento in 'unOrcamento.pas' {frmOrcamento},
  unOrdemServico in 'unOrdemServico.pas' {frmOrdemServico},
  unContasPagar in 'unContasPagar.pas' {frmContasPagar},
  unContasReceber in 'unContasReceber.pas' {frmContasReceber},
  unCadastroFuncionario in 'unCadastroFuncionario.pas' {frmCadastroFuncionario},
  unCompras in 'unCompras.pas' {frmCompras},
  unVendas in 'unVendas.pas' {frmVendas},
  unDmSobre in 'unDmSobre.pas' {dmSobre: TDataModule},
  unDmCadastroCliente in 'unDmCadastroCliente.pas' {dmCadastroCliente: TDataModule},
  unDmCadastroMaterial in 'unDmCadastroMaterial.pas' {dmCadastroMaterial: TDataModule},
  unDmGrupoMaterial in 'unDmGrupoMaterial.pas' {dmGrupoMaterial: TDataModule},
  unDmEstoqueMaterial in 'unDmEstoqueMaterial.pas' {dmEstoqueMaterial: TDataModule},
  unDmOrcamento in 'unDmOrcamento.pas' {dmOrcamento: TDataModule},
  unDmOrdemServico in 'unDmOrdemServico.pas' {dmOrdemServico: TDataModule},
  unDmContasPagar in 'unDmContasPagar.pas' {dmContasPagar: TDataModule},
  unDmContasReceber in 'unDmContasReceber.pas' {dmContasReceber: TDataModule},
  unDmCadastroFuncionario in 'unDmCadastroFuncionario.pas' {dmCadastroFuncionario: TDataModule},
  unDmCompras in 'unDmCompras.pas' {dmCompras: TDataModule},
  unDmVendas in 'unDmVendas.pas' {dmVendas: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.
