unit FilesF;

interface

uses
  Windows,
  StdCtrls,
  Messages,
  MainF,
  Forms,
  Controls,
  Classes;

type
  TFileNamesForm = class(TForm)
    CloseButton      : TButton;
    FileNamesListBox : TListBox;

    procedure CloseButtonClick(Sender : TObject);
  private
    { Private-Deklarationen }
    procedure AddLine(AFileName : String);
    procedure DrawFileNamesListHorizontalScrollBar;
  public
    { Public-Deklarationen }
    procedure ShowFileName(AFileName : String);
    procedure ShowFileNames(AFileNameArray : TStringArray);
  end;

var
  FileNamesForm : TFileNamesForm;

implementation

{$R *.dfm}

procedure TFileNamesForm.CloseButtonClick(Sender : TObject);
begin
  FileNamesListBox.Clear;

  Close;
end;

procedure TFileNamesForm.AddLine(AFileName : String);
begin
  FileNamesListBox.Items.Add('"' + AFileName + '" konnte nicht zur Datei-Liste hinzugefügt werden!');
end;

procedure TFileNamesForm.DrawFileNamesListHorizontalScrollBar;
var
  Index          : Integer;
  MaxLengthIndex : Integer;
begin
  if (FileNamesListBox.Items.Count > 0) then
    MaxLengthIndex := 0
  else
    MaxLengthIndex := - 1;

  for Index := 0 to Pred(FileNamesListBox.Items.Count) do
  begin
    if (Length(FileNamesListBox.Items[Index]) > Length(FileNamesListBox.Items[MaxLengthIndex])) then
      MaxLengthIndex := Index;
  end;

  if (MaxLengthIndex >= 0) then
    SendMessage(FileNamesListBox.Handle, lb_SetHorizontalExtent, Round(FileNamesListBox.Canvas.TextWidth(FileNamesListBox.Items[MaxLengthIndex]) *  1.1), 0)
  else
    SendMessage(FileNamesListBox.Handle, lb_SetHorizontalExtent, 0, 0);
end;

procedure TFileNamesForm.ShowFileName(AFileName : String);
begin
  FileNamesListBox.Clear;

  AddLine(AFileName);

  DrawFileNamesListHorizontalScrollBar;

  Show;
end;

procedure TFileNamesForm.ShowFileNames(AFileNameArray : TStringArray);
var
  Index : Integer;
begin
  FileNamesListBox.Clear;

  for Index := Low(AFileNameArray) to High(AFileNameArray) do
    AddLine(AFileNameArray[Index]);

  DrawFileNamesListHorizontalScrollBar;

  Show;
end;

end.
