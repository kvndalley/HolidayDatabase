program Holiday;

{$R *.dres}

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  Hols in 'Hols.pas' {dmHols: TDataModule},
  NewHoliday in 'NewHoliday.pas' {frmNewHoliday},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Amakrits');
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmHols, dmHols);
  Application.CreateForm(TfrmNewHoliday, frmNewHoliday);
  Application.Run;

end.
