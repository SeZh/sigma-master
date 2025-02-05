object PanelSettings: TPanelSettings
  Left = 1079
  Top = 6
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PanelSettings'
  ClientHeight = 657
  ClientWidth = 270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 270
    Height = 773
    ActivePage = TabSheet5
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object TabSheet5: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 4
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 262
        Height = 745
        Align = alRight
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 258
          Height = 95
          Align = alTop
          Caption = #1052#1072#1089#1096#1090#1072#1073
          TabOrder = 0
          object Label4: TLabel
            Left = 10
            Top = 68
            Width = 83
            Height = 13
            Caption = #1059#1074#1077#1083#1080#1095#1077#1085#1080#1077' '#1074
          end
          object LabelScale: TLabel
            Left = 2
            Top = 15
            Width = 254
            Height = 13
            Align = alTop
            Alignment = taCenter
          end
          object TrackBar1: TTrackBar
            Left = 2
            Top = 28
            Width = 254
            Height = 40
            Align = alTop
            Max = 200
            Frequency = 10
            Position = 100
            TabOrder = 0
          end
          object EditScale: TEdit
            Left = 96
            Top = 64
            Width = 97
            Height = 21
            AutoSelect = False
            TabOrder = 1
            Text = '100'
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 95
          Width = 258
          Height = 122
          Align = alTop
          Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
          TabOrder = 1
          Visible = False
          object SpeedButton1: TSpeedButton
            Left = 46
            Top = 88
            Width = 97
            Height = 25
            Hint = #1047#1072#1076#1072#1085#1080#1077' '#1086#1089#1085#1086#1074#1085#1099#1093' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
            AllowAllUp = True
            Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
            ParentShowHint = False
            ShowHint = True
          end
          object UseGridEps: TCheckBox
            Left = 8
            Top = 16
            Width = 180
            Height = 17
            Hint = #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1082' '#1082#1086#1086#1088#1076#1080#1085#1072#1090#1085#1086#1081' '#1089#1077#1090#1082#1077
            Caption = #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1082' '#1089#1077#1090#1082#1077
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object UseGrid: TCheckBox
            Left = 8
            Top = 40
            Width = 180
            Height = 17
            Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1089#1077#1090#1082#1091
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object UseBuffer: TCheckBox
            Left = 8
            Top = 64
            Width = 180
            Height = 17
            Caption = #1050#1072#1095#1077#1089#1090#1074#1077#1085#1085#1086#1077' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 315
          Width = 258
          Height = 110
          Align = alTop
          Caption = #1047#1086#1085#1072
          TabOrder = 2
          object Label5: TLabel
            Left = 8
            Top = 20
            Width = 85
            Height = 13
            Caption = #1058#1077#1082#1091#1097#1072#1103' '#1079#1086#1085#1072
          end
          object AddZone: TButton
            Left = 8
            Top = 72
            Width = 89
            Height = 25
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1086#1085#1091
            TabOrder = 0
          end
          object DelZone: TButton
            Left = 112
            Top = 72
            Width = 81
            Height = 25
            Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1079#1086#1085#1091
            Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1086#1085#1091
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object CurZone: TComboBox
            Left = 88
            Top = 16
            Width = 89
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 2
          end
          object Button2: TButton
            Left = 8
            Top = 48
            Width = 185
            Height = 17
            Caption = #1057#1084#1077#1085#1080#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1086#1073#1093#1086#1076#1072
            TabOrder = 3
          end
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 425
          Width = 258
          Height = 104
          Align = alTop
          Caption = #1059#1079#1077#1083
          Enabled = False
          TabOrder = 3
          object Label2: TLabel
            Left = 8
            Top = 50
            Width = 13
            Height = 13
            Caption = 'X:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 104
            Top = 50
            Width = 13
            Height = 13
            Caption = 'Y:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 8
            Top = 20
            Width = 84
            Height = 13
            Caption = #1058#1077#1082#1091#1097#1080#1081' '#1091#1079#1077#1083
          end
          object CurNode: TComboBox
            Left = 88
            Top = 16
            Width = 89
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            Sorted = True
            TabOrder = 2
          end
          object EditX: TEdit
            Left = 24
            Top = 48
            Width = 65
            Height = 21
            TabOrder = 0
          end
          object EditY: TEdit
            Left = 120
            Top = 48
            Width = 65
            Height = 21
            TabOrder = 1
          end
          object Button4: TButton
            Left = 8
            Top = 80
            Width = 185
            Height = 17
            Caption = #1042#1074#1077#1089#1090#1080' '#1085#1077#1087#1088#1077#1088#1099#1074#1085#1091#1102' '#1085#1091#1084#1077#1088#1072#1094#1080#1102
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
        object GroupBox5: TGroupBox
          Left = 0
          Top = 529
          Width = 258
          Height = 87
          Align = alTop
          Caption = #1044#1077#1081#1089#1090#1074#1080#1103
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 4
          object SaveBtn: TBitBtn
            Left = 107
            Top = 18
            Width = 88
            Height = 25
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
            ModalResult = 1
            TabOrder = 0
            NumGlyphs = 2
          end
          object BitBtn2: TBitBtn
            Left = 9
            Top = 18
            Width = 88
            Height = 25
            Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1096#1072#1075
            Enabled = False
            ModalResult = 4
            TabOrder = 1
            NumGlyphs = 2
          end
          object Button1: TButton
            Left = 64
            Top = 56
            Width = 81
            Height = 25
            BiDiMode = bdRightToLeft
            Caption = #1047#1072#1082#1088#1099#1090#1100
            ParentBiDiMode = False
            TabOrder = 2
          end
        end
        object GroupBox6: TGroupBox
          Left = 0
          Top = 217
          Width = 258
          Height = 98
          Align = alTop
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103' '#1092#1086#1088#1084#1099
          TabOrder = 5
          object SpeedButton6: TSpeedButton
            Left = 46
            Top = 64
            Width = 97
            Height = 25
            Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072' '#1079#1086#1085
          end
          object UseNodeNum: TCheckBox
            Left = 8
            Top = 20
            Width = 185
            Height = 17
            Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1085#1091#1084#1077#1088#1072#1094#1080#1102' '#1091#1079#1083#1086#1074
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object UseZoneNum: TCheckBox
            Left = 8
            Top = 44
            Width = 169
            Height = 17
            Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1085#1091#1084#1077#1088#1072#1094#1080#1102' '#1079#1086#1085
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1056#1072#1089#1095#1077#1090' '#1088#1072#1089#1089#1090#1086#1103#1085#1080#1081
      ImageIndex = 1
      object GroupBox7: TGroupBox
        Left = 0
        Top = 0
        Width = 262
        Height = 81
        Align = alTop
        TabOrder = 0
        DesignSize = (
          262
          81)
        object btnClosePanelCalc: TButton
          Left = 8
          Top = 16
          Width = 0
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          Caption = #1057#1082#1088#1099#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1088#1072#1089#1089#1095#1077#1090#1072
          TabOrder = 0
        end
        object btnCalcLinear: TButton
          Left = 16
          Top = 48
          Width = 241
          Height = 25
          Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100' '#1088#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1087#1086' '#1087#1088#1103#1084#1086#1081
          TabOrder = 1
          OnClick = btnCalcLinearClick
        end
        object btnCalcArcLength: TButton
          Left = 16
          Top = 16
          Width = 241
          Height = 25
          Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100' '#1088#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1087#1086' '#1076#1091#1075#1077
          TabOrder = 2
          OnClick = btnCalcArcLengthClick
        end
      end
      object pnlLinear: TGroupBox
        Left = 0
        Top = 81
        Width = 262
        Height = 144
        Align = alTop
        Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1087#1086' '#1087#1088#1103#1084#1086#1081
        TabOrder = 1
        Visible = False
        object lblNode1l: TLabel
          Left = 16
          Top = 22
          Width = 46
          Height = 13
          Caption = #1059#1079#1077#1083' 1:'
          Visible = False
        end
        object lblNode2l: TLabel
          Left = 16
          Top = 52
          Width = 46
          Height = 13
          Caption = #1059#1079#1077#1083' 2:'
          Visible = False
        end
        object lblResLinear: TLabel
          Left = 8
          Top = 76
          Width = 164
          Height = 13
          Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1084#1077#1078#1076#1091' '#1091#1079#1083#1072#1084#1080':'
          Visible = False
        end
        object lblNote: TLabel
          Left = 8
          Top = 120
          Width = 250
          Height = 13
          Caption = #1042#1099#1073#1077#1088#1080#1090#1077' 2 '#1091#1079#1083#1072' '#1075#1077#1086#1084#1077#1090#1088#1080#1095#1077#1089#1082#1086#1081' '#1084#1086#1076#1077#1083#1080
          Visible = False
        end
        object resLinear: TEdit
          Left = 8
          Top = 92
          Width = 209
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Visible = False
        end
        object node1Number: TEdit
          Left = 72
          Top = 16
          Width = 41
          Height = 21
          ReadOnly = True
          TabOrder = 1
          Visible = False
        end
        object node2Number: TEdit
          Left = 72
          Top = 48
          Width = 41
          Height = 21
          ReadOnly = True
          TabOrder = 2
          Visible = False
        end
      end
      object pnlArc: TGroupBox
        Left = 0
        Top = 225
        Width = 262
        Height = 352
        Align = alTop
        Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1087#1086' '#1076#1091#1075#1077
        TabOrder = 2
        Visible = False
        object lblNode1a: TLabel
          Left = 16
          Top = 22
          Width = 46
          Height = 13
          Caption = #1059#1079#1077#1083' 1:'
          Visible = False
        end
        object lblNode2a: TLabel
          Left = 16
          Top = 44
          Width = 46
          Height = 13
          Caption = #1059#1079#1077#1083' 2:'
          Visible = False
        end
        object lblResA1: TLabel
          Left = 8
          Top = 180
          Width = 186
          Height = 13
          Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1084#1077#1078#1076#1091' '#1091#1079#1083#1072#1084#1080' 1-2:'
          Visible = False
        end
        object lblNoteA: TLabel
          Left = 8
          Top = 312
          Width = 250
          Height = 13
          Caption = #1042#1099#1073#1077#1088#1080#1090#1077' 3 '#1091#1079#1083#1072' '#1075#1077#1086#1084#1077#1090#1088#1080#1095#1077#1089#1082#1086#1081' '#1084#1086#1076#1077#1083#1080
          Visible = False
        end
        object lblNode3a: TLabel
          Left = 16
          Top = 72
          Width = 46
          Height = 13
          Caption = #1059#1079#1077#1083' 3:'
          Visible = False
        end
        object lblResA2: TLabel
          Left = 8
          Top = 228
          Width = 186
          Height = 13
          Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1084#1077#1078#1076#1091' '#1091#1079#1083#1072#1084#1080' 2-3:'
          Visible = False
        end
        object lblResA3: TLabel
          Left = 8
          Top = 268
          Width = 186
          Height = 13
          Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1084#1077#1078#1076#1091' '#1091#1079#1083#1072#1084#1080' 1-3:'
          Visible = False
        end
        object res1a: TEdit
          Left = 8
          Top = 204
          Width = 209
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Visible = False
        end
        object node1NumberA: TEdit
          Left = 72
          Top = 16
          Width = 40
          Height = 21
          ReadOnly = True
          TabOrder = 1
          Visible = False
        end
        object node2NumberA: TEdit
          Left = 72
          Top = 40
          Width = 40
          Height = 21
          ReadOnly = True
          TabOrder = 2
          Visible = False
        end
        object node3NumberA: TEdit
          Left = 73
          Top = 64
          Width = 40
          Height = 21
          TabOrder = 3
          Visible = False
        end
        object res2a: TEdit
          Left = 8
          Top = 244
          Width = 209
          Height = 21
          ReadOnly = True
          TabOrder = 4
          Visible = False
        end
        object res3a: TEdit
          Left = 8
          Top = 284
          Width = 209
          Height = 21
          ReadOnly = True
          TabOrder = 5
          Visible = False
        end
        object lblResRadius: TStaticText
          Left = 8
          Top = 96
          Width = 208
          Height = 49
          AutoSize = False
          Caption = #1056#1072#1076#1080#1091#1089' '#1086#1082#1088#1091#1078#1085#1086#1089#1090#1080' '#1087#1088#1086#1093#1086#1076#1103#1097#1077#1081' '#1095#1077#1088#1077#1079' '#1074#1099#1073#1088#1072#1085#1085#1099#1077' '#1091#1079#1083#1099':'
          TabOrder = 6
          Visible = False
        end
        object resRadius: TEdit
          Left = 8
          Top = 144
          Width = 209
          Height = 21
          TabOrder = 7
          Visible = False
        end
      end
    end
  end
end
