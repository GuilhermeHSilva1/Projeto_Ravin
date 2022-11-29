unit UfrmTelaLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, FireDAC.Comp.Client,System.Generics.Collections;

type
  TfrmTelaLogin = class(TForm)
    pnlAutenticacao: TPanel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    pnlBotaoAutenticar: TPanel;
    ImgLogo: TImage;
    lblTitulo: TLabel;
    lblSubTitulo: TLabel;
    lblSubTituloRegistrar: TLabel;
    lblTituloRegistrar: TLabel;
    procedure pnlBotaoAutenticarClick(Sender: TObject);
    procedure lblTituloRegistrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaLogin: TfrmTelaLogin;

implementation

{$R *.dfm}

uses UfrmPainelGestao, UusuarioDao, Uusuario, UfrmRegistrar, UiniUtils,
  USetMainForm;



procedure TfrmTelaLogin.lblTituloRegistrarClick(Sender: TObject);
begin
  if not Assigned(frmRegistrar) then
    Application.CreateForm(TfrmRegistrar, frmRegistrar);

    TSetMainForm.SetMainForm(frmRegistrar);
    frmRegistrar.Show();

    close();
end;

procedure TfrmTelaLogin.pnlBotaoAutenticarClick(Sender: TObject);
var
  Ldao: TUsuarioDao;
  LUsuario: TUsuario;
begin

  Ldao:= TUsuarioDao.Create();
 try

    LUsuario := Ldao.BuscarUsuarioPorLoginSenha(edtLogin.Text, edtSenha.Text);

  if Assigned(LUsuario) then
      begin

        TIniUtils.gravarPropriedade(TSECAO.INFORMACOES_GERAIS, TPROPRIEDADE.LOGADO
        , TIniUtils.VALOR_VERDADEIRO);

        if not Assigned(frmPainelGestao) then
        begin
          Application.CreateForm(TfrmPainelGestao, frmPainelGestao);
        end;

        TSetMainForm.SetMainForm(frmPainelGestao);
        frmPainelGestao.Show();

        close();
    end
    else
      showMessage('Login e/ou senha Invalido');
 Except
  on E: exception do
    showMessage(E.Message);
 end;

  FreeAndNil(Ldao);
  FreeAndNil(LUsuario);

end;

end.
