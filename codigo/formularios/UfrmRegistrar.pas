unit UfrmRegistrar;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  FireDAC.Phys.MySQLWrapper,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, Vcl.Mask;

type
  TfrmRegistrar = class(TForm)
    pnlRegistrar: TPanel;
    lblTituloRegistrar: TLabel;
    lblSubTituloRegistrar: TLabel;
    lblTituloAutenticar: TLabel;
    lblSubTituloAutenticar: TLabel;
    edtNome: TEdit;
    edtCpf: TEdit;
    edtSenha: TEdit;
    edtConfirmarSenha: TEdit;
    pnlBotaoAutenticar: TPanel;
    edtLogin: TEdit;
    procedure lblSubTituloAutenticarClick(Sender: TObject);
    procedure pnlBotaoAutenticarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegistrar: TfrmRegistrar;

implementation

{$R *.dfm}

uses
  UusuarioDao, Uusuario, UfrmTelaLogin, UValidadorUsuario, USetMainForm;

procedure TfrmRegistrar.lblSubTituloAutenticarClick(Sender: TObject);
begin
  if not Assigned(frmTelaLogin) then
    Application.CreateForm(TfrmTelaLogin, frmTelaLogin);

    TSetMainForm.SetMainForm(frmTelaLogin);
    frmTelaLogin.Show;

    Close();

end;

procedure TfrmRegistrar.pnlBotaoAutenticarClick(Sender: TObject);
var
  LUsuario: TUsuario;
  LDao: TUsuarioDao;
begin
  try
    try
      LUsuario:= TUsuario.Create;
      LUsuario.login := edtLogin.Text;
      LUsuario.senha := edtSenha.Text;
      LUsuario.pessoaID := 1;
      LUsuario.criadoEm := now();
      LUsuario.criadoPor := 'Guilherme';
      LUsuario.alteradoEM := now();
      LUsuario.alteradoPor := 'Guilherme';

      TValidadorUsuario.Validar(LUsuario, edtConfirmarSenha.Text);

      LDao := TUsuarioDao.Create();
      LDao.InserirUsuario(LUsuario);

    except
    on E: EMySQLNativeException do
      begin
        showMessage('Erro ao inserir o usuário no banco')
      end;
     on E: Exception do
      showMessage(E.Message);
    end;
  finally
    if Assigned(LDao) then
      FreeAndNil(LDao);

     FreeAndNil(LUsuario);
  end;
end;

end.