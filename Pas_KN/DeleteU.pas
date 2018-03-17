unit DeleteU;

// DON'T DELETE THIS COMMENT !!!

{--------------------------------------------}
{ Unit:         DeleteU.pas                  }
{ Version:      1.24                         }
{                                            }
{ Coder:        Yahe <hello@yahe.sh>         }
{                                            }
{ Copyright:    (C) 2004-2018 by Yahe        }
{                                            }
{ I'm NOT Liable For Damages Of ANY Kind !!! }
{--------------------------------------------}

// DON'T DELETE THIS COMMENT !!!

{.$Define NoDeleteOnDoubleComma}

interface

uses
  Windows,
  SysUtils;

type
  TProgressPercentage  = 0 .. 100;
  TProgressEvent       = procedure (const AFileName : String; const AProgressPercentage : TProgressPercentage; var ACancelProcess : Boolean);
  TProgressObjectEvent = procedure (const AFileName : String; const AProgressPercentage : TProgressPercentage; var ACancelProcess : Boolean) of Object;

const
  CBufferCount          = 1026; {Has To Be Positive, Bigger Than 0 (Zero) And Dividable By 2 (Two) And 3 (Three)}
  CCheckIndexMultiplier = 4;    {Has To Be Positive Or Equal To 0 (Zero)}

{$IfDef NoDeleteOnDoubleComma}
  CNoDeleteOnDoubleComma = true;
{$Else NoDeleteOnDoubleComma}
  CNoDeleteOnDoubleComma = false;
{$EndIf NoDeleteOnDoubleComma}

function DeleteFile_BSI(const AFileName : String; const ARandomPreRounds : LongWord; const ARandomPostRounds : LongWord; const ADefinedRounds : LongWord; const AProgressEvent : TProgressEvent; const AProgressObjectEvent : TProgressObjectEvent) : Boolean;
function DeleteFile_DoCSUoA(const AFileName : String; const ARandomPreRounds : LongWord; const ARandomPostRounds : LongWord; const ANewFileName : String; const AProgressEvent : TProgressEvent; const AProgressObjectEvent : TProgressObjectEvent) : Boolean;
function DeleteFile_USDoD(const AFileName : String; const ARandomPreRounds : LongWord; const ARandomPostRounds : LongWord; const ADefinedRounds : LongWord; const ANewFileName : String; const AProgressEvent : TProgressEvent; const AProgressObjectEvent : TProgressObjectEvent) : Boolean;

implementation

type
  TByte_BSI_USDoD = 0 .. 256;
  TByte_DoCSUoA   = 0 .. 27;

  TRange_BSI_USDoD = 0 .. 127;

  TDynamic_Byte_BSI_USDoD_Array = array of TByte_BSI_USDoD;
  TDynamic_Byte_DoCSUoA_Array   = array of TByte_DoCSUoA;

  TDynamic_Range_BSI_USDoD_Array = array of TRange_BSI_USDoD;
  TRange_BSI_USDoD_Set           = set of TRange_BSI_USDoD;

  TByte_DoCSUoA_Set            = set of TByte_DoCSUoA;
  TStatic_Byte_DoCSUoA_Array   = array [1 .. High(TByte_DoCSUoA)] of TByte_DoCSUoA;
  TStatic_String_DoCSUoA_Array = array [1 .. High(TByte_DoCSUoA)] of String;

type
  TDeleteFileDynamicByte      = TByte_BSI_USDoD;
  TDeleteFileDynamicByteArray = TDynamic_Byte_BSI_USDoD_Array;

  TDeleteFileByteArray = array [1..Abs(CBufferCount)] of Byte;

  TGetBufferArrayMethod = procedure (const ABufferValue : TDeleteFileDynamicByte; var ABufferArray : TDeleteFileByteArray);

function DeleteFile_All(const AFileName : String; const ADynamicByteArray : TDeleteFileDynamicByteArray; const AGetBufferArrayMethod : TGetBufferArrayMethod; const AProgressEvent : TProgressEvent; const AProgressObjectEvent : TProgressObjectEvent) : Boolean; forward;

procedure ProgressEvent(const AFileName : String; const AProgressEvent : TProgressEvent; const AProgressObjectEvent : TProgressObjectEvent; const AProgressPercentage : TProgressPercentage; var ACancelProcess : Boolean); forward;
procedure ProcessMessages; forward;

procedure GetBufferArray_BSI_USDoD(const ABufferValue : TDeleteFileDynamicByte; var ABufferArray : TDeleteFileByteArray); forward;
procedure GetBufferArray_DoCSUoA(const ABufferValue : TDeleteFileDynamicByte; var ABufferArray : TDeleteFileByteArray); forward;

function DeleteFile_All(const AFileName : String; const ADynamicByteArray : TDeleteFileDynamicByteArray; const AGetBufferArrayMethod : TGetBufferArrayMethod; const AProgressEvent : TProgressEvent; const AProgressObjectEvent : TProgressObjectEvent) : Boolean;
var
  BufferArray         : TDeleteFileByteArray;
  CancelProcess       : Boolean;
  CheckIndex          : LongInt;
  DeletedFile         : THandle;
  DeletedFileSize     : Int64;
  DeletedFileSizeLow  : LongWord;
  DeletedFileSizeHigh : LongWord;
  Index               : LongWord;
  ProgressMultiplier  : Extended;
  ResultCount         : LongInt;
  RoundsCount         : LongInt;
  TempResult          : Boolean;
  WrittenCount        : Cardinal;
begin
  Result := false;

  ProgressEvent(AFileName, AProgressEvent, AProgressObjectEvent, 0, CancelProcess);
  if not(CancelProcess) then
  begin
    if FileExists(AFileName) then
    begin
      CheckIndex  := 0;
      ResultCount := 0;
      TempResult  := false;

      DeletedFile := CreateFile(PChar(AFileName), Generic_Write, 0, nil, Open_Always, File_Attribute_Normal or File_Attribute_Archive or File_Attribute_Hidden or File_Flag_Write_Through or File_Flag_Sequential_Scan, 0);
      if ((DeletedFile <> Error_Already_Exists) and (DeletedFile <> Invalid_Handle_Value)) then
      begin
        try
          DeletedFileSizeLow := GetFileSize(DeletedFile, @DeletedFileSizeHigh);
          if not((DeletedFileSizeLow = Invalid_File_Size) and (GetLastError <> No_Error)) then
          begin
            DeletedFileSize := (Int64(DeletedFileSizeHigh) shl 32) + Int64(DeletedFileSizeLow);

            if (Length(ADynamicByteArray) > 0) then
            begin
              if ((DeletedFileSize div Abs(CBufferCount)) > 0) then
                ProgressMultiplier := (99 / Length(ADynamicByteArray) / (DeletedFileSize div Abs(CBufferCount)))
              else
                ProgressMultiplier := (99 / Length(ADynamicByteArray));

              TempResult := true;
              for RoundsCount := 0 to Pred(Length(ADynamicByteArray)) do
              begin
                AGetBufferArrayMethod(ADynamicByteArray[RoundsCount], BufferArray);

                for Index := 1 to (DeletedFileSize div Abs(CBufferCount)) do
                begin
                  TempResult := TempResult and WriteFile(DeletedFile, BufferArray, Length(BufferArray), WrittenCount, nil);
                  TempResult := TempResult and (WrittenCount = Length(BufferArray));

                  Inc(CheckIndex);
                  if (CheckIndex >= (Abs(CBufferCount) + Abs(CBufferCount) * Abs(CCheckIndexMultiplier))) then
                  begin
                    TempResult := TempResult and FlushFileBuffers(DeletedFile);

                    CheckIndex := 0;

                    if ((DeletedFileSize div Abs(CBufferCount)) > 0) then
                      ProgressEvent(AFileName, AProgressEvent, AProgressObjectEvent, Succ(Round(ProgressMultiplier * Index + ProgressMultiplier * RoundsCount * (DeletedFileSize div Abs(CBufferCount)))), CancelProcess)
                    else
                      ProgressEvent(AFileName, AProgressEvent, AProgressObjectEvent, Succ(Round(ProgressMultiplier * Index + ProgressMultiplier * RoundsCount)), CancelProcess);
                    if CancelProcess then
                      Break;
                  end;
                end;

                if not(CancelProcess) then
                begin
                  if ((DeletedFileSize mod Abs(CBufferCount)) <> 0) then
                  begin
                    TempResult := TempResult and WriteFile(DeletedFile, BufferArray, (DeletedFileSize mod Abs(CBufferCount)), WrittenCount, nil);
                    TempResult := TempResult and (WrittenCount = (DeletedFileSize mod Abs(CBufferCount)));
                  end;
                  TempResult := TempResult and FlushFileBuffers(DeletedFile);

                  Inc(ResultCount);

                  if ((DeletedFileSize div Abs(CBufferCount)) > 0) then
                    ProgressEvent(AFileName, AProgressEvent, AProgressObjectEvent, Succ(Round(ProgressMultiplier * RoundsCount * (DeletedFileSize div Abs(CBufferCount)))), CancelProcess)
                  else
                    ProgressEvent(AFileName, AProgressEvent, AProgressObjectEvent, Succ(Round(ProgressMultiplier * RoundsCount)), CancelProcess);
                end;
                if CancelProcess then
                  Break;
              end;
            end;

            if not(CancelProcess) then
            begin
              if FlushFileBuffers(DeletedFile) then
                Result := TempResult and (ResultCount = Length(ADynamicByteArray));
            end;
          end;
        finally
          CloseHandle(DeletedFile);
        end;
      end;

      if not(CancelProcess) then
      begin
        if Result then
        begin
          if ((not((AFileName[Length(AFileName)] = #44) and
                  (AFileName[Pred(Length(AFileName))] = #44))) or
              not(CNoDeleteOnDoubleComma)) then
            Result := Result and DeleteFile(AFileName);
        end;

        ProgressEvent(AFileName, AProgressEvent, AProgressObjectEvent, 100, CancelProcess);
      end;
    end;
  end;
end;

procedure ProgressEvent(const AFileName : String; const AProgressEvent : TProgressEvent; const AProgressObjectEvent : TProgressObjectEvent; const AProgressPercentage : TProgressPercentage; var ACancelProcess : Boolean);
var
  ProcessCanceled       : Boolean;
  ProcessObjectCanceled : Boolean;
begin
  ACancelProcess := false;

  ProcessCanceled       := false;
  ProcessObjectCanceled := false;

  ProcessMessages;
  if Assigned(AProgressEvent) then
    AProgressEvent(AFileName, AProgressPercentage, ProcessCanceled);
  if Assigned(AProgressObjectEvent) then
    AProgressObjectEvent(AFileName, AProgressPercentage, ProcessObjectCanceled);

  ACancelProcess := ProcessCanceled or ProcessObjectCanceled;
end;

procedure ProcessMessages;
var
  TempMessage : tagMsg;
begin
  while PeekMessage(TempMessage, 0, 0, 0, pm_Remove) do
  begin
    TranslateMessage(TempMessage);
    DispatchMessage(TempMessage);
  end;
end;

{
Method after:

  "
   Bundesamt für Sicherheit in der Informationstechnik (BSI)
   (Federal Office for Information Security)
   - Germany -
  "

  in

  "
   Secure deletion of data media
  "

  published in

  "
   IT Baseline Protection Manual
  "
}
function DeleteFile_BSI(const AFileName : String; const ARandomPreRounds : LongWord; const ARandomPostRounds : LongWord; const ADefinedRounds : LongWord; const AProgressEvent : TProgressEvent; const AProgressObjectEvent : TProgressObjectEvent) : Boolean;
  procedure GetRandomRounds(const ARandomPreRounds : LongWord; const ARandomPostRounds : LongWord; const ADefinedRounds : LongWord; var AResultArray_BSI : TDeleteFileDynamicByteArray);
  var
    Index       : LongWord;
    NextNumber  : TRange_BSI_USDoD;
    NumberArray : TDynamic_Range_BSI_USDoD_Array;
    NumberSet   : TRange_BSI_USDoD_Set;
  begin
    SetLength(NumberArray, ADefinedRounds);
    NumberSet := [];
    if (Length(NumberArray) > 0) then
    begin
      for Index := Low(NumberArray) to High(NumberArray) do
      begin
        NumberArray[Index] := 0;

        repeat
          NextNumber := Random(Succ(High(TRange_BSI_USDoD)));
        until not(NextNumber in NumberSet);

        NumberArray[Index] := NextNumber;

        if ((Index - Low(NumberArray)) >= Pred(High(TRange_BSI_USDoD))) then
          NumberSet := []
        else
          NumberSet := NumberSet + [NextNumber];
      end;
    end;

    SetLength(AResultArray_BSI, (ADefinedRounds * 2) + ARandomPreRounds + ARandomPostRounds);

    if (ARandomPreRounds > 0) then
    begin
      for Index := 0 to Pred(ARandomPreRounds) do
        AResultArray_BSI[Index] := 256;
    end;

    if (ARandomPostRounds > 0) then
    begin
      for Index := 0 to Pred(ARandomPostRounds) do
        AResultArray_BSI[High(AResultArray_BSI) - Index] := 256;
    end;

    if (ADefinedRounds > 0) then
    begin
      for Index := 1 to ADefinedRounds do
      begin
        if (Random(2) = 0) then
        begin
          AResultArray_BSI[(Pred(Index) * 2) + ARandomPreRounds + 0] := NumberArray[Pred(Index)];
          AResultArray_BSI[(Pred(Index) * 2) + ARandomPreRounds + 1] := Pred(High(TByte_BSI_USDoD)) - NumberArray[Pred(Index)];
        end
        else
        begin
          AResultArray_BSI[(Pred(Index) * 2) + ARandomPreRounds + 0] := Pred(High(TByte_BSI_USDoD)) - NumberArray[Pred(Index)];
          AResultArray_BSI[(Pred(Index) * 2) + ARandomPreRounds + 1] := NumberArray[Pred(Index)];
        end;
      end;
    end;
  end;

var
  DynamicByteArray : TDeleteFileDynamicByteArray;
begin
  GetRandomRounds(ARandomPreRounds, ARandomPostRounds, ADefinedRounds, DynamicByteArray);
  Result := DeleteFile_All(AFileName, DynamicByteArray, GetBufferArray_BSI_USDoD, AProgressEvent, AProgressObjectEvent);
end;

{
Method after:

  "
   Peter Gutmann

   Department of Computer Science
   University of Auckland
   - USA -
  "

  in

  "
   Secure Deletion of Data from
   Magnetic and Solid-State Memory
  "

  published in

  "
   the Sixth USENIX Security
   Symposium Proceedings,
   San Jose,
   California,
   July 22-25, 1996
  "
}
function DeleteFile_DoCSUoA(const AFileName : String; const ARandomPreRounds : LongWord; const ARandomPostRounds : LongWord; const ANewFileName : String; const AProgressEvent : TProgressEvent; const AProgressObjectEvent : TProgressObjectEvent) : Boolean;
  procedure GetRandomRounds(const ARandomPreRounds : LongWord; const ARandomPostRounds : LongWord; var AResultArray_DoCSUoA : TDeleteFileDynamicByteArray);
  var
    Index       : LongInt;
    NextNumber  : TByte_DoCSUoA;
    NumberArray : TStatic_Byte_DoCSUoA_Array;
    NumberSet   : TByte_DoCSUoA_Set;
  begin
    NumberSet := [];
    for Index := Succ(Low(TByte_DoCSUoA)) to High(TByte_DoCSUoA) do
    begin
      NumberArray[Index] := 0;

      repeat
        NextNumber := Succ(Random(High(TByte_DoCSUoA)));
      until not(NextNumber in NumberSet);

      NumberArray[Index] := NextNumber;
      NumberSet          := NumberSet + [NextNumber];
    end;

    SetLength(AResultArray_DoCSUoA, High(TByte_DoCSUoA) + ARandomPreRounds + ARandomPostRounds);

    if (ARandomPreRounds > 0) then
    begin
      for Index := 0 to Pred(ARandomPreRounds) do
        AResultArray_DoCSUoA[Index] := 0;
    end;

    if (ARandomPostRounds > 0) then
    begin
      for Index := 0 to Pred(ARandomPostRounds) do
        AResultArray_DoCSUoA[High(AResultArray_DoCSUoA) - Index] := 0;
    end;

    for Index := Succ(Low(TByte_DoCSUoA)) to High(TByte_DoCSUoA) do
      AResultArray_DoCSUoA[Pred(Index) + ARandomPreRounds] := NumberArray[Index];
  end;

var
  DynamicByteArray : TDeleteFileDynamicByteArray;
begin
  GetRandomRounds(ARandomPreRounds, ARandomPostRounds, DynamicByteArray);
  Result := DeleteFile_All(AFileName, DynamicByteArray, GetBufferArray_DoCSUoA, AProgressEvent, AProgressObjectEvent);
end;

{
Method after:

  "
   United States Department of Defense
   - USA -
  "

  in

  "
   Chapter 8. Automated Information System Security
   Section 3. Controls and Maintenance
       8-306. Maintenance (Clearing and Sanitization Matrix)
  "

  published in

  "
   National Industrial Security Program Operating Manual (NISPOM)
   [US DoD 5220.22-M] (January 1995)
  "
}
function DeleteFile_USDoD(const AFileName : String; const ARandomPreRounds : LongWord; const ARandomPostRounds : LongWord; const ADefinedRounds : LongWord; const ANewFileName : String; const AProgressEvent : TProgressEvent; const AProgressObjectEvent : TProgressObjectEvent) : Boolean;
  procedure GetRandomRounds(const ARandomPreRounds : LongWord; const ARandomPostRounds : LongWord; const ADefinedRounds : LongWord; var AResultArray_USDoD : TDeleteFileDynamicByteArray);
  var
    Index       : LongInt;
    NextNumber  : TRange_BSI_USDoD;
    NumberArray : TDynamic_Range_BSI_USDoD_Array;
    NumberSet   : TRange_BSI_USDoD_Set;
  begin
    SetLength(NumberArray, ADefinedRounds * 3);
    NumberSet := [];
    if (Length(NumberArray) > 0) then
    begin
      for Index := Low(NumberArray) to High(NumberArray) do
      begin
        NumberArray[Index] := 0;

        repeat
          NextNumber := Random(Succ(High(TRange_BSI_USDoD)));
        until not(NextNumber in NumberSet);

        NumberArray[Index] := NextNumber;

        if ((Index - Low(NumberArray)) >= Pred(High(TRange_BSI_USDoD))) then
          NumberSet := []
        else
          NumberSet := NumberSet + [NextNumber];
      end;
    end;

    SetLength(AResultArray_USDoD, (ADefinedRounds * 7) + ARandomPreRounds + ARandomPostRounds);

    if (ARandomPreRounds > 0) then
    begin
      for Index := 0 to Pred(ARandomPreRounds) do
        AResultArray_USDoD[Index] := 256;
    end;

    if (ARandomPostRounds > 0) then
    begin
      for Index := 0 to Pred(ARandomPostRounds) do
        AResultArray_USDoD[High(AResultArray_USDoD) - Index] := 256;
    end;

    if (ADefinedRounds > 0) then
    begin
      for Index := 1 to ADefinedRounds do
      begin
        AResultArray_USDoD[(Pred(Index) * 7) + ARandomPreRounds + 0] := NumberArray[(Pred(Index) * 3) + 0];

        if (Random(2) = 0) then
        begin
          AResultArray_USDoD[(Pred(Index) * 7) + ARandomPreRounds + 1] := NumberArray[(Pred(Index) * 3) + 1];
          AResultArray_USDoD[(Pred(Index) * 7) + ARandomPreRounds + 2] := Pred(High(TByte_BSI_USDoD)) - NumberArray[(Pred(Index) * 3) + 1];
        end
        else
        begin
          AResultArray_USDoD[(Pred(Index) * 7) + ARandomPreRounds + 1] := Pred(High(TByte_BSI_USDoD)) - NumberArray[(Pred(Index) * 3) + 1];
          AResultArray_USDoD[(Pred(Index) * 7) + ARandomPreRounds + 2] := NumberArray[(Pred(Index) * 3) + 1];
        end;

        AResultArray_USDoD[(Pred(Index) * 7) + ARandomPreRounds + 3] := NumberArray[(Pred(Index) * 3) + 2];
        AResultArray_USDoD[(Pred(Index) * 7) + ARandomPreRounds + 4] := 256;
        AResultArray_USDoD[(Pred(Index) * 7) + ARandomPreRounds + 5] := 0;
        AResultArray_USDoD[(Pred(Index) * 7) + ARandomPreRounds + 6] := 255;
      end;
    end;
  end;

var
  DynamicByteArray : TDeleteFileDynamicByteArray;
begin
  GetRandomRounds(ARandomPreRounds, ARandomPostRounds, ADefinedRounds, DynamicByteArray);
  Result := DeleteFile_All(AFileName, DynamicByteArray, GetBufferArray_BSI_USDoD, AProgressEvent, AProgressObjectEvent);
end;

procedure GetBufferArray_BSI_USDoD(const ABufferValue : TDeleteFileDynamicByte; var ABufferArray : TDeleteFileByteArray);
var
  Index : LongInt;
begin
  if ((ABufferValue < Low(TByte_BSI_USDoD)) or (ABufferValue >= High(TByte_BSI_USDoD))) then
  begin
    for Index := 1 to Abs(CBufferCount) do
      ABufferArray[Index] := Random(Succ(High(Byte)));
  end
  else
  begin
    for Index := 1 to Abs(CBufferCount) do
      ABufferArray[Index] := ABufferValue;
  end;
end;

procedure GetBufferArray_DoCSUoA(const ABufferValue : TDeleteFileDynamicByte; var ABufferArray : TDeleteFileByteArray);
const
  CBufferArray : TStatic_String_DoCSUoA_Array = (#$55,
                                                 #$AA,
                                                 #$92#$49#$24,
                                                 #$49#$24#$92,
                                                 #$24#$92#$49,
                                                 #$00,
                                                 #$11,
                                                 #$22,
                                                 #$33,
                                                 #$44,
                                                 #$55,
                                                 #$66,
                                                 #$77,
                                                 #$88,
                                                 #$99,
                                                 #$AA,
                                                 #$BB,
                                                 #$CC,
                                                 #$DD,
                                                 #$EE,
                                                 #$FF,
                                                 #$92#$49#$24,
                                                 #$49#$24#$92,
                                                 #$24#$92#$49,
                                                 #$6D#$B6#$DB,
                                                 #$B6#$DB#$6D,
                                                 #$DB#$6D#$B6);
var
  BufferLength : LongInt;
  Index        : LongInt;
  TextIndex    : LongInt;
begin
  if ((ABufferValue <= Low(TByte_DoCSUoA)) or (ABufferValue > High(TByte_DoCSUoA))) then
  begin
    for Index := 1 to Abs(CBufferCount) do
      ABufferArray[Index] := Random(Succ(High(Byte)));
  end
  else
  begin
    BufferLength := Length(CBufferArray[ABufferValue]);

    for Index := 0 to Pred(Abs(CBufferCount) div BufferLength) do
    begin
      for TextIndex := 1 to BufferLength do
        ABufferArray[(Index * BufferLength) + TextIndex] := Ord(CBufferArray[ABufferValue][TextIndex]);
    end;
  end;
end;

initialization
begin
  Randomize;
end;

end.
