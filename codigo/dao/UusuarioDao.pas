unit UusuarioDao;

interface

uses
  System.SysUtils, Uusuario ,FireDAC.Comp.Client,System.Generics.Collections;

type TUsuarioDAO = class
  private

  public
    function BuscarUsuarioPorLoginSenha(pLogin: String; pSenha: String): TUsuario;
    function BuscarTodosUsuarios(): TList<TUsuario>;
    procedure InserirUsuario(Pusuario: TUsuario);
end;

implementation

{ TUsuarioDAO }

uses UdmRavin, System.Classes;

function TUsuarioDAO.BuscarTodosUsuarios: TList<TUsuario>;
var
  LLista: TList<TUsuario>;
  LQuery: TFDQuery;
  LUsuario : TUsuario;
begin
  LQuery:= TFDQuery.Create(nil);
  LQuery.Connection := dmRavin.cnxBancoDeDados;
  LQuery.SQL.Text:= 'select * from usuario';
  LQuery.Open();

  LLista := TList<TUsuario>.create();

  LQuery.First;
  while not LQuery.Eof do
  begin
    LUsuario:= TUsuario.Create;
    LUsuario.login := LQuery.FieldByName('login').AsString;

    LLista.add(LUsuario);

    LQuery.next;
  end;

  result := LLista;

  FreeAndNil(LQuery);

end;

function TUsuarioDAO.BuscarUsuarioPorLoginSenha(pLogin: String; pSenha: String): TUsuario;
var
  LQuery: TFDQuery;
  LUsuario: TUsuario;
begin
  LQuery := TFDQuery.Create(nil);
  LQuery.Connection := dmRavin.cnxBancoDeDados;
  LQuery.SQL.Text := 'select * from usuario where login = :login and senha = :senha';
  LQuery.ParamByName('login').AsString := PLogin;
  LQuery.ParamByName('senha').AsString := PSenha;
  LQuery.Open();

  LUsuario:= nil;

  if not LQuery.IsEmpty then
    begin
      LUsuario             := TUsuario.Create;
      LUsuario.id          := LQuery.FieldByName('id').AsInteger;
      LUsuario.login       := LQuery.FieldByName('login').AsString;
      LUsuario.senha       := LQuery.FieldByName('senha').AsString;
      LUsuario.pessoaID    := LQuery.FieldByName('pessoaID').asInteger;
      LUsuario.criadoEm    := LQuery.FieldByName('criadoEm').AsDateTime;
      LUsuario.criadoPor   := LQuery.FieldByName('criadoPor').AsString;
      LUsuario.alteradoEm  := LQuery.FieldByName('alteradoEm').asDateTime;
      LUsuario.alteradoPor := LQuery.FieldByName('alteradoPor').AsString;
    end;

    LQuery.Close;
    FreeAndNil(LQuery);
    Result:= LUsuario;

end;

procedure TUsuarioDAO.InserirUsuario(Pusuario: TUsuario);
var
  LQuery: TFDQuery;
begin
  LQuery := TFDQuery.Create(nil);

  with LQuery do
  begin
    Connection:= dmRavin.cnxBancoDeDados;
    SQL.Text:= 'Insert Into usuario (login, senha, pessoaID, criadoEm, criadoPor, alteradoEm, alteradoPor)'
    + 'Values (:login, :senha, :pessoaID, :criadoEm, :criadoPor, :alteradoEm, :alteradoPor)';

    ParamByName('login').AsString := Pusuario.login;
    ParamByName('senha').AsString := Pusuario.senha;
    ParamByName('pessoaID').AsInteger := Pusuario.pessoaID;
    ParamByName('criadoEm').AsDateTime := Pusuario.criadoEm;
    ParamByName('criadoPor').AsString := Pusuario.criadoPor;
    ParamByName('alteradoEm').AsDateTime := Pusuario.alteradoEM;
    ParamByName('alteradoPor').AsString := Pusuario.alteradoPor;
    ExecSql();
  end;

    FreeAndNil(LQuery);
end;

end.
