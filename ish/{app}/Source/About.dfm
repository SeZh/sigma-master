object FAbout: TFAbout
  Left = 523
  Top = 153
  Width = 473
  Height = 531
  Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' '
  Color = clBtnFace
  Constraints.MinHeight = 506
  Constraints.MinWidth = 473
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    457
    492)
  PixelsPerInch = 96
  TextHeight = 13
  object ver: TLabel
    Left = 252
    Top = -2
    Width = 157
    Height = 48
    AutoSize = False
    Caption = '7.4'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -37
    Font.Name = 'Georgia'
    Font.Style = [fsItalic]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 123
    Top = -3
    Width = 121
    Height = 44
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Sigma'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -37
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    Transparent = True
  end
  object Version: TLabel
    Left = 10
    Top = 50
    Width = 430
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = #1042#1077#1088#1089#1080#1103' '#1086#1090' 31.05.2019'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 166
    Top = 467
    Width = 250
    Height = 22
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 'www.mai6.ru; stolyarchukva609@mail.ru'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 16
    Top = 56
    Width = 88
    Height = 13
    Caption = #1050#1040#1060#1045#1044#1056#1040' 609'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 40
    Top = 32
    Width = 39
    Height = 20
    Caption = #1052#1040#1048
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 160
    Top = 80
    Width = 131
    Height = 16
    Caption = #1059#1095#1077#1073#1085#1072#1103' '#1089#1080#1089#1090#1077#1084#1072' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 112
    Top = 96
    Width = 232
    Height = 16
    Caption = #1082#1086#1085#1077#1095#1085#1086'-'#1101#1083#1077#1084#1077#1085#1090#1085#1086#1075#1086' '#1072#1085#1072#1083#1080#1079#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    Transparent = True
  end
  object Button1: TButton
    Left = 16
    Top = 460
    Width = 81
    Height = 24
    Anchors = [akLeft, akBottom]
    BiDiMode = bdLeftToRight
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
    OnKeyDown = FormKeyDown
  end
  object redt1: TRichEdit
    Left = 17
    Top = 125
    Width = 428
    Height = 330
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      #1048#1089#1093#1086#1076#1085#1099#1081' '#1088#1072#1089#1095#1077#1090#1085#1099#1081' '#1084#1086#1076#1091#1083#1100' '#1088#1072#1079#1088#1072#1073#1086#1090#1072#1085' '#1056#1091#1089#1077#1094#1082#1080#1084' '#1042'.'#1040'. ('#1082#1072#1092'. 603).'
      #1052#1086#1076#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085' '#1057#1090#1086#1083#1103#1088#1095#1091#1082#1086#1084' '#1042'.'#1040'. ('#1082#1072#1092'. 609)'
      #1056#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082#1080' '#1089#1080#1089#1090#1077#1084#1099' '#8211' '#1089#1090#1091#1076#1077#1085#1090#1099' '#1082#1072#1092#1077#1076#1088#1099' 609. '
      
        #1061#1074#1077#1089#1102#1082' '#1040'. '#1042'. '#8211' '#1074#1099#1087#1091#1089#1082#1085#1080#1082' 1997 '#1075#1086#1076#1072' ('#1087#1077#1088#1077#1074#1086#1076' '#1089#1080#1089#1090#1077#1084#1099' '#1089' '#1045#1057' '#1069#1042#1052' '#1085#1072' ' +
        #1056#1057' '#1087#1086#1076' '
      #1091#1087#1088#1072#1074#1083#1077#1085#1080#1077#1084'  DOS)'
      
        #1064#1091#1073#1080#1085' '#1057'. '#1040'. '#8211' '#1074#1099#1087#1091#1089#1082#1085#1080#1082' 1998 '#1075#1086#1076#1072' ('#1087#1077#1088#1074#1099#1081' '#1074#1072#1088#1080#1072#1085#1090' '#1089#1080#1089#1090#1077#1084#1099' Sigma3' +
        '2 '#1087#1086#1076' '
      'Windows).'
      
        #1056#1072#1079#1072#1088#1077#1085#1086#1074' '#1060'.'#1057'. '#8211' '#1074#1099#1087#1091#1089#1082#1085#1080#1082' 2001 '#1075#1086#1076#1072' ('#1085#1086#1074#1099#1081' '#1080#1085#1090#1077#1088#1092#1077#1081#1089', '#1075#1088#1072#1092#1080#1095#1077#1089#1082 +
        #1080#1081' '
      #1088#1077#1076#1072#1082#1090#1086#1088' '#1080' '#1082#1086#1085#1074#1077#1088#1090#1086#1088' '#1074#1093#1086#1076#1085#1099#1093' '#1076#1072#1085#1085#1099#1093' '#1074' '#1092#1086#1088#1084#1072#1090' Msc NASTRAN 70)'
      
        #1050#1086#1087#1099#1083#1086#1074' '#1040'.'#1040'. '#8211' '#1074#1099#1087#1091#1089#1082#1085#1080#1082' 2002 '#1075#1086#1076#1072' ('#1080#1079#1084#1077#1085#1080#1083' '#1082#1086#1085#1094#1077#1087#1094#1080#1102' '#1080#1085#1090#1077#1088#1092#1077#1081#1089#1072 +
        ' '
      #1089#1080#1089#1090#1077#1084#1099', '#1088#1072#1079#1088#1072#1073#1086#1090#1072#1083' '#1085#1086#1074#1099#1081' '#1075#1088#1072#1092#1080#1095#1077#1089#1082#1080#1081' '#1088#1077#1076#1072#1082#1090#1086#1088')  '
      #1050#1086#1088#1086#1074#1091#1096#1082#1080#1085' '#1044'.'#1042'., '#1061#1072#1089#1072#1077#1074' '#1040'.'#1053'., '#1057#1086#1083#1086#1074#1100#1077#1074' '#1052'.'#1057'., '#1043#1077#1083#1100#1084#1072#1085' '#1042'.'#1043'. '#8211' '
      #1074#1099#1087#1091#1089#1082#1085#1080#1082#1080' 2000 '#1075#1086#1076#1072', '
      #1047#1072#1093#1072#1088#1086#1074' '#1042'.'#1056'., '#1057#1086#1083#1086#1074#1100#1077#1074' '#1042'.'#1057', '#1041#1083#1080#1085#1086#1074' '#1044'.'#1042'. '#8211' '#1074#1099#1087#1091#1089#1082#1085#1080#1082#1080' 2001 '#1075#1086#1076#1072' '
      
        #1041#1086#1075#1086#1084#1086#1083#1100#1085#1099#1081' '#1040'.'#1052'., '#1057#1077#1083#1103#1085#1086#1074#1072' '#1048'.'#1040'., '#1057#1077#1088#1075#1077#1077#1074' '#1040'.'#1057'. '#8211' '#1074#1099#1087#1091#1089#1082#1085#1080#1082#1080' 2002 ' +
        #1075#1086#1076#1072
      '2003 '#1075#1086#1076
      #1089#1090#1091#1076#1077#1085#1090#1099' '#1075#1088#1091#1087#1087' 06-421, 06-422:'
      #1055#1077#1090#1088#1086#1095#1077#1085#1082#1086#1074' '#1052'.'#1040'. - '#1084#1077#1090#1086#1076#1099' '#1088#1072#1089#1095#1077#1090#1072' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1103' '#1074' '#1090#1086#1095#1082#1077
      #1041#1086#1083#1082#1080#1089#1077#1074' '#1040'.'#1042'. - '#1084#1086#1076#1091#1083#1100' '#1087#1086#1089#1090#1088#1086#1077#1085#1080#1103' '#1075#1088#1072#1092#1080#1082#1086#1074' '#1089#1093#1086#1076#1080#1084#1086#1089#1090#1080
      #1055#1072#1082' '#1043'.'#1054'. - '#1084#1086#1076#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085' '#1084#1086#1076#1091#1083#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1087#1083#1072#1089#1090#1080#1085#1099
      #1063#1091#1073#1088#1080#1082' '#1040'.'#1040'. - '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081' '#1074' '#1090#1086#1095#1082#1077
      #1050#1086#1088#1086#1087#1077#1094' '#1040'.'#1054'. - '#1085#1086#1074#1099#1081' '#1088#1077#1076#1072#1082#1090#1086#1088' '#1092#1086#1088#1090#1088#1072#1085#1086#1074#1089#1082#1080#1093' '#1084#1086#1076#1091#1083#1077#1081
      #1053#1086#1089#1086#1074#1072' '#1054'.'#1042'. - '#1088#1091#1082#1086#1074#1086#1076#1089#1090#1074#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      '2004 '#1075#1086#1076
      #1089#1090#1091#1076#1077#1085#1090#1099' '#1075#1088#1091#1087#1087' 06-421, 06-422:'
      #1040#1083#1072#1077#1074' '#1044'.'#1057'. - '#1076#1086#1088#1072#1073#1086#1090#1082#1072' '#1101#1082#1089#1087#1086#1088#1090#1072' '#1074' Nastran, '#1101#1082#1089#1087#1086#1088#1090' '#1074' XML'
      #1061#1072#1076#1080#1077#1074' '#1048'.'#1043'. - '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1086#1073#1088#1072#1090#1085#1086#1075#1086' '#1091#1087#1086#1088#1103#1076#1086#1095#1077#1085#1080#1103' '#1050#1072#1090#1093#1080#1083#1083#1072'-'#1052#1072#1082#1082#1080
      #1057#1090#1077#1082#1086#1083#1100#1085#1080#1082#1086#1074' '#1057'.'#1042'. - '#1083#1080#1085#1080#1080' '#1091#1088#1086#1074#1085#1103' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1081
      #1052#1080#1079#1086#1074' '#1056'.'#1040'. - '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1081', '#1087#1088#1077#1074#1099#1096#1072#1102#1097#1080#1093' '#1076#1086#1087#1091#1089#1082#1072#1077#1084#1099#1077
      '2003-2005 '#1075#1086#1076
      #1089#1090#1091#1076#1077#1085#1090' '#1075#1088#1091#1087#1087' 06-422,06-522,06-622 '#1062#1074#1077#1090#1072#1077#1074' '#1041'.'#1052'.:'
      #1041#1086#1083#1100#1096#1080#1077' '#1089#1080#1089#1090#1077#1084#1085#1099#1077' '#1076#1086#1088#1072#1073#1086#1090#1082#1080', '#1074#1085#1077#1089#1077#1085#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1081' '#1074' '#1080#1085#1090#1077#1088#1092#1077#1081#1089' '#1080' '
      
        #1086#1090#1076#1077#1083#1100#1085#1099#1077' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099', '#1089#1086#1079#1076#1072#1085#1080#1077' '#1074#1077#1088#1089#1080#1081' '#1082#1086#1084#1087#1083#1077#1082#1089#1072' 4.2, 4.5, 4.7, 4' +
        '.8.'
      #1086#1090#1076#1077#1083#1100#1085#1091#1102' '#1076#1080#1088#1077#1082#1090#1086#1088#1080#1102', '#1076#1086#1088#1072#1073#1086#1090#1082#1072' '#1080#1085#1090#1077#1088#1092#1077#1081#1089#1072' '#1087#1088#1086#1089#1084#1086#1090#1088#1072' '
      #1075#1088#1072#1092#1080#1082#1086#1074' '#1089#1093#1086#1076#1080#1084#1086#1089#1090#1080', '#1076#1086#1088#1072#1073#1086#1090#1082#1072' '#1086#1089#1085#1086#1074#1085#1086#1075#1086' '#1084#1077#1085#1102' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103', '
      #1101#1082#1089#1087#1086#1088#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1074' MS Word, '#1089#1086#1079#1076#1072#1085#1080#1077' '#1074#1077#1088#1089#1080#1080' '#1082#1086#1084#1087#1083#1077#1082#1089#1072' 4.5,'
      #1088#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1101#1082#1074#1080#1074#1072#1083#1077#1085#1090#1085#1086#1075#1086' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1103', '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1087#1072#1085#1077#1083#1080
      #1087#1088#1086#1089#1084#1086#1090#1088#1072' '#1075#1088#1072#1092#1080#1095#1077#1089#1082#1080#1093' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074', '#1089#1086#1079#1076#1072#1085#1080#1077' '#1074#1077#1088#1089#1080#1080' 4.7.'
      '2006 '#1075#1086#1076
      #1089#1090#1091#1076#1077#1085#1090#1099' '#1075#1088#1091#1087#1099' 06-622:'
      #1064#1077#1074#1095#1077#1085#1082#1086' '#1058'.'#1051'. - '#1089#1086#1079#1076#1072#1085#1080#1077' '#1101#1082#1089#1087#1086#1088#1090#1072' '#1074' AnSys, '#1085#1086#1074#1086#1075#1086' '#1088#1077#1076#1072#1082#1090#1086#1088#1072', '
      #1087#1086#1076#1089#1080#1089#1090#1077#1084#1099' '#1089#1093#1086#1076#1080#1084#1086#1089#1090#1080' '#1080' '#1074#1077#1088#1089#1080#1080' 4.9.'
      #1089#1090#1091#1076#1077#1085#1090#1099' '#1075#1088#1091#1087#1087' 06-421,06-422: '
      #1057#1077#1088#1077#1073#1088#1103#1082#1086#1074' '#1044'.'#1057'., '#1044#1080#1073#1088#1086#1074' '#1056'.'#1040'.,'#1048#1084#1072#1084#1077#1090#1076#1080#1085#1086#1074' '#1056'.'#1048'.'#1041#1086#1082#1086#1074' '#1055'.'#1070'.:'
      #1048#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1080' '#1076#1086#1088#1072#1073#1086#1090#1082#1072' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099' '#1087#1086#1089#1090#1088#1086#1077#1085#1080#1103' '
      #1075#1088#1072#1092#1080#1082#1086#1074' '#1089#1093#1086#1076#1080#1084#1086#1089#1090#1080', '#1075#1088#1072#1092#1080#1095#1077#1089#1082#1086#1075#1086' '#1084#1086#1076#1091#1083#1103' '#1086#1073#1088#1072#1073#1086#1090#1082#1080' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074
      #1088#1072#1089#1095#1077#1090#1072', '#1101#1082#1089#1087#1086#1088#1090#1072' '#1074' Nastran, '#1084#1086#1076#1091#1083#1103' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1092#1086#1088#1084
      #1080' '#1089#1080#1089#1090#1077#1084#1099' '#1074' '#1094#1077#1083#1086#1084'.'
      #1076#1080#1087#1083#1086#1084#1085#1080#1082' '#1050#1086#1090#1086#1074' '#1044'.'#1044'.:'
      #1057#1086#1079#1076#1072#1085#1080#1077' '#1074#1077#1088#1089#1080#1080' 5.0 - '#1089' '#1075#1080#1073#1082#1080#1084' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077#1084' '#1088#1072#1089#1095#1105#1090#1085#1086#1075#1086' '#1073#1083#1086#1082#1072'.'
      '2007 '#1075#1086#1076
      #1089#1090#1091#1076#1077#1085#1090#1099' '#1075#1088#1091#1087#1087#1099' 06-521: '
      #1048#1084#1072#1084#1077#1090#1076#1080#1085#1086#1074' '#1056'.'#1048'., '#1041#1086#1082#1086#1074' '#1055'.'#1070'. '
      #1055#1077#1088#1077#1085#1086#1089' '#1086#1089#1085#1086#1074#1085#1099#1093' '#1080#1079#1084#1077#1085#1077#1085#1080#1081' '#1074' '#1074#1077#1088#1089#1080#1102' 5.0'
      '2008 '#1075#1086#1076
      #1076#1080#1087#1083#1086#1084#1085#1080#1082' '#1041#1086#1082#1086#1074' '#1055'.'#1070'.:'
      #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1072#1083#1075#1086#1088#1080#1090#1084#1072' '#1056#1072#1087#1077#1088#1090#1072
      #1076#1080#1087#1083#1086#1084#1085#1080#1082' '#1048#1084#1072#1084#1077#1090#1076#1080#1085#1086#1074' '#1056'.'#1048'.:'
      #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1084#1077#1090#1086#1076#1072' '#1089#1090#1072#1090#1080#1089#1090#1080#1095#1077#1089#1082#1080#1093' '#1080#1089#1087#1099#1090#1072#1085#1080#1081'.'
      '2009 '#1075#1086#1076
      #1076#1080#1087#1083#1086#1084#1085#1080#1082' '#1055#1083#1086#1090#1085#1080#1082#1086#1074' '#1044'.'#1042'.:'
      #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1072#1083#1075#1086#1088#1080#1090#1084#1072' '#1084#1080#1085#1080#1084#1072#1083#1100#1085#1086#1081' '#1089#1090#1077#1087#1077#1085#1080'.'
      #1076#1080#1087#1083#1086#1084#1085#1080#1082' '#1057#1072#1079#1086#1085#1086#1074' '#1040'.'#1042'.:'
      #1048#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1080' '#1076#1086#1088#1072#1073#1086#1090#1082#1072' '#1080#1085#1090#1077#1088#1092#1077#1081#1089#1072'.'
      '2010 '#1075#1086#1076
      #1089#1090#1091#1076#1077#1085#1090' '#1052#1086#1083#1086#1082#1086#1074' '#1040'.'#1054'.:'
      #1043#1083#1091#1073#1086#1082#1072#1103' '#1087#1077#1088#1077#1088#1072#1073#1086#1090#1082#1072' '#1089#1080#1089#1090#1077#1084#1099'. '#1057#1086#1079#1076#1072#1085#1080#1077' '#1074#1077#1088#1089#1080#1080' Sigma 6.0h.'
      '2011 '#1075#1086#1076
      #1089#1090#1091#1076#1077#1085#1090#1082#1072' '#1044#1072#1074#1099#1076#1086#1074#1072' '#1070'.'#1040'.:'
      #1052#1086#1076#1080#1092#1080#1082#1072#1094#1080#1103' '#1084#1086#1076#1091#1083#1103' '#1075#1088#1072#1092#1080#1095#1077#1089#1082#1086#1075#1086' '#1074#1099#1074#1086#1076#1072' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1088#1072#1089#1095#1077#1090#1072'.'
      #1054#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1075#1088#1072#1085#1080#1094' '#1079#1086#1085' '#1080' '#1094#1074#1077#1090#1086#1074#1072#1103' '#1080#1085#1076#1080#1082#1072#1094#1080#1103' '#1089#1074#1086#1081#1089#1090#1074' '#1050#1069'.'
      #1089#1090#1091#1076#1077#1085#1090' '#1051#1091#1085#1103#1082#1086#1074' '#1040'.'#1042'.:'
      #1044#1086#1088#1072#1073#1086#1090#1082#1072' '#1084#1086#1076#1091#1083#1103' '#1087#1086#1089#1090#1088#1086#1077#1085#1080#1103' '#1075#1088#1072#1092#1080#1082#1086#1074' '#1089#1093#1086#1076#1080#1084#1086#1089#1090#1080', '#1074#1099#1074#1086#1076' '#1087#1088#1086#1092#1080#1083#1103' '
      #1084#1072#1090#1088#1080#1094#1099'.'
      #1089#1090#1091#1076#1077#1085#1090' '#1071#1088#1099#1075#1080#1085' '#1040'.'#1070'.:'
      #1052#1086#1076#1080#1092#1080#1082#1072#1094#1080#1103' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099' '#1056#1072#1087#1087#1077#1088#1090#1072'.'
      #1089#1090#1091#1076#1077#1085#1090' '#1052#1103#1089#1086#1091#1090#1086#1074' '#1056'.'#1048'.:'
      #1044#1086#1088#1072#1073#1086#1090#1082#1072' '#1101#1082#1089#1087#1086#1088#1090#1072' '#1074' Nastran.'
      #1089#1090#1091#1076#1077#1085#1090' '#1053#1072#1089#1080#1073#1091#1083#1083#1080#1085' '#1058'.'#1056'.:'
      
        #1057#1086#1079#1076#1072#1085#1080#1077' '#1084#1086#1076#1091#1083#1103' '#1074#1099#1074#1086#1076#1072' '#1086#1073#1088#1072#1079#1072' '#1084#1072#1090#1088#1080#1094#1099', '#1075#1083#1091#1073#1086#1082#1072#1103' '#1087#1077#1088#1077#1088#1072#1073#1086#1090#1082#1072' '#1089#1080#1089#1090 +
        #1077#1084#1099', '
      #1089#1086#1079#1076#1072#1085#1080#1077' '#1074#1077#1088#1089#1080#1080' 6.1a.'
      
        '============================ 2012 ==============================' +
        '==='
      
        #1057#1090#1091#1076#1077#1085#1090' '#1052#1072#1088#1082#1080#1085' '#1053'.'#1053'. - '#1087#1086#1083#1085#1072#1103' '#1087#1077#1088#1077#1088#1072#1073#1086#1090#1082#1072' '#1084#1086#1076#1091#1083#1103' '#1087#1086#1076#1089#1095#1077#1090#1072' '#1079#1085#1072#1095#1077#1085#1080 +
        #1081' '
      #1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081' '#1074' '#1090#1086#1095#1082#1077'.'
      #1057#1090#1091#1076#1077#1085#1090#1082#1072' '#1050#1086#1088#1084#1072#1082#1086#1074#1072' '#1042'.'#1042'. - '#1084#1086#1076#1080#1092#1080#1082#1072#1094#1080#1103' '#1073#1083#1086#1082#1072' '#1087#1088#1086#1089#1084#1086#1090#1088#1072' '#1074#1099#1074#1086#1076#1072' '
      #1090#1077#1082#1089#1090#1086#1074#1086#1075#1086' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1072'.'
      
        #1044#1080#1087#1083#1086#1084#1085#1080#1082' '#1055#1072#1088#1072#1084#1086#1085#1086#1074' '#1052'.'#1042'. - '#1088#1072#1079#1088#1072#1073#1086#1090#1082#1072' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099' '#1091#1087#1086#1088#1103#1076#1086#1095#1077#1085#1080#1103' '#1084#1072 +
        #1090#1088#1080#1094' '#1089
      
        '     '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077#1084'  '#1080' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1077#1084'  '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1093' '#1084#1077#1090#1086#1076#1086#1074', '#1088#1077#1072#1083#1080#1079 +
        #1072#1094#1080#1103' '#1080
      
        '     '#1074#1082#1083#1102#1095#1077#1085#1080#1077' '#1074' '#1089#1080#1089#1090#1077#1084#1091' '#1072#1083#1075#1086#1088#1080#1090#1084#1086#1074' '#1050#1080#1085#1075#1072' '#1080' '#1056#1086#1079#1077#1085#1072', '#1086#1087#1090#1080#1084#1080#1079#1072#1094#1080#1103' ' +
        #1074#1099#1074#1086#1076#1072
      
        '     '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082' '#1084#1072#1090#1088#1080#1094' '#1080' '#1089#1093#1077#1084' '#1080#1093' '#1093#1088#1072 +
        #1085#1077#1085#1080#1103'.'
      '     '#1042#1099#1087#1091#1089#1082' '#1086#1073#1098#1077#1076#1080#1085#1077#1085#1085#1086#1081' '#1074#1077#1088#1089#1080#1080' 6.1b.'
      
        '============================ 2013 ==============================' +
        '==='
      
        #1044#1080#1087#1083#1086#1084#1085#1080#1082' '#1055#1072#1085#1092#1080#1083#1086#1074' '#1040'.'#1040'. - '#1072#1083#1100#1090#1077#1088#1085#1072#1090#1080#1074#1072'  '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103' '#1089#1080#1075#1084#1099' '#1076#1083#1103' ' +
        #1088#1072#1073#1086#1090#1099' '
      #1089' '#1087#1088#1077#1087#1088#1086#1094#1077#1089#1089#1086#1088#1086#1084
      #1057#1090#1091#1076#1077#1085#1090' '#1052#1072#1088#1082#1080#1085' '#1053'.'#1053'. - '#1084#1086#1076#1080#1092#1080#1082#1072#1094#1080#1103' '#1084#1086#1076#1091#1083#1103' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1092#1086#1088#1084#1099','
      ' '#1087#1086#1076#1089#1095#1077#1090' '#1088#1072#1089#1089#1090#1086#1103#1085#1080#1081'  '#1084#1077#1078#1076#1091' '#1090#1086#1095#1082#1072#1084#1080' '#1085#1072' '#1087#1083#1072#1089#1090#1080#1085#1077
      
        #1057#1090#1091#1076#1077#1085#1090' '#1043#1086#1088#1073#1091#1085#1086#1074' '#1048'.'#1042'. - '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1101#1082#1089#1087#1086#1088#1090#1072' '#1090#1077#1082#1089#1090#1086#1074#1086#1075#1086' '#1088#1077#1079#1091#1083#1100#1090#1072#1090 +
        #1072' '#1074' Excel,'
      ' '#1074#1085#1077#1089#1077#1085#1099' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1074' '#1091#1090#1080#1083#1080#1090#1091' Comparison 1.6'
      #1057#1090#1091#1076#1077#1085#1090' '#1044#1091#1088#1072#1074#1080#1085' '#1054'.'#1042'. - '#1084#1086#1076#1080#1092#1080#1082#1072#1094#1080#1103' '#1084#1086#1076#1091#1083#1103' '#1075#1077#1086#1084#1077#1090#1088#1080#1080
      
        #1057#1090#1091#1076#1077#1085#1090#1082#1072' '#1060#1080#1083#1080#1087#1087#1086#1074#1072' '#1045'.'#1057'. -  '#1084#1086#1076#1080#1092#1080#1082#1072#1094#1080#1103' '#1084#1086#1076#1091#1083#1103' '#1075#1088#1072#1092#1080#1095#1077#1089#1082#1086#1075#1086' '#1088#1077#1079#1091 +
        #1083#1100#1090#1072#1090#1072
      #1057#1090#1091#1076#1077#1085#1090#1082#1072' '#1050#1086#1088#1084#1072#1082#1086#1074#1072' '#1042'.'#1042'. - '#1074#1099#1087#1091#1089#1082' '#1086#1073#1098#1077#1076#1080#1085#1077#1085#1085#1086#1081' '#1074#1077#1088#1089#1080#1080' 7.0.'
      
        #1057#1090#1091#1076#1077#1085#1090' '#1042#1072#1074#1080#1083#1086#1074' '#1048'.'#1055'. - '#1085#1086#1074#1072#1103' '#1074#1077#1088#1089#1080#1103' '#1087#1083#1072#1075#1080#1085#1072' '#1101#1082#1089#1087#1086#1088#1090#1072' '#1074' Femap, '#1074#1099 +
        #1087#1091#1089#1082' '
      'stable-'#1074#1077#1088#1089#1080#1080' 7.0.'
      
        '============================ 2014 ==============================' +
        '==='
      
        #1057#1090#1091#1076#1077#1085#1090#1099' '#1061#1072#1081#1088#1091#1083#1083#1080#1085' '#1048'.'#1056'. '#1080' '#1060#1088#1086#1083#1086#1074' '#1042'.'#1042'. - '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1086#1096#1080#1073#1086#1082', '#1076#1086#1088#1072 +
        #1073#1086#1090#1082#1080' '
      #1087#1088#1086#1075#1088#1072#1084#1084#1099
      
        '============================ 2015 ==============================' +
        '==='
      #1044#1080#1087#1083#1086#1084#1085#1080#1082' '#1071#1082#1086#1074#1083#1077#1074' '#1044'.'#1040'. - '#1074#1099#1087#1091#1089#1082' '#1074#1077#1088#1089#1080#1080' 7.2'
      
        '============================ 2019 ==============================' +
        '==='
      #1042#1099#1087#1091#1089#1082' '#1074#1077#1088#1089#1080#1080' 7.4'
      ''
      #1044#1080#1087#1083#1086#1084#1085#1080#1082' '#1046#1077#1088#1077#1073#1094#1086#1074' '#1056'.'#1042'. - '#1052#1086#1076#1080#1092#1080#1082#1072#1094#1080#1103' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099' '#1075#1088#1072#1092#1080#1095#1077#1089#1082#1086#1075#1086
      #1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1088#1072#1089#1095#1105#1090#1072'. '#1056#1077#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '#1087#1072#1085#1077#1083#1080' '#1086#1089#1085#1086#1074#1085#1099#1093
      #1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1087#1088#1086#1077#1082#1090#1072'. '#1048#1089#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1086#1096#1080#1073#1086#1082'.'
      ''
      
        #1044#1080#1087#1083#1086#1084#1085#1080#1082' '#1052#1077#1083#1077#1096#1082#1086' '#1057'.'#1040'. - '#1044#1086#1088#1072#1073#1086#1090#1082#1072' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099' '#1087#1086#1089#1090#1088#1086#1077#1085#1080#1103' '#1075#1088#1072#1092#1080#1082#1086 +
        #1074
      #1089#1093#1086#1076#1080#1084#1086#1089#1090#1080' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1081' '#1080' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081'.'
      ''
      
        #1044#1080#1087#1083#1086#1084#1085#1080#1082' '#1060#1080#1096#1077#1088' '#1052'.'#1044'. - '#1056#1072#1079#1088#1072#1073#1086#1090#1082#1072' '#1084#1086#1076#1091#1083#1103' '#1088#1072#1089#1095#1105#1090#1072' '#1079#1072#1090#1088#1072#1090' '#1087#1072#1084#1103#1090#1080' '#1076 +
        #1083#1103
      #1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1093' '#1084#1077#1090#1086#1076#1086#1074' '#1091#1087#1072#1082#1086#1074#1082#1080' '#1088#1072#1079#1088#1077#1078#1077#1085#1085#1099#1093' '#1084#1072#1090#1088#1080#1094'. '#1048#1089#1087#1088#1072#1074#1083#1077#1085#1080#1077
      #1086#1096#1080#1073#1086#1082'.'
      ''
      #1044#1080#1087#1083#1086#1084#1085#1080#1094#1072' '#1060#1105#1076#1086#1088#1086#1074#1072' '#1045'.'#1048'. - '#1056#1072#1079#1088#1072#1073#1086#1090#1082#1072' '#1092#1091#1085#1082#1094#1080#1086#1085#1072#1083#1072' '#1087#1077#1088#1077#1089#1077#1095#1077#1085#1080#1103' '#1080
      #1086#1073#1098#1077#1076#1080#1085#1077#1085#1080#1103' '#1086#1073#1083#1072#1089#1090#1077#1081' '#1079#1085#1072#1095#1077#1085#1080#1081' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1081'. '#1044#1086#1088#1072#1073#1086#1090#1082#1072' '#1092#1091#1085#1082#1094#1080#1086#1085#1072#1083#1072
      '"'#1054#1073#1083#1072#1089#1090#1080'" ('#1088#1072#1085#1077#1077' "'#1047#1086#1085#1072' '#1085#1091#1083#1103'").'
      
        '================================================================' +
        '==')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
