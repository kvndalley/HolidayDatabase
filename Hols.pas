unit Hols;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, frxClass, frxDBSet,
  frxExportPDF;

type
  TdmHols = class(TDataModule)
    ADOConHols: TADOConnection;
    qryShowUserEntitlement: TADOQuery;
    dsGetEntitlement: TDataSource;
    dsGetBookedHoliday: TDataSource;
    aspInsertNewHolidayHours: TADOStoredProc;
    aspUpdateHolidayEntitlement: TADOStoredProc;
    frxHolidayReport: TfrxReport;
    frxDBShowUserEntitlement: TfrxDBDataset;
    frxDBGetBookedHoliday: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    qryGetBookedHoliday: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmHols: TdmHols;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

end.
