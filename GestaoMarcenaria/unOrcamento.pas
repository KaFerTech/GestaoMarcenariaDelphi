unit unOrcamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unFormPadrao, Data.DB, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.WinXCtrls;

type
  TfrmOrcamento = class(TfrmPadrao)
    gbU6: TGroupBox;
    cboClienteOS: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    edtDataStatusOS: TDBEdit;
    gbF5: TGroupBox;
    GroupBox2: TGroupBox;
    edtDataInclusaoOS: TDBEdit;
    gbF4: TGroupBox;
    edtCodigoOS: TDBEdit;
    cboStatusOS: TDBComboBox;
    GroupBox3: TGroupBox;
    edtNomeContato: TDBEdit;
    GroupBox4: TGroupBox;
    edtTelefoneContato: TDBEdit;
    PageControl1: TPageControl;
    tbsProdutos: TTabSheet;
    dbgProdutos: TDBGrid;
    GroupBox5: TGroupBox;
    edtDescricaoProduto: TDBEdit;
    GroupBox6: TGroupBox;
    edtComplementoProduto: TDBEdit;
    GroupBox7: TGroupBox;
    edtLarguraProduto: TDBEdit;
    GroupBox8: TGroupBox;
    edtAlturaProduto: TDBEdit;
    GroupBox9: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox16: TGroupBox;
    GroupBox10: TGroupBox;
    cboUsuarioFuncionario: TDBLookupComboBox;
    GroupBox11: TGroupBox;
    DBEdit1: TDBEdit;
    GroupBox13: TGroupBox;
    edtProfundidadeProduto: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    btnAdicionarProduto: TButton;
    GroupBox15: TGroupBox;
    edtQtdProduto: TDBEdit;
    GroupBox14: TGroupBox;
    ToggleSwitch1: TToggleSwitch;
    dbgMateriais: TDBGrid;
    Button1: TButton;
    dsOrcamento: TDataSource;
    dsMaterialProduto: TDataSource;
    dsAcabamento: TDataSource;
    dsOutrosMateriais: TDataSource;
    dsFuncionario: TDataSource;
    dsCliente: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrcamento: TfrmOrcamento;

implementation

{$R *.dfm}

end.
