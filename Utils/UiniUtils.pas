unit UiniUtils;

interface

uses
  System.IOUtils,

  Vcl.Forms,

  TypInfo,
  IniFiles;

type
  TSECAO = (CONFIGURACOES, INFORMACOES_GERAIS, DATABASE_CONNECTION, FILES);

type
  TPROPRIEDADE = (NOME_DATABASE, LOGADO, DATA_LOGIN,
                  SERVER, USER_NAME, PASSWORD, DRIVERID, PORT, DATABASE, FILE_EXISTS);

type
  TIniUtils = class
  private

  protected

  public
    constructor Create();
    destructor Destroy; override;

    class procedure gravarPropriedade(PSecao: TSECAO;
      PPropriedade: TPROPRIEDADE; PValor: String);
    class function lerPropriedade(PSecao: TSECAO;
      PPropriedade: TPROPRIEDADE): String;

    const VALOR_VERDADEIRO: String = 'true';
    const VALOR_FALSO: String = 'false';

  end;

implementation

{ TIniUltis }

constructor TIniUtils.Create;
begin
  inherited;

end;

destructor TIniUtils.Destroy;
begin

  inherited;
end;

class procedure TIniUtils.gravarPropriedade(PSecao: TSECAO;
  PPropriedade: TPROPRIEDADE; PValor: String);
var
  LcaminhoArquivoIni: String;
  LarquivoINI: TIniFile;
  LNomeSecao : String;
  LNomePropriedade : string;
begin
  LcaminhoArquivoIni := TPath.Combine(TPath.Combine(TPath.GetDocumentsPath,
    'ravin'), 'configuracoes.ini');
  LarquivoINI := TIniFile.Create(LcaminhoArquivoIni);

  LNomeSecao       := GetEnumName(TypeInfo(TSECAO), Integer(PSecao));
  LNomePropriedade := GetEnumName(TypeInfo(TPROPRIEDADE), Integer(PPropriedade));

  LarquivoINI.WriteString(LNomeSecao, LNomePropriedade, PValor);
  LarquivoINI.Free;
end;

class function TIniUtils.lerPropriedade(PSecao: TSECAO;
  PPropriedade: TPROPRIEDADE): String;
var
  LcaminhoArquivoIni: String;
  LarquivoINI: TIniFile;
begin
  LcaminhoArquivoIni := TPath.Combine(TPath.Combine(TPath.GetDocumentsPath,
    'ravin'), 'configuracoes.ini');
  LarquivoINI := TIniFile.Create(LcaminhoArquivoIni);
  Result := LarquivoINI.ReadString(GetEnumName(TypeInfo(TSECAO), Integer(PSecao)
    ), GetEnumName(TypeInfo(TPROPRIEDADE), Integer(PPropriedade)), '');
  LarquivoINI.Free;
end;

end.
