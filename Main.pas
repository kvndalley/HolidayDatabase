unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Hols, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmMain = class(TForm)
    sbMessages: TStatusBar;
    Panel2: TPanel;
    btnClose: TButton;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    gbBookedHoliday: TGroupBox;
    DBGrid2: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    procedure btnCloseClick(Sender: TObject);
    function isValidWindowsLogin: Boolean;
    function GetVersion(sFileName: string): string;
    procedure FormShow(Sender: TObject);
    procedure Initialise;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    UserName: string;
    UserID, TableID: integer;
    AvailableHours, LessChristmas: Currency;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses NewHoliday;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

function TfrmMain.isValidWindowsLogin: Boolean;
var
  UserNameLen: Dword;
  rtvUser: string;
  rtvUserID: integer;
begin
  UserNameLen := 255;
  SetLength(UserName, UserNameLen);
  if GetUserName(PChar(UserName), UserNameLen) Then
    rtvUser := Copy(UserName, 1, UserNameLen - 1)
  else
    rtvUser := 'Unknown';
  UserName := rtvUser;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  if UserID = -1 then
  begin
    MessageDlg('You have not selected a valid User.', mtError,
      [mbOK], 0, mbOK);
    Exit;
  end;
  frmNewHoliday.ShowModal;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  dmHols.frxHolidayReport.ShowReport();
end;

procedure TfrmMain.DBGrid1DblClick(Sender: TObject);
begin
  dmHols.qryGetBookedHoliday.Active := False;
  UserID := dmHols.qryShowUserEntitlement.FieldByName('UserID').Value;
  AvailableHours := dmHols.qryShowUserEntitlement.FieldByName
    ('AvailableHours').Value;
  LessChristmas := dmHols.qryShowUserEntitlement.FieldByName
    ('LessChristmas').Value;
  TableID := dmHols.qryShowUserEntitlement.FieldByName
    ('TableID').Value;
  dmHols.qryGetBookedHoliday.Parameters.ParamByName('UserID').Value := UserID;
  dmHols.qryGetBookedHoliday.ExecSQL;
  dmHols.qryGetBookedHoliday.Active := True;
  gbBookedHoliday.Visible := True;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  isValidWindowsLogin;
  sbMessages.SimpleText := 'User Name: ' + UserName;
  frmMain.Caption := 'Holiday Database V' +
    (GetVersion(GetCurrentDir + '\Holiday.exe') + ' - Main');
  Initialise;
end;

function TfrmMain.GetVersion(sFileName: string): string;
var
  VerInfoSize: Dword;
  VerInfo: Pointer;
  VerValueSize: Dword;
  VerValue: PVSFixedFileInfo;
  Dummy: Dword;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(sFileName), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(sFileName), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

procedure TfrmMain.Initialise;
begin
  dmHols.qryShowUserEntitlement.Active := False;
  dmHols.qryShowUserEntitlement.Active := True;
  gbBookedHoliday.Visible := False;
  UserID := -1;
end;

end.
