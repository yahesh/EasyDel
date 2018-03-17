unit LicenseF;

interface

uses
  StdCtrls,
  Forms,
  ExtCtrls,
  Controls,
  Classes;

type
  TLicenseForm = class(TForm)
    AgreeLicenseRadioGroup : TRadioGroup;
    BottomButtonsBevel     : TBevel;
    LicenseMemo            : TMemo;
    NextButton             : TButton;

    procedure FormShow(Sender : TObject);
    procedure NextButtonClick(Sender : TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  LicenseForm : TLicenseForm;

implementation

uses
  MainF;

{$R *.dfm}

procedure TLicenseForm.FormShow(Sender : TObject);
begin
  if ShoreiEasyDeleterMainForm.FLicenseAgreed then
    AgreeLicenseRadioGroup.ItemIndex := 1
  else
    AgreeLicenseRadioGroup.ItemIndex := 0;
end;

procedure TLicenseForm.NextButtonClick(Sender : TObject);
begin
  ShoreiEasyDeleterMainForm.FLicenseAgreed := (AgreeLicenseRadioGroup.ItemIndex = 1);

  Close;
end;

end.
