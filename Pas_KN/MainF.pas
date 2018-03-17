unit MainF;

interface

uses
  Windows,
  SysUtils,
  StdCtrls,
  Spin,
  ShlObj,
  ShellAPI,
  Registry,
  Messages,
  Menus,
  Graphics,
  Gauges,
  Forms,
  FileCtrl,
  ExtCtrls,
  Dialogs,
  DeleteU,
  Controls,
  ComCtrls,
  Classes,
  Buttons,
  ActiveX;

type
  TStringArray = array of String;
  TType        = (ttAbort, ttDelete, ttDone, ttEmpty, ttError, ttStart, ttStop, ttWarning);

  TShoreiEasyDeleterMainForm = class(TForm)
    ActivateFileListPageCheckBox       : TCheckBox;
    ActivateProtocollCheckBox          : TCheckBox;
    AddFileBitBtn                      : TBitBtn;
    AddFileListBevel                   : TBevel;
    AddFileListButton                  : TButton;
    AddFileListEdit                    : TEdit;
    AddFolderBitBtn                    : TBitBtn;
    ButtonsBevel                       : TBevel;
    CancelBitBtn                       : TBitBtn;
    ClearFileListButton                : TButton;
    CloseAlwaysCheckBox                : TCheckBox;
    CloseOptionsBevel                  : TBevel;
    CloseWhenSendToUsedCheckBox        : TCheckBox;
    CoderLabel                         : TLabel;
    CreateSendToLinkButton             : TButton;
    CreateSendToLinkLabel              : TLabel;
    DeleteFileListIndexButton          : TButton;
    DeleteSendToLinkButton             : TButton;
    DoneLabel                          : TLabel;
    FileCountBevel                     : TBevel;
    FileCountLabel                     : TLabel;
    FileInfoLabel                      : TLabel;
    FileListErrorsBevel                : TBevel;
    FileListListBox                    : TListBox;
    FileListPanel                      : TPanel;
    FileListPopupMenu                  : TPopupMenu;
    FileListTabSheet                   : TTabSheet;
    FileNameLabel                      : TLabel;
    FileOpenDialog                     : TOpenDialog;
    FileProgressGauge                  : TGauge;
    FunctionalityTabSheet              : TTabSheet;
    GoneTimeLabel                      : TLabel;
    HighPostRandomRoundsLabel          : TLabel;
    HighPostRandomRoundsSpinEdit       : TSpinEdit;
    HighPreRandomRoundsLabel           : TLabel;
    HighPreRandomRoundsSpinEdit        : TSpinEdit;
    HighSecurityInfoLabel              : TLabel;
    HighSecurityLabel                  : TLabel;
    HighSecurityTabSheet               : TTabSheet;
    InfoBevel                          : TBevel;
    InfoPartALabel                     : TLabel;
    InfoPartBLabel                     : TLabel;
    InfoPartCLabel                     : TLabel;
    InfoPartDLabel                     : TLabel;
    InfoPartELabel                     : TLabel;
    InfoPartFLabel                     : TLabel;
    InfoTabSheet                       : TTabSheet;
    InfoTextBevel                      : TBevel;
    LicenseBevel                       : TBevel;
    LicenseButton                      : TButton;
    LongerFileNamesBevel               : TBevel;
    LowDefinedRoundsLabel              : TLabel;
    LowDefinedRoundsSpinEdit           : TSpinEdit;
    LowPostRandomRoundsLabel           : TLabel;
    LowPostRandomRoundsSpinEdit        : TSpinEdit;
    LowPreRandomRoundsLabel            : TLabel;
    LowPreRandomRoundsSpinEdit         : TSpinEdit;
    LowSecurityInfoLabel               : TLabel;
    LowSecurityLabel                   : TLabel;
    LowSecurityTabSheet                : TTabSheet;
    MainBevel                          : TBevel;
    MainPageControl                    : TPageControl;
    MainTabSheet                       : TTabSheet;
    MiddleDefinedRoundsLabel           : TLabel;
    MiddleDefinedRoundsSpinEdit        : TSpinEdit;
    MiddlePostRandomRoundsLabel        : TLabel;
    MiddlePostRandomRoundsSpinEdit     : TSpinEdit;
    MiddlePreRandomRoundsLabel         : TLabel;
    MiddlePreRandomRoundsSpinEdit      : TSpinEdit;
    MiddleSecurityInfoLabel            : TLabel;
    MiddleSecurityLabel                : TLabel;
    MiddleSecurityTabSheet             : TTabSheet;
    OptionsBevel                       : TBevel;
    OptionsPageControl                 : TPageControl;
    OptionsTabSheet                    : TTabSheet;
    ProcessProgressGauge               : TGauge;
    ProducerLabel                      : TLabel;
    ProgNameBevel                      : TBevel;
    ProgNameImage                      : TImage;
    ProtocollBevel                     : TBevel;
    ProtocollLabel                     : TLabel;
    ProtocollListBox                   : TListBox;
    ProtocollSaveDialog                : TSaveDialog;
    RaidenImage                        : TImage;
    RenameFilesCheckBox                : TCheckBox;
    SaveBitBtn                         : TBitBtn;
    SecurityLevelLabel                 : TLabel;
    SecurityPageControl                : TPageControl;
    SecuritySpinButton                 : TSpinButton;
    SecurityTrackBar                   : TTrackBar;
    ShiKaiImage                        : TImage;
    ShowFileProgressBevel              : TBevel;
    ShowFileProgressCheckBox           : TCheckBox;
    ShowWarningsCheckBox               : TCheckBox;
    ShowWarningsFormCheckBox           : TCheckBox;
    StartBitBtn                        : TBitBtn;
    UsageTabSheet                      : TTabSheet;
    UseLongFileNamesCheckBox           : TCheckBox;
    VersionLabel                       : TLabel;

    procedure AddFileBitBtnClick(Sender : TObject);
    procedure AddFileListButtonClick(Sender : TObject);
    procedure AddFolderBitBtnClick(Sender : TObject);
    procedure CancelBitBtnClick(Sender : TObject);
    procedure ClearFileListButtonClick(Sender : TObject);
    procedure CloseWhenSendToUsedCheckBoxClick(Sender : TObject);
    procedure CreateSendToLinkButtonClick(Sender : TObject);
    procedure DeleteFileListIndexButtonClick(Sender : TObject);
    procedure DeleteSendToLinkButtonClick(Sender : TObject);
    procedure FileListListBoxKeyDown(Sender : TObject; var Key : Word; Shift : TShiftState);
    procedure FileListPopupMenuPopup(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormCloseQuery(Sender : TObject; var CanClose : Boolean);
    procedure FormCreate(Sender : TObject);
    procedure FormShow(Sender : TObject);
    procedure HighPostRandomRoundsSpinEditChange(Sender : TObject);
    procedure HighPreRandomRoundsSpinEditChange(Sender : TObject);
    procedure HighSecurityInfoLabelMouseDown(Sender : TObject; Button : TMouseButton; Shift : TShiftState; X : Integer; Y : Integer);
    procedure LicenseButtonClick(Sender : TObject);
    procedure LowDefinedRoundsSpinEditChange(Sender : TObject);
    procedure LowPostRandomRoundsSpinEditChange(Sender : TObject);
    procedure LowPreRandomRoundsSpinEditChange(Sender : TObject);
    procedure LowSecurityInfoLabelMouseDown(Sender : TObject; Button : TMouseButton; Shift : TShiftState; X : Integer; Y : Integer);
    procedure MiddleDefinedRoundsSpinEditChange(Sender : TObject);
    procedure MiddlePostRandomRoundsSpinEditChange(Sender : TObject);
    procedure MiddlePreRandomRoundsSpinEditChange(Sender : TObject);
    procedure MiddleSecurityInfoLabelMouseDown(Sender : TObject; Button : TMouseButton; Shift : TShiftState; X : Integer; Y : Integer);
    procedure ProtocollListBoxDrawItem(Control : TWinControl; Index : Integer; Rect : TRect; State : TOwnerDrawState);
    procedure SaveBitBtnClick(Sender : TObject);
    procedure SecuritySpinButtonDownClick(Sender : TObject);
    procedure SecuritySpinButtonUpClick(Sender : TObject);
    procedure SecurityTrackBarChange(Sender : TObject);
    procedure ShowFileProgressCheckBoxClick(Sender : TObject);
    procedure ShowWarningsCheckBoxClick(Sender : TObject);
    procedure StartBitBtnClick(Sender : TObject);
  private
    { Private-Deklarationen }
    FCanceled        : Boolean;
    FClosed          : Boolean;
    FLatestTime      : LongInt;
    FStarted         : Boolean;
    FStartTime       : LongInt;
    FStopped         : Boolean;
    FTempFolderNames : TStringArray;

    function AddEntryToFileList(const AEntryName : String) : Boolean;
    function CheckBackSlash(const AFolderName : String) : String;
    function CreateLink(const AFileName : String; const ALinkFileName : String; const ALinkDescription : String; const ATryToReleaseInstances : Boolean) : Boolean;
    function DeleteLink(const ALinkFileName : String) : Boolean;
    function FindAll(var AStringArray : TStringArray; const AStartIndex : Integer; AFolderName : String; const AFileName : String; const ARecursive : Boolean; const AAddDirectories : Boolean) : Integer;
    function GetFileName(const AFolderName : String; const AFileExtension : String) : String;
    function GetFolderLevel(AFolderName : String) : Integer;
    function GetPreviousFolder(const AFolderName : String) : String;

    procedure AddProtocollLine(const AText : String; const AType : TType);
    procedure CleanFileListPopupMenu;
    procedure DeleteFilesFromFileList(const AFileName : String; const AAskForFolderDeletion : Boolean);
    procedure DrawFileListHorizontalScrollBar;
    procedure DrawProtocollHorizontalScrollBar;
    procedure DropFiles(var AMessage : TMessage); message wm_DropFiles;
    procedure LoadOptions;
    procedure PopupMenuItemClick(Sender : TObject);
    procedure ProgressEvent(const AFileName : String; const AProgressPercentage : TProgressPercentage; var ACancelProcess : Boolean);
    procedure RegisterApplication;
    procedure SaveOptions;
    procedure UpdateFileData;
  public
    { Public-Deklarationen }
    FLicenseAgreed : Boolean;
    FRegistered    : Boolean;

    function CanWriteOnDrive(const AFileName : String) : Boolean;
    function FileInUse(const AFileName : String) : Boolean;
    function SetAttributes(const AFileName : String; const AAttributes : Cardinal; const AUseLongFileName : Boolean) : Boolean;

    procedure SetCaption(const ACaption : String);
  end;

var
  ShoreiEasyDeleterMainForm : TShoreiEasyDeleterMainForm;

implementation

uses
  LicenseF,
  FilesF;

const
  CApplicationRegistrationRegistryKey       = 'Software\Microsoft\Windows\CurrentVersion\App Paths\';
  CApplicationRegistrationRegistryPathValue = 'Path';
  CDeletedFileExtension                     = '.del';
  CDeletingText                             = 'wird gelöscht';
  CDriveDelimiter                           = ':\';
  CEditTagCode                              = 100;
  CFileExtDelimiter                         = '.';
  CFolderDelimiter                          = '\';
  CHourLength                               = 60;
  CMemoTagCode                              = 200;
  CMinuteLength                             = 60;
  COptionsFileExt                           = '.edo';
  CSecondLength                             = 1000;
  CSendToLinkFileDescription                = 'Sicheres und Schnelles Entfernen von Dateien und Ordnern';
  CSendToLinkFileName                       = 'Shorei EasyDeleter.lnk';
  CSendToRegistryKey                        = 'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\';
  CSendToRegistryValue                      = 'SendTo';
  CShoreiEasyDeleterText                    = '| Shorei | EasyDeleter';

{$R *.dfm}

procedure TShoreiEasyDeleterMainForm.AddFileBitBtnClick(Sender : TObject);
begin
  if FileOpenDialog.Execute then
    AddFileListEdit.Text := FileOpenDialog.FileName
  else
    AddFileListEdit.Text := '';
end;

procedure TShoreiEasyDeleterMainForm.AddFileListButtonClick(Sender : TObject);
begin
  InfoTabSheet.Enabled    := false;
  MainPageControl.Enabled := false;
  MainTabSheet.Enabled    := false;
  OptionsTabSheet.Enabled := false;

  if not(AddEntryToFileList(AddFileListEdit.Text)) then
  begin
    if ShowWarningsCheckBox.Checked then
    begin
      if ShowWarningsFormCheckBox.Checked then
        FileNamesForm.ShowFileName(AddFileListEdit.Text)
      else
      begin
        if DirectoryExists(AddFileListEdit.Text) then
          MessageDlg('Der ausgewählte Ordner ist bereits in der Datei-Liste vorhanden!', mtWarning, [mbOK], 0)
        else
          MessageDlg('Die ausgewählte Datei ist bereits in der Datei-Liste vorhanden!', mtWarning, [mbOK], 0);
      end;
    end;
  end;

  AddFileListEdit.Text := '';

  InfoTabSheet.Enabled    := true;
  MainPageControl.Enabled := true;
  MainTabSheet.Enabled    := true;
  OptionsTabSheet.Enabled := true;
end;

procedure TShoreiEasyDeleterMainForm.AddFolderBitBtnClick(Sender : TObject);
var
  FolderName : String;
begin
  if SelectDirectory('Ordner auswählen', '', FolderName) then
    AddFileListEdit.Text := CheckBackSlash(FolderName)
  else
    AddFileListEdit.Text := '';
end;

procedure TShoreiEasyDeleterMainForm.CancelBitBtnClick(Sender : TObject);
begin
  if FStarted then
    FStopped := true;
end;

procedure TShoreiEasyDeleterMainForm.ClearFileListButtonClick(Sender : TObject);
begin
  FileListListBox.Items.Clear;
  DrawFileListHorizontalScrollBar;
  UpdateFileData;
end;

procedure TShoreiEasyDeleterMainForm.CloseWhenSendToUsedCheckBoxClick(Sender : TObject);
begin
  CloseAlwaysCheckBox.Enabled := CloseWhenSendToUsedCheckBox.Checked;
end;

procedure TShoreiEasyDeleterMainForm.CreateSendToLinkButtonClick(Sender : TObject);
var
  Found    : Boolean;
  LinkPath : String;
  Registry : TRegistry;
begin
  Registry := TRegistry.Create;
  try
    Registry.RootKey := hKey_Current_User;

    Found := false;
    if Registry.KeyExists(CSendToRegistryKey) then
    begin
      if Registry.OpenKey(CSendToRegistryKey, false) then
      begin
        if Registry.ValueExists(CSendToRegistryValue) then
        begin
          LinkPath := Registry.ReadString(CSendToRegistryValue);

          Found := DirectoryExists(LinkPath);
        end;
      end;
    end;
  finally
    Registry.Free;
    Registry := nil;
  end;

  if Found then
  begin
    if CreateLink(Application.ExeName, CheckBackSlash(LinkPath) + CSendToLinkFileName, CSendToLinkFileDescription, false) then
      MessageDlg('Der Eintrag konnte erfolgreich erzeugt werden!', mtInformation, [mbOK], 0)
    else
      MessageDlg('Fehler, der Eintrag konnte nicht erzeugt werden!', mtError, [mbOK], 0);
  end
  else
    MessageDlg('Fehler, Eintragsoptionen konnten nicht gelesen werden!', mtError, [mbOK], 0);
end;

procedure TShoreiEasyDeleterMainForm.DeleteFileListIndexButtonClick(Sender : TObject);
var
  Index : LongInt;
begin
  if (FileListListBox.ItemIndex >= 0) then
  begin
    for Index := Pred(FileListListBox.Items.Count) downto 0 do
    begin
      if (Index <= Pred(FileListListBox.Items.Count)) then
      begin
        if FileListListBox.Selected[Index] then
          DeleteFilesFromFileList(FileListListBox.Items[Index], true)
      end;
    end;
  end
  else
  begin
    if (FileListListBox.Items.Count > 0) then
      MessageDlg('Sie müssen vorher einen Datei-Listen - Eintrag durch anklicken auswählen!', mtWarning, [mbOK], 0)
    else
      MessageDlg('Sie müssen vorher eine Datei oder einen Ordner zur Datei-Liste hinzufügen und durch anklicken auswählen!', mtWarning, [mbOK], 0);
  end;
end;

procedure TShoreiEasyDeleterMainForm.DeleteSendToLinkButtonClick(Sender : TObject);
var
  Found    : Boolean;
  LinkPath : String;
  Registry : TRegistry;
begin
  Registry := TRegistry.Create;
  try
    Registry.RootKey := hKey_Current_User;

    Found := false;
    if Registry.KeyExists(CSendToRegistryKey) then
    begin
      if Registry.OpenKey(CSendToRegistryKey, false) then
      begin
        if Registry.ValueExists(CSendToRegistryValue) then
        begin
          LinkPath := Registry.ReadString(CSendToRegistryValue);

          Found := DirectoryExists(LinkPath);
        end;
      end;
    end;
  finally
    Registry.Free;
    Registry := nil;
  end;

  if Found then
  begin
    if FileExists(CheckBackSlash(LinkPath) + CSendToLinkFileName) then
    begin
      if DeleteLink(CheckBackSlash(LinkPath) + CSendToLinkFileName) then
        MessageDlg('Der Eintrag konnte erfolgreich gelöscht werden!', mtInformation, [mbOK], 0)
      else
        MessageDlg('Fehler, der Eintrag konnte nicht gelöscht werden!', mtError, [mbOK], 0);
    end
    else
      MessageDlg('Der Eintrag ist nicht vorhanden!', mtInformation, [mbOK], 0);
  end
  else
    MessageDlg('Fehler, Eintragsoptionen konnten nicht gelesen werden!', mtError, [mbOK], 0);
end;

procedure TShoreiEasyDeleterMainForm.FileListListBoxKeyDown(Sender : TObject; var Key : Word; Shift : TShiftState);
var
  Index : LongInt;
begin
  if (Key = vk_Delete) then
  begin
    if (FileListListBox.ItemIndex >= 0) then
    begin
      for Index := Pred(FileListListBox.Items.Count) downto 0 do
      begin
        if (Index <= Pred(FileListListBox.Items.Count)) then
        begin
          if FileListListBox.Selected[Index] then
            DeleteFilesFromFileList(FileListListBox.Items[Index], true)
        end;
      end;
    end;

    Key := 0;
  end;
end;

procedure TShoreiEasyDeleterMainForm.FileListPopupMenuPopup(Sender : TObject);
var
  FileName     : String;
  FolderLevels : TStringArray;
  Index        : Integer;
  MenuItem     : TMenuItem;
begin
  CleanFileListPopupMenu;

  if (FileListListBox.ItemIndex >= 0) then
  begin
    FileName := FileListListBox.Items[FileListListBox.ItemIndex];

    SetLength(FolderLevels, GetFolderLevel(ExtractFilePath(FileName)));
    SetLength(FTempFolderNames, Length(FolderLevels));

    FolderLevels[0] := CheckBackSlash(ExtractFilePath(FileName));
    FTempFolderNames[0] := FolderLevels[0];

    MenuItem         := TMenuItem.Create(Self);
    MenuItem.Caption := '"' + FolderLevels[0] + '" komplett aus Datei-List entfernen';
    MenuItem.Name    := 'PopupMenuItem0';
    MenuItem.OnClick := PopupMenuItemClick;
    FileListPopupMenu.Items.Add(MenuItem);

    for Index := 1 to High(FolderLevels) do
    begin
      FolderLevels[Index] := CheckBackSlash(GetPreviousFolder(FolderLevels[Pred(Index)]));
      FTempFolderNames[Index] := FolderLevels[Index];

      MenuItem         := TMenuItem.Create(Self);
      MenuItem.Caption := '"' + FolderLevels[Index] + '" komplett aus Datei-List entfernen';
      MenuItem.Name    := 'PopupMenuItem' + IntToStr(Index);
      MenuItem.OnClick := PopupMenuItemClick;
      FileListPopupMenu.Items.Add(MenuItem);
    end;
  end;
end;

procedure TShoreiEasyDeleterMainForm.FormClose(Sender : TObject; var Action : TCloseAction);
begin
  DragAcceptFiles(Handle, false);

  SaveOptions;

  CleanFileListPopupMenu;
end;

procedure TShoreiEasyDeleterMainForm.FormCloseQuery(Sender : TObject; var CanClose : Boolean);
begin
  CanClose := not(FStarted);
  FClosed := true;

  if FStarted then
    FStopped := true;
end;

procedure TShoreiEasyDeleterMainForm.FormCreate(Sender : TObject);
var
  DirectoryContents : TStringArray;
  FileCount         : Integer;
  Index             : Integer;
begin
  DoubleBuffered := true;

  FCanceled := false;
  FClosed   := false;
  FStarted  := false;
  FStopped  := false;

  RegisterApplication;

  LoadOptions;
  SaveOptions;

  CancelBitBtn.Visible                := false;
  CloseAlwaysCheckBox.Enabled         := CloseWhenSendToUsedCheckBox.Checked;
  DoneLabel.Caption                   := '';
  FileNameLabel.Caption               := '';
  GoneTimeLabel.Caption               := '';
  MainPageControl.ActivePage          := InfoTabSheet;
  SaveBitBtn.Enabled                  := (ProtocollListBox.Items.Count > 0);
  SecurityPageControl.ActivePageIndex := SecurityTrackBar.Position;
  ShowWarningsFormCheckBox.Enabled    := ShowWarningsCheckBox.Checked;
  UseLongFileNamesCheckBox.Caption    := 'Dateipfade mit mehr als ' + IntToStr(Max_Path) + ' &Zeichen Länge zulassen';

  if (ParamCount > 0) then
  begin
    if ActivateFileListPageCheckBox.Checked then
      MainPageControl.ActivePage := FileListTabSheet
    else
      MainPageControl.ActivePage := MainTabSheet;

    for Index := 1 to ParamCount do
    begin
      if DirectoryExists(AnsiLowerCase(CheckBackSlash(ParamStr(Index)))) then
      begin
        FindAll(DirectoryContents, 0, AnsiLowerCase(CheckBackSlash(ParamStr(Index))), '*.*', true, true);

        for FileCount := 0 to High(DirectoryContents) do
          FileListListBox.Items.Add(AnsiLowerCase(DirectoryContents[FileCount]));
        FileListListBox.Items.Add(AnsiLowerCase(CheckBackSlash(ParamStr(Index))));
      end
      else
      begin
        if FileExists(AnsiLowerCase(ParamStr(Index))) then
          FileListListBox.Items.Add(AnsiLowerCase(ParamStr(Index)));
      end;
    end;
  end;

  CleanFileListPopupMenu;
  DrawFileListHorizontalScrollBar;
  DrawProtocollHorizontalScrollBar;
  UpdateFileData;

  SetCaption(CShoreiEasyDeleterText);

  Left := (Screen.Width - Width) div 3;
  Top  := (Screen.Height - Height) div 3;

  DragAcceptFiles(Handle, true);
end;

procedure TShoreiEasyDeleterMainForm.FormShow(Sender : TObject);
begin
  if not(FLicenseAgreed) then
  begin
    LicenseForm.ShowModal;

    if not(FLicenseAgreed) then
    begin
      MessageDlg('Da die Lizenzvereinbarung von Ihnen nicht akzeptiert wurde, darf diese Software von Ihnen auch nicht benutzt werden!' +
                 #13#10 +
                 #13#10 +
                 'Das Programm wird jetzt automatisch beendet!',
                 mtInformation, [mbOK], 0);

      Close;
    end;
  end;
end;

procedure TShoreiEasyDeleterMainForm.HighPreRandomRoundsSpinEditChange(Sender : TObject);
begin
  if (HighPreRandomRoundsSpinEdit.Value < 0) then
    HighPreRandomRoundsSpinEdit.Value := 0;
end;

procedure TShoreiEasyDeleterMainForm.HighPostRandomRoundsSpinEditChange(Sender : TObject);
begin
  if (HighPostRandomRoundsSpinEdit.Value < 0) then
    HighPostRandomRoundsSpinEdit.Value := 0;
end;

procedure TShoreiEasyDeleterMainForm.HighSecurityInfoLabelMouseDown(Sender : TObject; Button : TMouseButton; Shift : TShiftState; X : Integer; Y : Integer);
begin
  MessageDlg('Method after:' + #013#010 +
             #013#010 +
             '"' + #013#010 +
             'Peter Gutmann' + #013#010 +
             #013#010 +
             'Department of Computer Science' + #013#010 +
             'University of Auckland' + #013#010 +
             '- USA -' + #013#010 +
             '"' + #013#010 +
             #013#010 +
             'in' + #013#010 +
             #013#010 +
             '"' + #013#010 +
             'Secure Deletion of Data from' + #013#010 +
             'Magnetic and Solid-State Memory' + #013#010 +
             '"' + #013#010 +
             #013#010 +
             'published in' + #013#010 +
             #013#010 +
             '"' + #013#010 +
             'the Sixth USENIX Security' + #013#010 +
             'Symposium Proceedings,' + #013#010 +
             'San Jose,' + #013#010 +
             'California,' + #013#010 +
             'July 22-25, 1996' + #013#010 +
             '"' + #013#010,
             mtInformation, [mbOK], 0);
end;

procedure TShoreiEasyDeleterMainForm.LicenseButtonClick(Sender : TObject);
begin
  LicenseForm.ShowModal;

  if not(FLicenseAgreed) then
  begin
    MessageDlg('Da die Lizenzvereinbarung von Ihnen nicht akzeptiert wurde, darf diese Software von Ihnen auch nicht benutzt werden!' +
               #13#10 +
               #13#10 +
               'Das Programm wird jetzt automatisch beendet!',
               mtInformation, [mbOK], 0);

    Close;
  end;
end;

procedure TShoreiEasyDeleterMainForm.LowDefinedRoundsSpinEditChange(Sender : TObject);
begin
  if (LowDefinedRoundsSpinEdit.Value < 0) then
    LowDefinedRoundsSpinEdit.Value := 0;
end;

procedure TShoreiEasyDeleterMainForm.LowPostRandomRoundsSpinEditChange(Sender : TObject);
begin
  if (LowPostRandomRoundsSpinEdit.Value < 0) then
    LowPostRandomRoundsSpinEdit.Value := 0;
end;

procedure TShoreiEasyDeleterMainForm.LowPreRandomRoundsSpinEditChange(Sender : TObject);
begin
  if (LowPreRandomRoundsSpinEdit.Value < 0) then
    LowPreRandomRoundsSpinEdit.Value := 0;
end;

procedure TShoreiEasyDeleterMainForm.LowSecurityInfoLabelMouseDown(Sender : TObject; Button : TMouseButton; Shift : TShiftState; X : Integer; Y : Integer);
begin
  MessageDlg('Method after:' + #013#010 +
             #013#010 +
             '"' + #013#010 +
             'Bundesamt für Sicherheit in der Informationstechnik (BSI)' + #013#010 +
             '(Federal Office for Information Security)' + #013#010 +
             '- Germany -' + #013#010 +
             '"' + #013#010 +
             #013#010 +
             'in' + #013#010 +
             #013#010 +
             '"' + #013#010 +
             'Secure deletion of data media' + #013#010 +
             '"' + #013#010 +
             #013#010 +
             'published in' + #013#010 +
             #013#010 +
             '"' + #013#010 +
             'IT Baseline Protection Manual' + #013#010 +
             '"' + #013#010,
             mtInformation, [mbOK], 0);
end;

procedure TShoreiEasyDeleterMainForm.MiddleDefinedRoundsSpinEditChange(Sender : TObject);
begin
  if (MiddleDefinedRoundsSpinEdit.Value < 0) then
    MiddleDefinedRoundsSpinEdit.Value := 0;
end;

procedure TShoreiEasyDeleterMainForm.MiddlePostRandomRoundsSpinEditChange(Sender : TObject);
begin
  if (MiddlePostRandomRoundsSpinEdit.Value < 0) then
    MiddlePostRandomRoundsSpinEdit.Value := 0;
end;

procedure TShoreiEasyDeleterMainForm.MiddlePreRandomRoundsSpinEditChange(Sender : TObject);
begin
  if (MiddlePreRandomRoundsSpinEdit.Value < 0) then
    MIddlePreRandomRoundsSpinEdit.Value := 0;
end;

procedure TShoreiEasyDeleterMainForm.MiddleSecurityInfoLabelMouseDown(Sender : TObject; Button : TMouseButton; Shift : TShiftState; X : Integer; Y : Integer);
begin
  MessageDlg('Method after:' + #013#010 +
             #013#010 +
             '"' + #013#010 +
             'United States Department of Defense' + #013#010 +
             '- USA -' + #013#010 +
             '"' + #013#010 +
             #013#010 +
             'in' + #013#010 +
             #013#010 +
             '"' + #013#010 +
             'Chapter 8. Automated Information System Security' + #013#010 +
             'Section 3. Controls and Maintenance' + #013#010 +
             '8-306. Maintenance (Clearing and Sanitization Matrix)' + #013#010 +
             '"' + #013#010 +
             #013#010 +
             'published in' + #013#010 +
             #013#010 +
             '"' + #013#010 +
             'National Industrial Security Program Operating Manual (NISPOM)' + #013#010 +
             '[US DoD 5220.22-M] (January 1995)' + #013#010 +
             '"' + #013#010,
             mtInformation, [mbOK], 0);
end;

procedure TShoreiEasyDeleterMainForm.ProtocollListBoxDrawItem(Control : TWinControl; Index : Integer; Rect : TRect; State : TOwnerDrawState);
var
  ErrorCode : Integer;
  Image     : TBitmap;
  Picture   : Integer;
begin
  Val(ProtocollListBox.Items[Index][1], Picture, ErrorCode);

  with ProtocollListBox.Canvas do
  begin
    FillRect(Rect);

    if (ErrorCode = 0) then
    begin
      Picture := Picture + 100;

      Image := TBitmap.Create;
      try
        if (Picture >= 100) and (Picture <= 107) then
        begin
          Image.LoadFromResourceID(hInstance, Picture);

          if Image <> nil then
            BrushCopy(Bounds(Rect.Left + 6, Round(Rect.Top + ((ProtocollListBox.ItemHeight - Image.Height) / 2)), Image.Width, Image.Height), Image, Bounds(0, 0, Image.Width, Image.Height), clNone);
        end;

        TextOut(Rect.Left + (Image.Width + 12), Round(Rect.Top + ((ProtocollListBox.ItemHeight - Canvas.TextHeight(ProtocollListBox.Items[Index])) / 5)), Copy(ProtocollListBox.Items[Index], 2, Pred((Length(ProtocollListBox.Items[Index])))));
      finally
        Image.Free;
        Image := nil;
      end;
    end
    else
      TextOut(Rect.Left + 24, Round(Rect.Top + ((ProtocollListBox.ItemHeight - Canvas.TextHeight(ProtocollListBox.Items[Index])) / 5)), ProtocollListBox.Items[Index]);
  end;
end;

procedure TShoreiEasyDeleterMainForm.SaveBitBtnClick(Sender : TObject);
begin
  if ProtocollSaveDialog.Execute then
  begin
    if (ProtocollSaveDialog.FilterIndex = 1) then
    begin
      if (AnsiLowerCase(ExtractFileExt(ProtocollSaveDialog.FileName)) <> '.log') then
        ProtocollListBox.Items.SaveToFile(ProtocollSaveDialog.FileName + '.log')
      else
        ProtocollListBox.Items.SaveToFile(ProtocollSaveDialog.FileName);
    end
    else
    begin
      if (ProtocollSaveDialog.FilterIndex = 2) then
      begin
        if (AnsiLowerCase(ExtractFileExt(ProtocollSaveDialog.FileName)) <> '.txt') then
          ProtocollListBox.Items.SaveToFile(ProtocollSaveDialog.FileName + '.txt')
        else
          ProtocollListBox.Items.SaveToFile(ProtocollSaveDialog.FileName);
      end
      else
        ProtocollListBox.Items.SaveToFile(ProtocollSaveDialog.FileName);
    end;
  end;
end;

procedure TShoreiEasyDeleterMainForm.SecuritySpinButtonDownClick(Sender: TObject);
begin
  if (SecurityTrackBar.Position < SecurityTrackBar.Max) then
    SecurityTrackBar.Position := Succ(SecurityTrackBar.Position);
end;

procedure TShoreiEasyDeleterMainForm.SecuritySpinButtonUpClick(Sender: TObject);
begin
  if (SecurityTrackBar.Position > SecurityTrackBar.Min) then
    SecurityTrackBar.Position := Pred(SecurityTrackBar.Position);
end;

procedure TShoreiEasyDeleterMainForm.SecurityTrackBarChange(Sender : TObject);
begin
  SecurityPageControl.ActivePageIndex := SecurityTrackBar.Position;
end;

procedure TShoreiEasyDeleterMainForm.ShowFileProgressCheckBoxClick(Sender : TObject);
begin
  if not(ShowFileProgressCheckBox.Checked) then
  begin
    FileProgressGauge.Progress := 0;
    SetCaption(CShoreiEasyDeleterText);
  end;
end;

procedure TShoreiEasyDeleterMainForm.ShowWarningsCheckBoxClick(Sender : TObject);
begin
  ShowWarningsFormCheckBox.Enabled := ShowWarningsCheckBox.Checked;
end;

procedure TShoreiEasyDeleterMainForm.StartBitBtnClick(Sender : TObject);
var
  Count                  : Integer;
  Done                   : Boolean;
  FileName               : WideString;
  Index                  : Integer;
  HighPostRandomRounds   : Integer;
  HighPreRandomRounds    : Integer;
  LowDefinedRounds       : Integer;
  LowPostRandomRounds    : Integer;
  LowPreRandomRounds     : Integer;
  MiddleDefinedRounds    : Integer;
  MiddlePostRandomRounds : Integer;
  MiddlePreRandomRounds  : Integer;
  NewFileName            : String;
  SecurityLevel          : Byte;
  UseLongFileNames       : Boolean;
begin
  if (MessageDlg('Sind sie sicher, dass sie die ' + IntToStr(FileListListBox.Items.Count) + ' Dateien, die in der Datei-Liste angegeben sind, löschen wollen?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    DragAcceptFiles(Handle, false);

    FCanceled := false;
    FStarted  := true;
    FStopped  := false;

    FStartTime := LongInt(GetTickCount);

    ProtocollListBox.Items.Clear;
    DrawProtocollHorizontalScrollBar;

    AddProtocollLine('...Vorgang gestartet...', ttStart);

    SecurityLevel := SecurityTrackBar.Position;
    case SecurityLevel of
      0 :
      begin
        AddProtocollLine('Sicherheitslevel: HOCH', ttEmpty);

        AddProtocollLine('Anzahl der zufälligen Vor-Durchgänge: ' + IntToStr(HighPreRandomRoundsSpinEdit.Value), ttEmpty);
        AddProtocollLine('Anzahl der zufälligen Nach-Durchgänge: ' + IntToStr(HighPostRandomRoundsSpinEdit.Value), ttEmpty);
      end;

      1 :
      begin
        AddProtocollLine('Sicherheitslevel: MITTEL', ttEmpty);

        AddProtocollLine('Anzahl der zufälligen Vor-Durchgänge: ' + IntToStr(MiddlePreRandomRoundsSpinEdit.Value), ttEmpty);
        AddProtocollLine('Anzahl der zufälligen Nach-Durchgänge: ' + IntToStr(MiddlePostRandomRoundsSpinEdit.Value), ttEmpty);
        AddProtocollLine('Anzahl der definierten Durchgänge: ' + IntToStr(MiddleDefinedRoundsSpinEdit.Value), ttEmpty);
      end;

      2 :
      begin
        AddProtocollLine('Sicherheitslevel: NIEDRIG', ttEmpty);

        AddProtocollLine('Anzahl der zufälligen Vor-Durchgänge: ' + IntToStr(LowPreRandomRoundsSpinEdit.Value), ttEmpty);
        AddProtocollLine('Anzahl der zufälligen Nach-Durchgänge: ' + IntToStr(LowPostRandomRoundsSpinEdit.Value), ttEmpty);
        AddProtocollLine('Anzahl der definierten Durchgänge: ' + IntToStr(LowDefinedRoundsSpinEdit.Value), ttEmpty);
      end;
    end;

    HighPostRandomRounds   := HighPostRandomRoundsSpinEdit.Value;
    HighPreRandomRounds    := HighPreRandomRoundsSpinEdit.Value;
    LowDefinedRounds       := LowDefinedRoundsSpinEdit.Value;
    LowPostRandomRounds    := LowPostRandomRoundsSpinEdit.Value;
    LowPreRandomRounds     := LowPreRandomRoundsSpinEdit.Value;
    MiddleDefinedRounds    := MiddleDefinedRoundsSpinEdit.Value;
    MiddlePostRandomRounds := MiddlePostRandomRoundsSpinEdit.Value;
    MiddlePreRandomRounds  := MiddlePreRandomRoundsSpinEdit.Value;
    UseLongFileNames       := UseLongFileNamesCheckBox.Checked;

    CancelBitBtn.Visible          := true;
    DoneLabel.Caption             := '0 (0) Dateien und Ordner von ' + IntToStr(FileListListBox.Items.Count) + ' abgearbeitet';
    FileInfoLabel.Visible         := false;
    FileListTabSheet.Enabled      := false;
    FileNameLabel.Caption         := '';
    FileProgressGauge.Progress    := 0;
    GoneTimeLabel.Caption         := '';
    InfoTabSheet.Enabled          := false;
    OptionsTabSheet.Enabled       := false;
    ProcessProgressGauge.MinValue := 0;
    ProcessProgressGauge.MaxValue := FileListListBox.Items.Count;
    ProcessProgressGauge.Progress := 0;
    SaveBitBtn.Enabled            := false;
    StartBitBtn.Visible           := false;

    Count := 0;
    Index := 0;
    while not(Index = FileListListBox.Items.Count) do
    begin
      if not(FCanceled) then
      begin
        Done := false;
        FileName := FileListListBox.Items[Index];

        AddProtocollLine('LÖSCHE: "' + FileName + '"', ttDelete);

        FileNameLabel.Caption := FileName;
        if (FileNameLabel.Width > FileProgressGauge.Width) then
        begin
          while (FileNameLabel.Width > FileProgressGauge.Width) do
            FileNameLabel.Caption := Copy(FileNameLabel.Caption, 4, Length(FileNameLabel.Caption) - 3);
          FileNameLabel.Caption := '...' + Copy(FileNameLabel.Caption, 4, Length(FileNameLabel.Caption) - 3);
        end;

        Application.ProcessMessages;

        if not(DirectoryExists(FileName)) then
        begin
          if (SetAttributes(FileName, File_Attribute_Normal, UseLongFileNames) and
              not(FileInUse(FileName))) then
          begin
            if RenameFilesCheckBox.Checked then
            begin
              NewFileName := GetFileName(ExtractFilePath(FileName), CDeletedFileExtension);
              if ((FileName[Length(FileName)] = #44) and
                  (FileName[Pred(Length(FileName))] = #44) and
                  CNoDeleteOnDoubleComma) then
                NewFileName := NewFileName + #44#44;

              AddProtocollLine('BENENNE UM:"' + FileName + '"', ttDelete);
              if RenameFile(FileName, NewFileName) then
                AddProtocollLine('UMBENANNT: "' + FileName + '"', ttDone)
              else
              begin
                NewFileName := FileName;

                AddProtocollLine('NICHT UMBENANNT: "' + FileName + '"', ttError);
              end;
            end
            else
              NewFileName := FileName;

            case SecurityLevel of
              0 : Done := DeleteFile_DoCSUoA(NewFileName, HighPreRandomRounds, HighPostRandomRounds, NewFileName, nil, ProgressEvent);
              1 : Done := DeleteFile_USDoD(NewFileName, MiddlePreRandomRounds, MiddlePostRandomRounds, MiddleDefinedRounds, NewFileName, nil, ProgressEvent);
              2 : Done := DeleteFile_BSI(NewFileName, LowPreRandomRounds, LowPostRandomRounds, LowDefinedRounds, nil, ProgressEvent);
            end;
          end;
        end
        else
        begin
          if SetAttributes(FileName, File_Attribute_Directory, UseLongFileNames) then
            Done := RemoveDir(FileName);
        end;

        if Done then
        begin
          Inc(Count);

          AddProtocollLine('GELÖSCHT: "' + FileName + '"', ttDone);
        end
        else
        begin
          AddProtocollLine('BENENNE ZURÜCK:"' + FileName + '"', ttDelete);
          if RenameFile(NewFileName, FileName) then
            AddProtocollLine('ZURÜCKBENANNT: "' + FileName + '"', ttDone)
          else
          begin
            FileListListBox.Items[Index] := NewFileName;

            AddProtocollLine('NICHT ZURÜCKBENANNT: "' + FileName + '"', ttError);
            AddProtocollLine('NEUER NAME: "' + NewFileName + '"', ttEmpty);
          end;

          AddProtocollLine('NICHT GELÖSCHT: "' + FileName + '"', ttError);
        end;

        if (Count = 1) then
          DoneLabel.Caption := IntToStr(Count) + ' (' + IntToStr(Succ(Index)) + ') Datei oder Ordner von ' + IntToStr(FileListListBox.Items.Count) + ' abgearbeitet'
        else
          DoneLabel.Caption := IntToStr(Count) + ' (' + IntToStr(Succ(Index)) + ') Dateien und Ordner von ' + IntToStr(FileListListBox.Items.Count) + ' abgearbeitet';

        FLatestTime := LongInt(GetTickCount);
        GoneTimeLabel.Caption := IntToStr((FLatestTime - FStartTime) div (CHourLength * CMinuteLength * CSecondLength)) + #32#58#32 +
                                 IntToStr(((FLatestTime - FStartTime) mod (CHourLength * CMinuteLength * CSecondLength)) div (CMinuteLength * CSecondLength)) + #32#58#32 +
                                 IntToStr((((FLatestTime - FStartTime) mod (CHourLength * CMinuteLength * CSecondLength)) mod (CMinuteLength * CSecondLength)) div CSecondLength) + ' vergangen';

        ProcessProgressGauge.Progress := Succ(Index);

        if  ShowFileProgressCheckBox.Checked then
          SetCaption(IntToStr(ProcessProgressGauge.PercentDone) + #037#032#040#049#048#048#037#041#032 + ExtractFileName(FileName) + #032 + CDeletingText +  #032#045#032 + CShoreiEasyDeleterText)
        else
          SetCaption(IntToStr(ProcessProgressGauge.PercentDone) + #037#032 + ExtractFileName(FileName) + #032 + CDeletingText +  #032#045#032 + CShoreiEasyDeleterText);

        Application.ProcessMessages;
        Inc(Index);
      end
      else
      begin
        AddProtocollLine('Vorgang abgebrochen', ttAbort);

        MessageDlg('Der Vorgang wurde abgebrochen!', mtInformation, [mbOK], 0);

        Break;
      end;
    end;

    AddProtocollLine('...Vorgang beendet...', ttStop);

    if (Count = Index) then
      AddProtocollLine('Alle bearbeiteten Dateien und Ordner konnten gelöscht werden', ttDone)
    else
    begin
      if ((Count > 0) and (Index > 0)) then
        AddProtocollLine('Es konnten nicht alle bearbeiteten Dateien und Ordner gelöscht werden', ttWarning)
      else
      begin
        if ((Count = 0) and (Index > 0)) then
          AddProtocollLine('Es konnten keine der bearbeiteten Dateien und Ordner gelöscht werden', ttError)
        else
          AddProtocollLine('Fehler, Löschdaten nicht vorhanden!', ttError);
      end;
    end;

    MessageDlg('Vorgang beendet! Es wurden ' + IntToStr(Count) + ' (' + IntToStr(Index) + ') von ' + IntToStr(FileListListBox.Items.Count) + ' Dateien und Ordnern erfolgreich gelöscht!', mtInformation, [mbOK], 0);

    ProtocollListBox.Items.BeginUpdate;
    for Index := Pred(FileListListBox.Items.Count) downto 0 do
    begin
      if not(FileExists(FileListListBox.Items[Index]) or DirectoryExists(FileListListBox.Items[Index])) then
        FileListListBox.Items.Delete(Index)
      else
      begin
        if FileExists(FileListListBox.Items[Index]) then
          AddProtocollLine('Nicht gelöschte Datei: "' + FileListListBox.Items[Index] + '"', ttEmpty);
        if DirectoryExists(FileListListBox.Items[Index]) then
          AddProtocollLine('Nicht gelöschter Ordner: "' + FileListListBox.Items[Index] + '"', ttEmpty);
      end;
    end;
    ProtocollListBox.Items.EndUpdate;
    DrawFileListHorizontalScrollBar;
    UpdateFileData;

    FStarted  := false;
    FStopped  := true;

    CancelBitBtn.Visible          := false;
    DoneLabel.Caption             := '';
    FileInfoLabel.Visible         := true;
    FileListTabSheet.Enabled      := true;
    FileNameLabel.Caption         := '';
    FileProgressGauge.Progress    := 0;
    GoneTimeLabel.Caption         := '';
    InfoTabSheet.Enabled          := true;
    OptionsTabSheet.Enabled       := true;
    ProcessProgressGauge.Progress := 0;
    SaveBitBtn.Enabled            := (ProtocollListBox.Items.Count > 0);
    StartBitBtn.Visible           := true;

    DrawProtocollHorizontalScrollBar;

    if not(FCanceled) then
    begin
      if (CloseWhenSendToUsedCheckBox.Checked and (ParamCount > 0)) or
         (CloseAlwaysCheckBox.Checked and CloseWhenSendToUsedCheckBox.Checked) then
        Close;
    end;

    SetCaption(CShoreiEasyDeleterText);

    if FClosed then
      Close;

    FCanceled := true;
    FClosed   := false;

    DragAcceptFiles(Handle, true);
  end
  else
    MessageDlg('Der Vorgang wurde nicht begonnen!', mtInformation, [mbOK], 0);
end;

function TShoreiEasyDeleterMainForm.AddEntryToFileList(const AEntryName : String) : Boolean;
var
  Index       : Integer;
  StringArray : TStringArray;
begin
  Result := false;

  FileListListBox.Items.BeginUpdate;

  if (Trim(AnsiLowerCase(AEntryName)) <> '') then
  begin
    if DirectoryExists(AEntryName) then
    begin
      if (FileListListBox.Items.IndexOf(CheckBackSlash(AnsiLowerCase(AEntryName))) < 0) then
      begin
        FindAll(StringArray, 0, AEntryName, '*.*', true, true);

        for Index := 0 to High(StringArray) do
        begin
          if (FileListListBox.Items.IndexOf(AnsiLowerCase(StringArray[Index])) < 0) then
            FileListListBox.Items.Add(AnsiLowerCase(StringArray[Index]));

          if ((Index mod 100) = 0) then
          begin
            UpdateFileData;

            Application.ProcessMessages;
          end;
        end;
        FileListListBox.Items.Add(CheckBackSlash(AnsiLowerCase(AEntryName)));

        Result := true;
      end;
    end
    else
    begin
      if (FileListListBox.Items.IndexOf(AnsiLowerCase(AEntryName)) < 0) then
      begin
        FileListListBox.Items.Insert(0, AnsiLowerCase(AEntryName));

        Result := true;
      end;
    end;

    DrawFileListHorizontalScrollBar;
    UpdateFileData;
  end;

  FileListListBox.Items.EndUpdate;
end;

function TShoreiEasyDeleterMainForm.CheckBackSlash(const AFolderName : String) : String;
begin
  Result := AFolderName;
  if (AFolderName[Length(AFolderName)] <> CFolderDelimiter) then
    Result := Result + CFolderDelimiter;
end;

function TShoreiEasyDeleterMainForm.CreateLink(const AFileName : String; const ALinkFileName : String; const ALinkDescription : String; const ATryToReleaseInstances : Boolean) : Boolean;
const
  IID_IPersistFile : TGUID = (D1 : $0000010B;
                              D2 : $0000;
                              D3 : $0000;
                              D4 : ($C0, $00, $00, $00, $00, $00, $00, $46));
var
  PersistFile : IPersistFile;
  ShellLink   : IShellLink;
begin
  Result := false;

  CoInitialize(nil);
  try
    try
      if Succeeded(CoCreateInstance(CLSID_ShellLink, nil, CLSCTX_InProc_Server, IID_IShellLinkA, ShellLink)) then
      begin
        ShellLink.SetPath(PChar(AFileName));
        ShellLink.SetDescription(PChar(ALinkDescription));

        try
          if Succeeded(ShellLink.QueryInterface(IID_IPersistFile, PersistFile)) then
            Result := (PersistFile.Save(StringToOLEStr(ALinkFileName), true) = S_OK);
        finally
          try
            if ATryToReleaseInstances then
              PersistFile._Release
            else
              PersistFile := nil;

            Result := Result and true;
          except
            Result := Result and false;
          end;
        end;
      end;
    finally
      try
        if ATryToReleaseInstances then
          ShellLink._Release
        else
          ShellLink := nil;

        Result := Result and true;
      except
        Result := Result and false;
      end;
    end;
  finally
    CoUninitialize;
  end;
end;

function TShoreiEasyDeleterMainForm.DeleteLink(const ALinkFileName : String) : Boolean;
begin
  Result := DeleteFile(ALinkFileName);
end;

function TShoreiEasyDeleterMainForm.FindAll(var AStringArray : TStringArray; const AStartIndex : Integer; AFolderName : String; const AFileName : String; const ARecursive : Boolean; const AAddDirectories : Boolean) : Integer;
const
  DeltaSize = 100;
var
  SearchRec : TSearchRec;
begin
  Result := AStartIndex;

  SetLength(AStringArray, Result + DeltaSize);

  try
    AFolderName := CheckBackSlash(AFolderName);

    if (FindFirst(AFolderName + AFileName, faAnyFile - faDirectory, SearchRec) = 0) then
    begin
      if (SearchRec.Name <> '.') and
         (SearchRec.Name <> '..') then
      begin
        if FileExists(AFolderName + SearchRec.Name) then
        begin
          AStringArray[Result] := AFolderName + SearchRec.Name;

          Inc(Result);
        end;
      end;

      while (FindNext(SearchRec) = 0) do
      begin
        if (SearchRec.Name <> '.') and
           (SearchRec.Name <> '..') then
        begin
          if FileExists(AFolderName + SearchRec.Name) then
          begin
            AStringArray[Result] := AFolderName + SearchRec.Name;

            Inc(Result);

            if (Result >= Pred(Length(AStringArray))) then
              SetLength(AStringArray, Result + DeltaSize);
          end;
        end;
      end;
    end;

    SetLength(AStringArray, Result);
  finally
    FindClose(SearchRec);
  end;

  if ARecursive then
  begin
    try
      if (FindFirst(AFolderName + AFileName, faAnyFile, SearchRec) = 0) then
      begin
        if (SearchRec.Name <> '.') and
           (SearchRec.Name <> '..') then
        begin
          if DirectoryExists(AFolderName + SearchRec.Name) then
          begin
            Result := FindAll(AStringArray, Result, AFolderName + SearchRec.Name, AFileName, ARecursive, AAddDirectories);

            if AAddDirectories then
            begin
              SetLength(AStringArray, Succ(Length(AStringArray)));
              AStringArray[Result] := CheckBackSlash(AFolderName + SearchRec.Name);

              Inc(Result);
            end;
          end;
        end;

        while (FindNext(SearchRec) = 0) do
        begin
          if (SearchRec.Name <> '.') and
             (SearchRec.Name <> '..') then
          begin
            if DirectoryExists(AFolderName + SearchRec.Name) then
            begin
              Result := FindAll(AStringArray, Result, AFolderName + SearchRec.Name, AFileName, ARecursive, AAddDirectories);

              if AAddDirectories then
              begin
                SetLength(AStringArray, Succ(Length(AStringArray)));
                AStringArray[Result] := CheckBackSlash(AFolderName + SearchRec.Name);

                Inc(Result);
              end;
            end;
          end;
        end;
      end;
    finally
      FindClose(SearchRec);
    end;
  end;
end;

function TShoreiEasyDeleterMainForm.GetFileName(const AFolderName : String; const AFileExtension : String) : String;
var
  Day             : Word;
  FileCount       : LongInt;
  FileNameRadical : String;
  FolderName      : String;
  Hour            : Word;
  Minute          : Word;
  Month           : Word;
  MSecond         : Word;
  Second          : Word;
  Year            : Word;
begin
  FolderName := CheckBackSlash(AFolderName);

  DecodeDate(Now, Year, Month, Day);
  DecodeTime(Now, Hour, Minute, Second, MSecond);

  FileNameRadical := IntToStr(Day) + IntToStr(Month) + IntToStr(Year) + #95 +
                     IntToStr(Hour) + IntToStr(Minute) + IntToStr(Second) +
                     IntToStr(MSecond) + #95;

  FileCount := 1;
  while FileExists(FolderName + FileNameRadical + IntToStr(FileCount) + AFileExtension) do
    Inc(FileCount);

  Result := FolderName + FileNameRadical + IntToStr(FileCount) + AFileExtension;
end;

function TShoreiEasyDeleterMainForm.GetFolderLevel(AFolderName : String) : Integer;
var
  Index : Integer;
begin
  Result := 0;

  AFolderName := CheckBackSlash(AFolderName);
  for Index := 1 to Length(AFolderName) do
  begin
    if (AFolderName[Index] = CFolderDelimiter) then
      Inc(Result);
  end;
end;

function TShoreiEasyDeleterMainForm.GetPreviousFolder(const AFolderName : String) : String;
var
  Index : Integer;
begin
  Result := CheckBackSlash(AFolderName);

  for Index := Pred(Length(AFolderName)) downto 1 do
  begin
    if (AFolderName[Index] = CFolderDelimiter) then
    begin
      Result := CheckBackSlash(Copy(AFolderName, 1, Index));

      Exit;
    end;
  end;
end;

procedure TShoreiEasyDeleterMainForm.AddProtocollLine(const AText : String; const AType : TType);
begin
  if ActivateProtocollCheckBox.Checked then
  begin
    ProtocollListBox.Items.Add(IntToStr(Ord(AType)) + #32 + DateTimeToStr(Now) + #58#32 + AText);
    ProtocollListBox.ItemIndex := Pred(ProtocollListBox.Items.Count);
  end;
end;

procedure TShoreiEasyDeleterMainForm.CleanFileListPopupMenu;
var
  Index    : Integer;
  MenuItem : TMenuItem;
begin
  for Index := Pred(FileListPopupMenu.Items.Count) downto 0 do
  begin
    MenuItem := TMenuItem(FileListPopupMenu.Items[Index]);

    MenuItem.Free;
    MenuItem := nil;
  end;
  FileListPopupMenu.Items.Clear;
end;

procedure TShoreiEasyDeleterMainForm.DeleteFilesFromFileList(const AFileName : String; const AAskForFolderDeletion : Boolean);
var
  DeleteWholeFolder : Boolean;
  FolderLevelCount  : Integer;
  FolderLevels      : TStringArray;
  Found             : Boolean;
  Index             : Integer;
  IsAFolder         : Boolean;
begin
  if (AFileName <> '') then
  begin
    DeleteWholeFolder := false;
    IsAFolder := false;
    if DirectoryExists(AFileName) then
    begin
      if AAskForFolderDeletion then
        DeleteWholeFolder := (MessageDlg('Soll der ganze Ordner aus der Datei-Liste entfernt werden?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
      else
        DeleteWholeFolder := true;

      IsAFolder := true;
    end;

    SetLength(FolderLevels, GetFolderLevel(AFileName));
    FolderLevels[0] := CheckBackSlash(ExtractFilePath(AFileName));
    for Index := 1 to High(FolderLevels) do
      FolderLevels[Index] := CheckBackSlash(GetPreviousFolder(FolderLevels[Pred(Index)]));

    FileListListBox.Items.BeginUpdate;

    for Index := Pred(FileListListBox.Items.Count) downto 0 do
    begin
      Found := false;

      if (AFileName = FileListListBox.Items[Index]) then
      begin
        FileListListBox.Items.Delete(Index);
        Found := true;
      end;

      if not(Found) then
      begin
        for FolderLevelCount := 0 to High(FolderLevels) do
        begin
          if (FileListListBox.Items[Index] = FolderLevels[FolderLevelCount]) then
          begin
            FileListListBox.Items.Delete(Index);
            Found := true;

            Break;
          end;
        end;
      end;

      if not(Found) then
      begin
        if IsAFolder and DeleteWholeFolder then
        begin
          if (Pos(AFileName, FileListListBox.Items[Index]) > 0) then
          begin
            FileListListBox.Items.Delete(Index);
            Found := true;
          end;
        end;
      end;
    end;

    FileListListBox.Items.EndUpdate;

    DrawFileListHorizontalScrollBar;
    UpdateFileData;
  end;
end;

procedure TShoreiEasyDeleterMainForm.DrawFileListHorizontalScrollBar;
var
  Index          : Integer;
  MaxLengthIndex : Integer;
begin
  if (FileListListBox.Items.Count > 0) then
    MaxLengthIndex := 0
  else
    MaxLengthIndex := - 1;

  for Index := 0 to Pred(FileListListBox.Items.Count) do
  begin
    if (Length(FileListListBox.Items[Index]) > Length(FileListListBox.Items[MaxLengthIndex])) then
      MaxLengthIndex := Index;
  end;

  if (MaxLengthIndex >= 0) then
    SendMessage(FileListListBox.Handle, lb_SetHorizontalExtent, Round(FileListListBox.Canvas.TextWidth(FileListListBox.Items[MaxLengthIndex]) *  1.1), 0)
  else
    SendMessage(FileListListBox.Handle, lb_SetHorizontalExtent, 0, 0);
end;

procedure TShoreiEasyDeleterMainForm.DrawProtocollHorizontalScrollBar;
var
  Index          : Integer;
  MaxLengthIndex : Integer;
begin
  if (ProtocollListBox.Items.Count > 0) then
    MaxLengthIndex := 0
  else
    MaxLengthIndex := - 1;

  for Index := 0 to Pred(ProtocollListBox.Items.Count) do
  begin
    if (Length(ProtocollListBox.Items[Index]) > Length(ProtocollListBox.Items[MaxLengthIndex])) then
      MaxLengthIndex := Index;
  end;

  if (MaxLengthIndex >= 0) then
    SendMessage(ProtocollListBox.Handle, lb_SetHorizontalExtent, Round(ProtocollListBox.Canvas.TextWidth(ProtocollListBox.Items[MaxLengthIndex]) *  1.1), 0)
  else
    SendMessage(ProtocollListBox.Handle, lb_SetHorizontalExtent, 0, 0);
end;

procedure TShoreiEasyDeleterMainForm.DropFiles(var AMessage : TMessage);
var
  ArrayIndex   : Integer;
  FileArray    : TStringArray;
  FileCount    : Integer;
  FileIndex    : Integer;
  NextFileName : PChar;
  PCharSize    : Integer;
begin
  inherited;

  MainPageControl.ActivePage := FileListTabSheet;

  NextFileName := '';
  FileCount := DragQueryFile(AMessage.WParam, $FFFFFFFF, NextFileName, $FF);

  SetLength(FileArray, FileCount);
  ArrayIndex := 0;

  for FileIndex := 0 to Pred(FileCount) do
  begin
    PCharSize := Succ(DragQueryFile(AMessage.WParam, FileIndex, nil, 0));

    NextFileName := StrAlloc(PCharSize);
    try
      DragQueryFile(AMessage.WParam, FileIndex, NextFileName, PCharSize);

      if not(AddEntryToFileList(String(NextFileName))) then
      begin
        FileArray[ArrayIndex] := String(NextFileName);

        Inc(ArrayIndex);
      end;
    finally
      StrDispose(NextFileName);
    end;
  end;

  DragFinish(AMessage.WParam);

  SetLength(FileArray, ArrayIndex);

  if ShowWarningsCheckBox.Checked then
  begin
    if (Length(FileArray) > 0) then
    begin
      if ShowWarningsFormCheckBox.Checked then
        FileNamesForm.ShowFileNames(FileArray)
      else
      begin
        if (Length(FileArray) = 1) then
        begin
          if (FileCount = 1) then
            MessageDlg('Die ausgewählte Datei oder Ordner ist bereits in der Datei-Liste vorhanden!', mtWarning, [mbOK], 0)
          else
            MessageDlg('Eine der ausgewählten Dateien und Ordner ist bereits in der Datei-Liste vorhanden!', mtWarning, [mbOK], 0);
        end
        else
          MessageDlg('Einige der ausgewählten Dateien und Ordner sind bereits in der Datei-Liste vorhanden!', mtWarning, [mbOK], 0);
      end;
    end;
  end;

  SetLength(FileArray, 0);
end;

procedure TShoreiEasyDeleterMainForm.LoadOptions;
var
  ErrorCode  : Integer;
  LoadFile   : TextFile;
  NextLine   : String;
  NextNumber : Byte;
begin
  FLicenseAgreed                             := false;
  ActivateFileListPageCheckBox.Checked       := false;
  ActivateProtocollCheckBox.Checked          := false;
  CloseAlwaysCheckBox.Checked                := false;
  CloseWhenSendToUsedCheckBox.Checked        := false;
  HighPostRandomRoundsSpinEdit.Value         := 4;
  HighPreRandomRoundsSpinEdit.Value          := 4;
  LowDefinedRoundsSpinEdit.Value             := 3;
  LowPostRandomRoundsSpinEdit.Value          := 4;
  LowPreRandomRoundsSpinEdit.Value           := 4;
  MiddleDefinedRoundsSpinEdit.Value          := 3;
  MiddlePostRandomRoundsSpinEdit.Value       := 4;
  MiddlePreRandomRoundsSpinEdit.Value        := 4;
  RenameFilesCheckBox.Checked                := true;
  SecurityTrackBar.Position                  := 0;
  ShowFileProgressCheckBox.Checked           := true;
  ShowWarningsCheckBox.Checked               := true;
  ShowWarningsFormCheckBox.Checked           := true;
  UseLongFileNamesCheckBox.Checked           := false;

  if FileExists(ChangeFileExt(Application.ExeName, COptionsFileExt)) then
  begin
    AssignFile(LoadFile, ChangeFileExt(Application.ExeName, COptionsFileExt));
    try
      Reset(LoadFile);

// FLicenseAgreed
      if not(EoF(LoadFile)) then
      begin
        ReadLn(LoadFile, NextLine);

        Val(NextLine, NextNumber, ErrorCode);
        if (ErrorCode = 0) then
          FLicenseAgreed := Boolean(NextNumber);

// ActivateFileListPageCheckBox.Checked
        if not(EoF(LoadFile)) then
        begin
          ReadLn(LoadFile, NextLine);

          Val(NextLine, NextNumber, ErrorCode);
          if (ErrorCode = 0) then
            ActivateFileListPageCheckBox.Checked := Boolean(NextNumber);

// ActivateProtocollCheckBox.Checked
          if not(EoF(LoadFile)) then
          begin
            ReadLn(LoadFile, NextLine);

            Val(NextLine, NextNumber, ErrorCode);
            if (ErrorCode = 0) then
              ActivateProtocollCheckBox.Checked := Boolean(NextNumber);

// CloseAlwaysCheckBox.Checked
            if not(EoF(LoadFile)) then
            begin
              ReadLn(LoadFile, NextLine);

              Val(NextLine, NextNumber, ErrorCode);
              if (ErrorCode = 0) then
                CloseAlwaysCheckBox.Checked := Boolean(NextNumber);

// CloseWhenSendToUsedCheckBox.Checked
              if not(EoF(LoadFile)) then
              begin
                ReadLn(LoadFile, NextLine);

                Val(NextLine, NextNumber, ErrorCode);
                if (ErrorCode = 0) then
                  CloseWhenSendToUsedCheckBox.Checked := Boolean(NextNumber);

// HighPostRandomRoundsSpinEdit.Value
                if not(EoF(LoadFile)) then
                begin
                  ReadLn(LoadFile, NextLine);

                  Val(NextLine, NextNumber, ErrorCode);
                  if (ErrorCode = 0) then
                    HighPostRandomRoundsSpinEdit.Value := NextNumber;

// HighPreRandomRoundsSpinEdit.Value
                  if not(EoF(LoadFile)) then
                  begin
                    ReadLn(LoadFile, NextLine);

                    Val(NextLine, NextNumber, ErrorCode);
                    if (ErrorCode = 0) then
                      HighPreRandomRoundsSpinEdit.Value := NextNumber;

// LowDefinedRoundsSpinEdit.Value
                    if not(EoF(LoadFile)) then
                    begin
                      ReadLn(LoadFile, NextLine);

                      Val(NextLine, NextNumber, ErrorCode);
                      if (ErrorCode = 0) then
                        LowDefinedRoundsSpinEdit.Value := NextNumber;

// LowPostRandomRoundsSpinEdit.Value
                      if not(EoF(LoadFile)) then
                      begin
                        ReadLn(LoadFile, NextLine);

                        Val(NextLine, NextNumber, ErrorCode);
                        if (ErrorCode = 0) then
                          LowPostRandomRoundsSpinEdit.Value := NextNumber;

// LowPreRandomRoundsSpinEdit.Value
                        if not(EoF(LoadFile)) then
                        begin
                          ReadLn(LoadFile, NextLine);

                          Val(NextLine, NextNumber, ErrorCode);
                          if (ErrorCode = 0) then
                            LowPreRandomRoundsSpinEdit.Value := NextNumber;

// MiddleDefinedRoundsSpinEdit.Value
                          if not(EoF(LoadFile)) then
                          begin
                            ReadLn(LoadFile, NextLine);

                            Val(NextLine, NextNumber, ErrorCode);
                            if (ErrorCode = 0) then
                              MiddleDefinedRoundsSpinEdit.Value := NextNumber;

// MiddlePostRandomRoundsSpinEdit.Value
                            if not(EoF(LoadFile)) then
                            begin
                              ReadLn(LoadFile, NextLine);

                              Val(NextLine, NextNumber, ErrorCode);
                              if (ErrorCode = 0) then
                                MiddlePostRandomRoundsSpinEdit.Value := NextNumber;

// MiddlePreRandomRoundsSpinEdit.Value
                              if not(EoF(LoadFile)) then
                              begin
                                ReadLn(LoadFile, NextLine);

                                Val(NextLine, NextNumber, ErrorCode);
                                if (ErrorCode = 0) then
                                  MiddlePreRandomRoundsSpinEdit.Value := NextNumber;

// RenameFilesCheckBox.Checked
                                if not(EoF(LoadFile)) then
                                begin
                                  ReadLn(LoadFile, NextLine);

                                  Val(NextLine, NextNumber, ErrorCode);
                                  if (ErrorCode = 0) then
                                    RenameFilesCheckBox.Checked := Boolean(NextNumber);

// SecurityTrackBar.Position
                                  if not(EoF(LoadFile)) then
                                  begin
                                    ReadLn(LoadFile, NextLine);

                                    Val(NextLine, NextNumber, ErrorCode);
                                    if (ErrorCode = 0) then
                                      SecurityTrackBar.Position := NextNumber;

// ShowFileProgressCheckBox.Checked
                                    if not(EoF(LoadFile)) then
                                    begin
                                      ReadLn(LoadFile, NextLine);

                                      Val(NextLine, NextNumber, ErrorCode);
                                      if (ErrorCode = 0) then
                                        ShowFileProgressCheckBox.Checked := Boolean(NextNumber);

// ShowWarningsCheckBox.Checked
                                      if not(EoF(LoadFile)) then
                                      begin
                                        ReadLn(LoadFile, NextLine);

                                        Val(NextLine, NextNumber, ErrorCode);
                                        if (ErrorCode = 0) then
                                          ShowWarningsCheckBox.Checked := Boolean(NextNumber);

// ShowWarningsFormCheckBox.Checked
                                        if not(EoF(LoadFile)) then
                                        begin
                                          ReadLn(LoadFile, NextLine);

                                          Val(NextLine, NextNumber, ErrorCode);
                                          if (ErrorCode = 0) then
                                            ShowWarningsFormCheckBox.Checked := Boolean(NextNumber);

// UseLongFileNamesCheckBox.Checked
                                          if not(EoF(LoadFile)) then
                                          begin
                                            ReadLn(LoadFile, NextLine);

                                            Val(NextLine, NextNumber, ErrorCode);
                                            if (ErrorCode = 0) then
                                              UseLongFileNamesCheckBox.Checked := Boolean(NextNumber);
                                          end;
                                        end;
                                      end;
                                    end;
                                  end;
                                end;
                              end;
                            end;
                          end;
                        end;
                      end;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    finally
      CloseFile(LoadFile);
    end;
  end;
end;

procedure TShoreiEasyDeleterMainForm.PopupMenuItemClick(Sender : TObject);
var
  MenuItemName   : String;
  TempArrayIndex : Integer;
begin
  if (Sender <> nil) then
  begin
    MenuItemName   := TMenuItem(Sender).Name;
    TempArrayIndex := StrToInt(Copy(MenuItemName, Succ(Length('PopupMenuItem')), Length(MenuItemName) - Length('PopupMenuItem')));

    if (Pred(Length(FTempFolderNames)) >= TempArrayIndex) then
      DeleteFilesFromFileList(FTempFolderNames[TempArrayIndex], false);
  end;
end;

procedure TShoreiEasyDeleterMainForm.ProgressEvent(const AFileName : String; const AProgressPercentage : TProgressPercentage; var ACancelProcess : Boolean);
begin
  if FStopped then
  begin
    AddProtocollLine('...Vorgang gestoppt...', ttStop);

    if (MessageDlg('Wollen sie den Vorgang wirklich abbrechen?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      FCanceled := true
    else
    begin
      FClosed  := false;
      FStopped := false;

      AddProtocollLine('...Vorgang fortgesetzt...', ttStart);
    end;
  end;

  if ShowFileProgressCheckBox.Checked then
  begin
    SetCaption(IntToStr(ProcessProgressGauge.PercentDone) + #037#032#040 + IntToStr(AProgressPercentage) + #037#041#032 + ExtractFileName(AFileName) + #032 + CDeletingText +  #032#045#032 + CShoreiEasyDeleterText);
    FileProgressGauge.Progress := AProgressPercentage;
  end
  else
  begin
    if (Caption <> ExtractFileName(AFileName) + #032 + CDeletingText +  #032#045#032 + CShoreiEasyDeleterText) then
    begin
      SetCaption(IntToStr(ProcessProgressGauge.PercentDone) + #037#032 + ExtractFileName(AFileName) + #032 + CDeletingText +  #032#045#032 + CShoreiEasyDeleterText);
      FileProgressGauge.Progress := 0;
    end;
  end;

  FLatestTime := LongInt(GetTickCount);
  GoneTimeLabel.Caption := IntToStr((FLatestTime - FStartTime) div (CHourLength * CMinuteLength * CSecondLength)) + #32#58#32 +
                           IntToStr(((FLatestTime - FStartTime) mod (CHourLength * CMinuteLength * CSecondLength)) div (CMinuteLength * CSecondLength)) + #32#58#32 +
                           IntToStr((((FLatestTime - FStartTime) mod (CHourLength * CMinuteLength * CSecondLength)) mod (CMinuteLength * CSecondLength)) div CSecondLength) + ' vergangen';

  ACancelProcess := FStopped;
end;

procedure TShoreiEasyDeleterMainForm.RegisterApplication;
var
  Registry : TRegistry;
begin
  Registry := TRegistry.Create;
  try
    Registry.RootKey := hKey_Local_Machine;

    if Registry.KeyExists(CApplicationRegistrationRegistryKey) then
    begin
      if Registry.OpenKey(CApplicationRegistrationRegistryKey + ExtractFileName(Application.ExeName) + '\', true) then
      begin
        if (Registry.ReadString('') <> Application.ExeName) then
          Registry.WriteString('', Application.ExeName);

        if not(Registry.ValueExists(CApplicationRegistrationRegistryPathValue)) or (Registry.ReadString(CApplicationRegistrationRegistryPathValue) <> ExtractFilePath(Application.ExeName)) then
          Registry.WriteString(CApplicationRegistrationRegistryPathValue, ExtractFilePath(Application.ExeName));
      end;
    end;
  finally
    Registry.Free;
    Registry := nil;
  end;
end;

procedure TShoreiEasyDeleterMainForm.SaveOptions;
var
  FileName : WideString;
  SaveFile : TextFile;
begin
  FileName := ChangeFileExt(Application.ExeName, '.edo');

  if CanWriteOnDrive(Application.ExeName) then
  begin
    if (SetAttributes(FileName, File_Attribute_Normal, UseLongFileNamesCheckBox.Checked) or not(FileExists(FileName))) then
    begin
      AssignFile(SaveFile, FileName);
      try
        Rewrite(SaveFile);

        WriteLn(SaveFile, IntToStr(Ord(FLicenseAgreed)));

        WriteLn(SaveFile, IntToStr(Ord(ActivateFileListPageCheckBox.Checked)));
        WriteLn(SaveFile, IntToStr(Ord(ActivateProtocollCheckBox.Checked)));
        WriteLn(SaveFile, IntToStr(Ord(CloseAlwaysCheckBox.Checked)));
        WriteLn(SaveFile, IntToStr(Ord(CloseWhenSendToUsedCheckBox.Checked)));
        WriteLn(SaveFile, IntToStr(HighPostRandomRoundsSpinEdit.Value));
        WriteLn(SaveFile, IntToStr(HighPreRandomRoundsSpinEdit.Value));
        WriteLn(SaveFile, IntToStr(LowDefinedRoundsSpinEdit.Value));
        WriteLn(SaveFile, IntToStr(LowPostRandomRoundsSpinEdit.Value));
        WriteLn(SaveFile, IntToStr(LowPreRandomRoundsSpinEdit.Value));
        WriteLn(SaveFile, IntToStr(MiddleDefinedRoundsSpinEdit.Value));
        WriteLn(SaveFile, IntToStr(MiddlePostRandomRoundsSpinEdit.Value));
        WriteLn(SaveFile, IntToStr(MiddlePreRandomRoundsSpinEdit.Value));
        WriteLn(SaveFile, IntToStr(Ord(RenameFilesCheckBox.Checked)));
        WriteLn(SaveFile, IntToStr(SecurityTrackBar.Position));
        WriteLn(SaveFile, IntToStr(Ord(ShowFileProgressCheckBox.Checked)));
        WriteLn(SaveFile, IntToStr(Ord(ShowWarningsCheckBox.Checked)));
        WriteLn(SaveFile, IntToStr(Ord(ShowWarningsFormCheckBox.Checked)));
        WriteLn(SaveFile, IntToStr(Ord(UseLongFileNamesCheckBox.Checked)));
      finally
        CloseFile(SaveFile);
      end;
    end;
  end;
end;

procedure TShoreiEasyDeleterMainForm.UpdateFileData;
begin
  if (FileListListBox.Items.Count = 1) then
  begin
    FileCountLabel.Caption := IntToStr(FileListListBox.Items.Count) + ' Datei oder Ordner ausgewählt';
    FileInfoLabel.Caption  := IntToStr(FileListListBox.Items.Count) + ' Datei oder Ordner ausgewählt'
  end
  else
  begin
    FileCountLabel.Caption := IntToStr(FileListListBox.Items.Count) + ' Dateien und Ordner ausgewählt';
    FileInfoLabel.Caption  := IntToStr(FileListListBox.Items.Count) + ' Dateien und Ordner ausgewählt';
  end;

  StartBitBtn.Enabled := (FileListListBox.Items.Count > 0);
end;

function TShoreiEasyDeleterMainForm.CanWriteOnDrive(const AFileName : String) : Boolean;
begin
  Result := false;

  if FileExists(AFileName) then
    Result := SetAttributes(AFileName, File_Attribute_Normal, UseLongFileNamesCheckBox.Checked);
end;

function TShoreiEasyDeleterMainForm.FileInUse(const AFileName : String) : Boolean;
var
  FileHandle : THandle;
begin
  Result := false;

  if FileExists(AFileName) then
  begin
    FileHandle := Windows.CreateFile(PChar(AFileName), Generic_Read or Generic_Write or Generic_Execute, 0, nil, Open_Existing, File_Attribute_Normal, 0);
    try
      Result := (FileHandle = Invalid_Handle_Value);
    finally
      if not(Result) then
        CloseHandle(FileHandle);
    end;
  end;
end;

function TShoreiEasyDeleterMainForm.SetAttributes(const AFileName : String; const AAttributes : Cardinal; const AUseLongFileName : Boolean) : Boolean;
var
  FileNameW : WideString;
begin
  if AUseLongFileName then
  begin
    FileNameW := WideString(AFileName);

    Result := SetFileAttributesW(PWideChar('\\?\' + FileNameW), AAttributes);
  end
  else
    Result := SetFileAttributes(PChar(AFileName), AAttributes);
end;

procedure TShoreiEasyDeleterMainForm.SetCaption(const ACaption : String);
begin
  Application.Title := ACaption;
  Caption           := ACaption;
end;

end.
