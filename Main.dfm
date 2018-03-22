object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmMain'
  ClientHeight = 509
  ClientWidth = 863
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
  object sbMessages: TStatusBar
    AlignWithMargins = True
    Left = 3
    Top = 487
    Width = 857
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 435
    Width = 857
    Height = 46
    Align = alBottom
    TabOrder = 1
    object btnClose: TButton
      Left = 665
      Top = 8
      Width = 120
      Height = 25
      Caption = 'Close'
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object Button1: TButton
      Left = 37
      Top = 8
      Width = 120
      Height = 25
      Caption = 'Create New Holiday'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 264
      Top = 8
      Width = 120
      Height = 25
      Caption = 'Report'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 857
    Height = 41
    Align = alTop
    Caption = 'Holiday Database'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 857
    Height = 105
    Align = alTop
    Caption = 'Double Click To Select User:'
    TabOrder = 3
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 847
      Height = 82
      Align = alClient
      DataSource = dmHols.dsGetEntitlement
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Surname'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FirstName'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TotalAvailableHours'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Christmas'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AvailableHours'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LessChristmas'
          Width = 110
          Visible = True
        end>
    end
  end
  object gbBookedHoliday: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 161
    Width = 857
    Height = 268
    Align = alClient
    Caption = 'Booked Holiday'
    TabOrder = 4
    object DBGrid2: TDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 847
      Height = 245
      Align = alClient
      DataSource = dmHols.dsGetBookedHoliday
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DateFrom'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DateTo'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HolidayHours'
          Width = 110
          Visible = True
        end>
    end
  end
end
