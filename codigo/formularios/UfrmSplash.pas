unit UfrmSplash;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls,

  UfrmLogomarca;

type
  TfrmSplash = class(TForm)
    pnlFundo: TPanel;
    tmrSplash: TTimer;
    frmLogo: TfrmLogo;
    procedure tmrSplashTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
    Inicialized: Boolean;
    procedure InicializarAplicacao();
    procedure ShowPainelGestao();
    procedure ShowLogin();
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

uses UfrmTelaLogin, UiniUtils, UfrmPainelGestao, USetMainForm;

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  Inicialized := false;
  tmrSplash.Enabled := false;
  tmrSplash.Interval := 1000;
end;

procedure TfrmSplash.FormPaint(Sender: TObject);
begin
  tmrSplash.Enabled := not Inicialized;
end;

procedure TfrmSplash.InicializarAplicacao;
var
  LLogado: String;
begin
   LLogado := TIniUtils.lerPropriedade(TSECAO.INFORMACOES_GERAIS, TPROPRIEDADE.LOGADO);

   if LLogado = TIniUtils.VALOR_VERDADEIRO then
      ShowPainelGestao()
   else
      ShowLogin();
end;

procedure TfrmSplash.tmrSplashTimer(Sender: TObject);
begin
  tmrSplash.Enabled := false;
  if not Inicialized then
  begin
    Inicialized := true;
    InicializarAplicacao();
  end;
end;

procedure TfrmSplash.ShowLogin;
begin

if not Assigned(frmTelaLogin) then
  begin
    Application.CreateForm(TfrmTelaLogin, frmTelaLogin);
  end;

  TSetMainForm.SetMainForm(frmTelaLogin);
  frmTelaLogin.Show();

  Close;
end;

procedure TfrmSplash.ShowPainelGestao;
begin

if not Assigned(frmPainelGestao) then
  begin
    Application.CreateForm(TfrmPainelGestao, frmPainelGestao);
  end;

  TSetMainForm.SetMainForm(frmPainelGestao);
  frmPainelGestao.Show();

  Close;
end;

end.


