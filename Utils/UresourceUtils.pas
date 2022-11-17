unit UresourceUtils;

interface

uses
  System.IOUtils,
  System.SysUtils,
  System.Classes;

type
  TResourceUtils = class(TObject)
  private

  protected

  public
    function carregarArquivoResource(PNomeArquivo: String; PNomeAplicacao: String): String;
end;


implementation

function TResourceUtils.carregarArquivoResource(PNomeArquivo: string; PNomeAplicacao: string): string;
var
  LConteudoArquivo: TStringlist;
  LCaminhoArquivo: String;
  LCaminhoPastaAplicacao: String;
begin
  try
    LConteudoArquivo := TStringList.Create;
        
    try
    
      LCaminhoPastaAplicacao := TPath.Combine(TPath.GetDocumentsPath, PNomeAplicacao);
      LCaminhoArquivo:= TPath.Combine(LCaminhoPastaAplicacao, PNomeArquivo);

      LConteudoArquivo.LoadFromFile(LCaminhoArquivo);

      Result:= LConteudoArquivo.Text;
      
    except on E: Exception do
      raise Exception.Create('Erro ao carregar os arquivos de de resource.' + ' Arquivo: '+ PNomeArquivo);
    end;
    
  finally
    LConteudoArquivo.Free;
  end;
  
  Result:= '';
end;

end.
