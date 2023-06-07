unit unFormPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPadrao = class(TForm)
    ToolBar1: TToolBar;
    imgListFormPadrao: TImageList;
    actFormPadrao: TActionList;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnCancelar: TToolButton;
    btnSalvar: TToolButton;
    ToolButton7: TToolButton;
    btnFechar: TToolButton;
    actIncluir: TAction;
    actAlterar: TAction;
    actExcluir: TAction;
    actCancelar: TAction;
    actSalvar: TAction;
    actFechar: TAction;
    Panel1: TPanel;
    dbgFormPadrao: TDBGrid;
    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure BotoesPadroes;
  public
    { Public declarations }
  end;

var
  frmPadrao: TfrmPadrao;

implementation

uses System.UITypes;

{$R *.dfm}

procedure TfrmPadrao.actAlterarExecute(Sender: TObject);
begin
  if (btnSalvar.enabled = false) then
  begin
    btnIncluir.enabled := false;
    btnAlterar.enabled := false;
    btnExcluir.enabled := false;
    btnCancelar.enabled := true;
    btnSalvar.enabled := true;
    btnFechar.enabled := true;
    dbgFormPadrao.Enabled := false;
  end;
end;

procedure TfrmPadrao.actCancelarExecute(Sender: TObject);
begin
  BotoesPadroes;
end;

procedure TfrmPadrao.actExcluirExecute(Sender: TObject);
begin
  BotoesPadroes;
end;

procedure TfrmPadrao.actFecharExecute(Sender: TObject);
begin

  if btnSalvar.enabled = true then
  begin
    if messagedlg
      ('Deseja mesmo fechar essa tela? Todo o conteúdo não salvo será perdido!',
      mtconfirmation, [mbyes, mbno], 0) = mryes then
    begin
      close;
    end;
  end
  else
  begin
    close;
  end;
end;

procedure TfrmPadrao.actIncluirExecute(Sender: TObject);
begin
  if (btnSalvar.enabled = false) then
  begin
    btnIncluir.enabled := false;
    btnAlterar.enabled := false;
    btnExcluir.enabled := false;
    btnCancelar.enabled := true;
    btnSalvar.enabled := true;
    btnFechar.enabled := true;
    dbgFormPadrao.Enabled := false;
  end;
end;

procedure TfrmPadrao.actSalvarExecute(Sender: TObject);
begin
  BotoesPadroes;
end;

procedure TfrmPadrao.BotoesPadroes;
begin
  btnIncluir.enabled := true;
  btnAlterar.enabled := true;
  btnExcluir.enabled := true;
  btnCancelar.enabled := false;
  btnSalvar.enabled := false;
  btnFechar.enabled := true;
  dbgFormPadrao.Enabled := true;
end;

procedure TfrmPadrao.FormShow(Sender: TObject);
begin
  BotoesPadroes;
end;

end.
