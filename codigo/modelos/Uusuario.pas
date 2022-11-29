unit Uusuario;

interface

type TUsuario = class
  private
    Fid: Integer;
    Flogin: String;
    Fsenha: String;
    FpessoaID: Integer;
    FcriadoEm: TDateTime;
    FcriadoPor: String;
    FalteradoEM: TDateTime;
    FalteradoPor: String;

  public
    property id:          Integer   read Fid          write Fid;
    property login:       String    read Flogin       write Flogin;
    property senha:       String    read Fsenha       write Fsenha;
    property pessoaID:    Integer   read FpessoaID    write FpessoaID;
    property criadoEm:    TDateTime read FcriadoEm    write FcriadoEm;
    property criadoPor:   String    read FcriadoPor   write FcriadoPor;
    property alteradoEM:  TDateTime read FalteradoEM  write FalteradoEM;
    property alteradoPor: String    read FalteradoPor write FalteradoPor;
end;

implementation

end.
