unit UfrmCadastroCliente;

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
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.WinXCtrls,

  UfrmBotaoExcluir,
  UfrmBotaoCancelar, UfrmBotaoPrimario;

type
  TfrmCadastroCliente = class(TForm)
    pnlCadastroCliente: TPanel;
    lblCadastroCliente: TLabel;
    edtNome: TEdit;
    edtTelefone: TEdit;
    mskCpf: TMaskEdit;
    dtpDataNascimento: TDateTimePicker;
    frmBotaoCancelar: TfrmBotaoCancelar;
    frmBotaoExcluir: TfrmBotaoExcluir;
    frmBotaoPrimario1: TfrmBotaoPrimario;
    procedure frmBotaoPrimario1spbBotaoPrimarioClick(Sender: TObject);
    procedure frmBotaoExcluirspbBotaoExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

procedure TfrmCadastroCliente.frmBotaoExcluirspbBotaoExcluirClick(
  Sender: TObject);
var
  LConfirmacaoExclusao: Integer;
begin
  LConfirmacaoExclusao :=MessageDlg('Deseja realmente excluir o registro ?',
              TMsgDlgType.mtWarning,[TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0);

  if LConfirmacaoExclusao = mrYes then
  begin
    showMessage('Registro Excluido com sucesso!');
  end;

  if LConfirmacaoExclusao = mrNo then
  begin


  end;

end;

procedure TfrmCadastroCliente.frmBotaoPrimario1spbBotaoPrimarioClick(
  Sender: TObject);
begin
  showMessage('Cleinte cadastrado com Sucesso!');
  Close();
end;

end.
