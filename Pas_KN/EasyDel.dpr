program EasyDel;

{.$Define WinXPstyle}

uses
  Windows,
  SysUtils,
  Messages,
  Forms,
  MainF in 'MainF.pas' {ShoreiEasyDeleterMainForm},
  LicenseF in 'LicenseF.pas' {LicenseForm},
  FilesF in 'FilesF.pas' {FileNamesForm};

{$R *.res}
{$R ImageRes.res}
{$IfDef WinXPstyle}
{$R WinXP.res}
{$EndIf WinXPStyle}

begin
  Application.Initialize;

  Application.Title := '| Shorei | EasyDeleter';

  Application.CreateForm(TShoreiEasyDeleterMainForm, ShoreiEasyDeleterMainForm);
  Application.CreateForm(TLicenseForm, LicenseForm);
  Application.CreateForm(TFileNamesForm, FileNamesForm);

  Application.Run;
end.
