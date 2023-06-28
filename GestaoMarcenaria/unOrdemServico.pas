unit unOrdemServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unFormPadrao, Data.DB, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmOrdemServico = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    edtDataStatusOS: TDBEdit;
    gbF5: TGroupBox;
    cboStatusOS: TDBComboBox;
    GroupBox2: TGroupBox;
    edtDataInclusaoOS: TDBEdit;
    gbF4: TGroupBox;
    edtCodigoOS: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrdemServico: TfrmOrdemServico;

implementation

{$R *.dfm}

end.
