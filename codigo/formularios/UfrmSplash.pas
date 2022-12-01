unit UfrmSplash;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Variants,
  System.Classes,
  System.DateUtils,
  System.SysUtils,

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
    function VerificarLoginExpirou(): Boolean;

    const DIAS_MAX_LOGIN: Integer = 5;
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

uses UfrmTelaLogin, UiniUtils, UfrmPainelGestao, USetMainForm ;

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

  try
   //Carregando se o usuário está logado
   LLogado := TIniUtils.lerPropriedade(
      TSECAO.INFORMACOES_GERAIS,
      TPROPRIEDADE.LOGADO);


   if (LLogado = TIniUtils.VALOR_VERDADEIRO) and not VerificarLoginExpirou then
      ShowPainelGestao()
   else
      showLogin();

  except
    showLogin();
  end;
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

function TfrmSplash.VerificarLoginExpirou: Boolean;
var
  LData: TDateTime;
begin

  //Carregando a DataHora do ultimo login do Usuario
  LData   := StrToDateTime(TIniUtils.lerPropriedade(
    TSECAO.INFORMACOES_GERAIS,
    TPROPRIEDADE.DATA_LOGIN));

    Result:= IncDay(LData, DIAS_MAX_LOGIN) < now();

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


