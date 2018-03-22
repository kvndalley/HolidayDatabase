object frmNewHoliday: TfrmNewHoliday
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Holiday - New Holiday'
  ClientHeight = 509
  ClientWidth = 873
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 450
    Width = 867
    Height = 56
    Align = alBottom
    TabOrder = 0
    object btnClose: TButton
      Left = 665
      Top = 16
      Width = 120
      Height = 25
      Caption = 'Close'
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object btnSave: TButton
      Left = 88
      Top = 16
      Width = 120
      Height = 25
      Caption = 'Save'
      TabOrder = 1
      OnClick = btnSaveClick
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 867
    Height = 441
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 88
      Top = 77
      Width = 54
      Height = 13
      Caption = 'Date From:'
    end
    object Label2: TLabel
      Left = 359
      Top = 77
      Width = 42
      Height = 13
      Caption = 'Date To:'
    end
    object dtpFrom: TDateTimePicker
      Left = 88
      Top = 96
      Width = 186
      Height = 21
      Date = 43088.598820127320000000
      Time = 43088.598820127320000000
      TabOrder = 0
      OnChange = dtpFromChange
    end
    object dtpTo: TDateTimePicker
      Left = 359
      Top = 96
      Width = 186
      Height = 21
      Date = 43088.598820127320000000
      Time = 43088.598820127320000000
      TabOrder = 1
      OnChange = dtpToChange
    end
    object edtNoHours: TLabeledEdit
      Left = 664
      Top = 96
      Width = 121
      Height = 21
      EditLabel.Width = 85
      EditLabel.Height = 13
      EditLabel.Caption = 'Number of Hours:'
      TabOrder = 2
    end
    object edtDateFrom: TEdit
      Left = 88
      Top = 123
      Width = 186
      Height = 21
      TabOrder = 3
    end
    object edtDateTo: TEdit
      Left = 359
      Top = 123
      Width = 186
      Height = 21
      TabOrder = 4
    end
  end
end
