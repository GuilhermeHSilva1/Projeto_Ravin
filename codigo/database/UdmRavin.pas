unit UdmRavin;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Dialogs, UiniUtils;

type
  TdmRavin = class(TDataModule)
    drvBancoDeDados: TFDPhysMySQLDriverLink;
    wtcBancoDeDados: TFDGUIxWaitCursor;
    cnxBancoDeDados: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure cnxBancoDeDadosBeforeConnect(Sender: TObject);
    procedure cnxBancoDeDadosAfterConnect(Sender: TObject);
  private
    { Private declarations }
    procedure CriarTabelas;
    procedure InserirDados;
  public
    { Public declarations }
  end;

var
  dmRavin: TdmRavin;

implementation

uses
  UVerificarConexão, UresourceUtils;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmRavin.DataModuleCreate(Sender: TObject);
begin
  if not cnxBancoDeDados.Connected then
    cnxBancoDeDados.Connected := true;
end;

procedure TdmRavin.CriarTabelas;
begin

  try
    cnxBancoDeDados.ExecSQL(TResourceUtils.carregarArquivoResource('createTable.sql','ravin'));
  except on E: Exception do
    showMessage(E.Message);
  end;

end;

procedure TdmRavin.InserirDados;
begin

  try
    cnxBancoDeDados.StartTransaction;
    cnxBancoDeDados.ExecSQL(TResourceUtils.carregarArquivoResource('inserts.sql','ravin'));
    cnxBancoDeDados.Commit;
  except
    On E: Exception do begin
      cnxBancoDeDados.Rollback;
      showMessage(E.Message);
    end;
  end;

end;

procedure TdmRavin.cnxBancoDeDadosBeforeConnect(Sender: TObject);
var
  LCriarBaseDados: Boolean;
begin
  with TIniUtils do
   begin

    TConnectionBD.Verificar_Conexao;

    LCriarBaseDados := not FileExists(TIniUtils.lerPropriedade(TSECAO.FILES, TPropriedade.FILE_EXISTS));

      with cnxBancoDeDados do
      begin

        Params.Values['Server']   := lerPropriedade(TSECAO.DATABASE_CONNECTION, SERVER);
        Params.Values['User_Name']:= lerPropriedade(TSECAO.DATABASE_CONNECTION, USER_NAME);
        Params.Values['Password'] := lerPropriedade(TSECAO.DATABASE_CONNECTION, PASSWORD);
        Params.Values['DriverID'] := lerPropriedade(TSECAO.DATABASE_CONNECTION, DRIVERID);
        Params.Values['Port']     := lerPropriedade(TSECAO.DATABASE_CONNECTION, PORT);

        if not lCriarBaseDados then begin
          Params.Values['Database'] := lerPropriedade(TSECAO.DATABASE_CONNECTION, DATABASE);
        end;

      end;
   end;
end;

procedure TdmRavin.cnxBancoDeDadosAfterConnect(Sender: TObject);
var
  LCriarBaseDados: Boolean;
begin
  LCriarBaseDados := not FileExists(TIniUtils.lerPropriedade(TSECAO.FILES, TPropriedade.FILE_EXISTS));

  if LCriarBaseDados then
  begin
    CriarTabelas;
    InserirDados;
    cnxBancoDeDados.Params.Values['Database'] := TIniUtils.lerPropriedade(TSECAO.DATABASE_CONNECTION, DATABASE);
  end;

end;

end.
