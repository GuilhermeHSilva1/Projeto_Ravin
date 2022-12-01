unit UfrmListaClientes;

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
  Vcl.StdCtrls,

  UfrmBotaoCancelar, Vcl.ExtCtrls, UfrmBotaoExcluir, Vcl.Buttons,
  UfrmBotaoPrimario;

type
  TfrmListaClientes = class(TForm)
    lvwClientes: TListView;
    Shape1: TShape;
    Shape2: TShape;
    Shape5: TShape;
    lblInformacoesGerenciais: TLabel;
    pnlListaClientes: TPanel;
    lblListaClientesTitulo: TLabel;
    frmBotaoCancelar: TfrmBotaoCancelar;
    frmBotaoExcluir: TfrmBotaoExcluir;
    frmBotaoPrimario1: TfrmBotaoPrimario;
    procedure frmBotaoPrimario1spbBotaoPrimarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListaClientes: TfrmListaClientes;

implementation

{$R *.dfm}

uses UfrmCadastroCliente;

procedure TfrmListaClientes.frmBotaoPrimario1spbBotaoPrimarioClick(
  Sender: TObject);
begin
  if not assigned(frmCadastroCliente) then
    begin
      Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
    end;
    frmCadastroCliente.Show();
end;

end.
