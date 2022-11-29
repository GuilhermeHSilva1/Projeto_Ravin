unit USetMainForm;

interface

uses
  Vcl.Forms;

type TSetMainForm = class
  private

  public

  class procedure SetMainForm(pForm: TForm);

end;

implementation

{ TSetMainForm }

class procedure TSetMainForm.SetMainForm(pForm: TForm);
var
  tmpMain: ^TCustomForm;
begin
  tmpMain := @Application.Mainform;
  tmpMain^ := pForm;
end;

end.
