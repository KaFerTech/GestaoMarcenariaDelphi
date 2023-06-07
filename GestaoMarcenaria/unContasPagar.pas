unit unContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unFormPadrao, Data.DB, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin;

type
  TfrmContasPagar = class(TfrmPadrao)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContasPagar: TfrmContasPagar;

implementation

{$R *.dfm}

end.
