unit UVerificarConexão;

interface

uses UiniUtils, System.SysUtils;

type TConnectionBD = class
  private

  public
    class procedure Verificar_Conexao;

    const FILE_EXISTSBD: String = 'C:\ProgramData\MySQL\MySQL Server 8.0\Data\ravin\statusmesa.ibd';
    const SERVERBD: String = 'localhost';
    const USER_NAMEBD: String = 'root';
    const PASSWORDBD: String = 'root';
    const DRIVERIDBD: String = 'MySQL';
    const PORTBD: String = '3306';
    const DATABASEBD: String = 'ravin';

end;



implementation

{ TConnectionBD }

class procedure TConnectionBD.Verificar_Conexao;
begin

  with TIniUtils do
    begin

    if not FileExists(lerPropriedade(TSECAO.FILES, TPropriedade.FILE_EXISTS)) then
      begin

        gravarPropriedade(TSECAO.FILES, TPropriedade.FILE_EXISTS, FILE_EXISTSBD);
        gravarPropriedade(TSECAO.DATABASE_CONNECTION, TPROPRIEDADE.SERVER, SERVERBD);
        gravarPropriedade(TSECAO.DATABASE_CONNECTION, TPROPRIEDADE.USER_NAME, USER_NAMEBD);
        gravarPropriedade(TSECAO.DATABASE_CONNECTION, TPROPRIEDADE.PASSWORD, PASSWORDBD);
        gravarPropriedade(TSECAO.DATABASE_CONNECTION, TPROPRIEDADE.DRIVERID, DRIVERIDBD);
        gravarPropriedade(TSECAO.DATABASE_CONNECTION, TPROPRIEDADE.PORT, PORTBD);
        gravarPropriedade(TSECAO.DATABASE_CONNECTION, TPROPRIEDADE.DATABASE, DATABASEBD);

      end

    end;

end;

end.
