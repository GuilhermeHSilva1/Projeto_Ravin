unit UValidadorUsuario;

interface

uses Uusuario, System.SysUtils;

type TValidadorUsuario = class
  private

  public
  class procedure Validar(PUsuario: TUsuario; PSenhaConfirmar: String);
end;

implementation

{ TValidadorUsuario }

class procedure TValidadorUsuario.Validar(PUsuario: TUsuario ; PSenhaConfirmar: String);
begin

  if PUsuario.login.IsEmpty then
    raise Exception.Create('Login não pode ser vazio');

  if PUsuario.senha.IsEmpty then
    raise Exception.Create('Senha não pode ser vazia');

  if PUsuario.senha <> PSenhaConfirmar  then
    raise Exception.Create('As senhas devem ser iguais');




end;

end.
