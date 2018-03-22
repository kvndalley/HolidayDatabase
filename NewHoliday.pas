unit NewHoliday;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Hols;

type
  TfrmNewHoliday = class(TForm)
    Panel2: TPanel;
    btnClose: TButton;
    Panel1: TPanel;
    dtpFrom: TDateTimePicker;
    dtpTo: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    edtNoHours: TLabeledEdit;
    btnSave: TButton;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure Initialise;
    procedure btnSaveClick(Sender: TObject);
    function CheckDataFields: boolean;
    procedure dtpFromChange(Sender: TObject);
    procedure dtpToChange(Sender: TObject);
    procedure UpdateEntitlement;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    DateFrom, DateTo: TDate;
    HolidayHours, UpdatedAvailableHours, UpdatedLessChristmas: Currency;
  public
    { Public declarations }
  end;

var
  frmNewHoliday: TfrmNewHoliday;

implementation

{$R *.dfm}

uses Main;

procedure TfrmNewHoliday.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmNewHoliday.btnSaveClick(Sender: TObject);
begin
  HolidayHours := -1;
  HolidayHours := StrToFloat(edtNoHours.Text);

  if DateTo < DateFrom then
  begin
    MessageDlg('Invalid Date Selection', mtError, [mbOK], 0, mbOK);
    Initialise;
    Exit;
  end;

  if CheckDataFields = True then
  begin
    try
      dmHols.ADOConHols.BeginTrans;
      dmHols.aspInsertNewHolidayHours.Parameters.ParamByName('@TableID').Value :=
        frmMain.TableID;
      dmHols.aspInsertNewHolidayHours.Parameters.ParamByName('@UserID').Value :=
        frmMain.UserID;
      dmHols.aspInsertNewHolidayHours.Parameters.ParamByName('@DateFrom').Value
        := DateFrom;
      dmHols.aspInsertNewHolidayHours.Parameters.ParamByName('@DateTo').Value
        := DateTo;
      dmHols.aspInsertNewHolidayHours.Parameters.ParamByName('@HolidayHours')
        .Value := HolidayHours;
      UpdateEntitlement;
      dmHols.aspInsertNewHolidayHours.ExecProc;
      dmHols.ADOConHols.CommitTrans;
      MessageDlg('Database update successful', mtInformation, [mbOK], 0, mbOK);
      dmHols.qryGetBookedHoliday.Active := False;
      dmHols.qryGetBookedHoliday.Active := True;
    except
      on E: Exception do
      begin
        MessageDlg('Failed To Update Database', mtError, [mbOK], 0, mbOK);
        dmHols.ADOConHols.RollbackTrans;
        Initialise;
      end;
    end;
    Initialise;
  end;
  Close;
end;

procedure TfrmNewHoliday.UpdateEntitlement;
begin
  UpdatedAvailableHours := -1;
  UpdatedLessChristmas := -1;

  dmHols.qryShowUserEntitlement.Active := False;
  dmHols.qryShowUserEntitlement.Active := True;

  frmMain.AvailableHours := dmHols.qryShowUserEntitlement.FieldByName
    ('AvailableHours').Value;
  frmMain.LessChristmas := dmHols.qryShowUserEntitlement.FieldByName
    ('LessChristmas').Value;

  UpdatedAvailableHours := frmMain.AvailableHours - HolidayHours;
  UpdatedLessChristmas := frmMain.LessChristmas - HolidayHours;

  dmHols.aspUpdateHolidayEntitlement.Parameters.ParamByName
    ('@UpdatedAvailableHours').Value := UpdatedAvailableHours;
  dmHols.aspUpdateHolidayEntitlement.Parameters.ParamByName
    ('@UpdatedLessChristmas').Value := UpdatedLessChristmas;
  dmHols.aspUpdateHolidayEntitlement.Parameters.ParamByName('@UserID').Value :=
    frmMain.UserID;
  dmHols.aspUpdateHolidayEntitlement.ExecProc;
  dmHols.qryShowUserEntitlement.Active := False;
  dmHols.qryShowUserEntitlement.Active := True;
end;

procedure TfrmNewHoliday.Initialise;
begin
  DateFrom := Now;
  DateTo := Now;
  dtpFrom.Date := Now;
  dtpTo.Date := Now;
  HolidayHours := -1;
  edtDateFrom.Clear;
  edtDateTo.Clear;
  edtNoHours.Clear;
end;

function TfrmNewHoliday.CheckDataFields: boolean;
begin
  Result := False;

  if edtDateFrom.Text = '' then
  begin
    MessageDlg('You have not entered any Hours.', mtWarning, [mbOK], 0, mbOK);
    edtDateFrom.SetFocus;
    Exit;
  end;

  if edtDateTo.Text = '' then
  begin
    MessageDlg('You have not entered any Hours.', mtWarning, [mbOK], 0, mbOK);
    edtDateTo.SetFocus;
    Exit;
  end;

  if edtNoHours.Text = '' then
  begin
    MessageDlg('You have not entered any Hours.', mtWarning, [mbOK], 0, mbOK);
    edtNoHours.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TfrmNewHoliday.dtpFromChange(Sender: TObject);
begin
  DateFrom := dtpFrom.Date;
  edtDateFrom.Text := DateToStr(DateFrom);
end;

procedure TfrmNewHoliday.dtpToChange(Sender: TObject);
begin
  DateTo := dtpTo.Date;
  edtDateTo.Text := DateToStr(DateTo);
end;

procedure TfrmNewHoliday.FormShow(Sender: TObject);
begin
  Initialise;
end;

end.
