object Segment: TSegment
  Left = 354
  Top = 120
  Width = 812
  Height = 589
  AlphaBlend = True
  Caption = #1057#1077#1090#1082#1072' '#1082#1086#1085#1077#1095#1085#1099#1093' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF
    FFFFFFFFFFFFFFFFFFFFFFFCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFFFCFFFFC
    CCFFFFFFFFFF00000FFFFCFFFFFCFFCFFFCFFFFFFFFF0FF00EEEECFFFFFCFCFF
    FFFEEEEEEEEE0FF00FFFFCFFFFFCFCFFFFFCFFFFFFFF0FF00FFFFFCFFFCFFCFF
    FFFCFFFFFFFF0FF00FFFFFFCECFFFFCFFFEFFFFFFFFF0FF00FFFFFFEFFFFFFFC
    CCEFFFFFFFFF0FF00FFFFFFEFFFFFFFFFFEFFFFFFFFF0FF00FFFFFEFFFFFFFFF
    FEFFFFFFFFFF0FF00FFFFFEFFFFFFFFFFEFFFFFFFFFF0FF00FFFFEFFFFFFFFFF
    FEFFFFFFFFFF0FF00FFFFEFFFFFFFFFFFEFFFFFFFFFF0FF00FFFEFFFFFFFFFFF
    FEFFFFFFFFFF0FF00FFFEFFFFFFFFFFFEFFFFFFFFFFF0FF00FFEFFFFFFFFFFFF
    EFFF000000000FF0000EFFFFFFFFFFFFFEF0000000000FF0000FFFFFFFFFFFFF
    FEFF000000000FF0000FFFFFFFFFFFFFFEFF0FFFFFFFFFFFFF0FFFFFFFFFFFFF
    FEFFF00000000000000FFFFFFFFFFFFFFFEFFF0000000000000FFFFFFFFFFFFF
    FFFEFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFEEEFFFFFCCCEFFFFFFFFFFFFFFFF
    FFFFFFFEEFFCFFFCFFFFFFFFFFFFFFFFFFFFFFFFFEEFFFFFCFFFFFFFFFFFFFFF
    FFFFFFFFFFCFFFFFCFFFFFFFFFFFFFFFFFFFFFFFFFCFFFFFCFFFFFFFFFFFFFFF
    FFFFFFFFFFFCFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poDefault
  PrintScale = poNone
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 453
    Top = 0
    Height = 531
    Align = alRight
    OnMoved = Splitter1Moved
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 531
    Width = 796
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object ScrollBox1: TScrollBox
    Left = 456
    Top = 0
    Width = 340
    Height = 531
    Align = alRight
    AutoScroll = False
    TabOrder = 1
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 336
      Height = 22
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Images = ImageList1
      TabOrder = 0
      object DefaultAction: TToolButton
        Left = 0
        Top = 0
        Caption = 'DefaultAction'
        Down = True
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = ChangeActionClick
      end
      object ChouseArea: TToolButton
        Left = 23
        Top = 0
        Caption = 'ChouseArea'
        ImageIndex = 6
        OnClick = ChangeActionClick
      end
      object ZoomInAction: TToolButton
        Left = 46
        Top = 0
        Hint = #1055#1088#1080#1073#1083#1080#1079#1080#1090#1100
        Caption = 'ZoomInAction'
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = ChangeActionClick
      end
      object ZoomOutAction: TToolButton
        Left = 69
        Top = 0
        Hint = #1054#1090#1076#1072#1083#1080#1090#1100
        Caption = 'ZoomOutAction'
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = ChangeActionClick
      end
      object ZoomAreaAction: TToolButton
        Left = 92
        Top = 0
        Hint = #1055#1088#1080#1073#1083#1080#1079#1080#1090#1100' '#1086#1073#1083#1072#1089#1090#1100
        Caption = 'ZoomAreaAction'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        OnClick = ChangeActionClick
      end
      object MoveAction: TToolButton
        Left = 115
        Top = 0
        Hint = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100
        Caption = 'MoveAction'
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        OnClick = ChangeActionClick
      end
      object ToolButton1: TToolButton
        Left = 138
        Top = 0
        Hint = #1042#1087#1080#1089#1072#1090#1100' '#1074' '#1086#1073#1083#1072#1089#1090#1100
        Caption = 'ToolButton1'
        ImageIndex = 5
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButton1Click
      end
      object Panel3: TPanel
        Left = 161
        Top = 0
        Width = 156
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object RadioCM: TRadioButton
          Left = 45
          Top = 4
          Width = 41
          Height = 17
          Caption = #1089#1084
          TabOrder = 0
        end
        object RadioMM: TRadioButton
          Left = 5
          Top = 4
          Width = 41
          Height = 17
          Caption = #1084#1084
          TabOrder = 1
        end
        object RadioDM: TRadioButton
          Left = 85
          Top = 4
          Width = 41
          Height = 17
          Caption = #1076#1084
          TabOrder = 2
        end
        object RadioM: TRadioButton
          Left = 125
          Top = 4
          Width = 41
          Height = 17
          Caption = #1052
          TabOrder = 3
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 22
      Width = 336
      Height = 78
      Align = alTop
      Caption = #1052#1072#1089#1096#1090#1072#1073
      TabOrder = 1
      object Label4: TLabel
        Left = 2
        Top = 56
        Width = 70
        Height = 20
        Align = alLeft
        Caption = #1059#1074#1077#1083#1080#1095#1077#1085#1080#1077' '#1074
      end
      object LabelScale: TLabel
        Left = 2
        Top = 15
        Width = 332
        Height = 13
        Align = alTop
        Alignment = taCenter
      end
      object TrackBar1: TTrackBar
        Left = 2
        Top = 28
        Width = 332
        Height = 28
        Align = alTop
        Max = 200
        Frequency = 10
        Position = 100
        TabOrder = 0
        OnChange = TrackBar1Change
      end
      object EditScale: TEdit
        Left = 77
        Top = 56
        Width = 51
        Height = 21
        AutoSelect = False
        TabOrder = 1
        Text = '100'
        OnExit = EditScaleExit
        OnKeyDown = EditScaleKeyDown
      end
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 100
      Width = 336
      Height = 67
      Align = alTop
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      TabOrder = 2
      object UseGridEps: TCheckBox
        Left = 114
        Top = 12
        Width = 190
        Height = 17
        Hint = #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1082' '#1082#1086#1086#1088#1076#1080#1085#1072#1090#1085#1086#1081' '#1089#1077#1090#1082#1077
        Caption = #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1082' '#1082#1086#1086#1088#1076#1080#1085#1072#1090#1085#1086#1081' '#1089#1077#1090#1082#1077
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object UseGrid: TCheckBox
        Left = 114
        Top = 28
        Width = 203
        Height = 16
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1086#1086#1088#1076#1080#1085#1072#1090#1085#1091#1102' '#1089#1077#1090#1082#1091
        TabOrder = 1
        OnClick = UseGridClick
      end
      object UseBuffer: TCheckBox
        Left = 114
        Top = 43
        Width = 124
        Height = 16
        Caption = #1059#1083#1091#1095#1096#1077#1085#1080#1077' '#1082#1072#1095#1077#1089#1090#1074#1072
        TabOrder = 2
      end
      object GroupBox8: TGroupBox
        Left = 5
        Top = 12
        Width = 96
        Height = 53
        Caption = #1040#1082#1090#1080#1074#1085#1099#1081' '#1089#1083#1086#1081
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        object MainForm: TRadioButton
          Left = 7
          Top = 11
          Width = 74
          Height = 15
          Caption = #1047#1086#1085#1099
          TabOrder = 0
          OnClick = MainFormClick
        end
        object MainRes: TRadioButton
          Left = 7
          Top = 24
          Width = 74
          Height = 15
          Caption = #1057#1077#1090#1082#1072' '#1050#1069
          TabOrder = 1
          OnClick = MainResClick
        end
        object MainNone: TRadioButton
          Left = 7
          Top = 37
          Width = 84
          Height = 15
          Caption = #1053#1077' '#1074#1099#1073#1088#1072#1085
          Checked = True
          TabOrder = 2
          TabStop = True
          OnClick = MainNoneClick
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 0
      Top = 167
      Width = 336
      Height = 241
      Align = alTop
      Caption = #1069#1083#1077#1084#1077#1085#1090#1099' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
      Enabled = False
      TabOrder = 3
      object ManualShow: TPageControl
        Left = 2
        Top = 15
        Width = 332
        Height = 224
        ActivePage = Page3
        Align = alClient
        MultiLine = True
        RaggedRight = True
        ScrollOpposite = True
        TabOrder = 0
        object Page1: TTabSheet
          Caption = #1047#1086#1085#1099' '#1087#1083#1072#1089#1090#1080#1085#1099
          object ZoneNum: TLabel
            Left = 8
            Top = 7
            Width = 92
            Height = 13
            Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1086#1085': 0'
          end
          object LabelCurZone: TLabel
            Left = 10
            Top = 97
            Width = 27
            Height = 13
            Caption = #1047#1086#1085#1099
            Visible = False
          end
          object LabelNodeCordY: TLabel
            Left = 13
            Top = 71
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
          object LabelNodeCordX: TLabel
            Left = 13
            Top = 51
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
          object LabelCurNode: TLabel
            Left = 9
            Top = 30
            Width = 28
            Height = 13
            Caption = #1059#1079#1083#1099
          end
          object FormPointSize: TLabel
            Left = 159
            Top = 70
            Width = 105
            Height = 13
            Caption = #1056#1072#1079#1084#1077#1088' '#1090#1086#1095#1077#1082' '#1091#1079#1083#1086#1074':'
          end
          object CurNode: TComboBox
            Left = 51
            Top = 25
            Width = 63
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 0
            OnChange = CurNodeChange
          end
          object EditY: TEdit
            Left = 52
            Top = 67
            Width = 45
            Height = 21
            TabOrder = 1
          end
          object EditX: TEdit
            Left = 52
            Top = 47
            Width = 45
            Height = 21
            TabOrder = 2
          end
          object CurZone: TComboBox
            Left = 51
            Top = 93
            Width = 63
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 3
            Visible = False
            OnChange = CurZoneChange
          end
          object FontFnode: TEdit
            Left = 272
            Top = 12
            Width = 20
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            Text = '8'
          end
          object UseNodeNum: TCheckBox
            Left = 157
            Top = 28
            Width = 94
            Height = 17
            Caption = #1053#1086#1084#1077#1088#1072' '#1091#1079#1083#1086#1074
            TabOrder = 5
            OnClick = UseNodeNumClick
          end
          object UseZoneNum: TCheckBox
            Left = 157
            Top = 47
            Width = 92
            Height = 17
            Caption = #1053#1086#1084#1077#1088#1072' '#1079#1086#1085
            TabOrder = 6
            OnClick = UseZoneNumClick
          end
          object UseForm: TCheckBox
            Left = 157
            Top = 10
            Width = 113
            Height = 17
            Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1086#1085#1099
            TabOrder = 7
            OnClick = UseFormClick
          end
          object UpDownFontFnode: TUpDown
            Left = 297
            Top = 12
            Width = 15
            Height = 22
            Associate = FontFnode
            Min = 8
            Max = 25
            Position = 8
            TabOrder = 8
            OnChanging = UpDownFontFnodeChanging
          end
          object UpDownFontFzone: TUpDown
            Left = 297
            Top = 39
            Width = 15
            Height = 22
            Associate = FontFzone
            Min = 8
            Max = 50
            Position = 12
            TabOrder = 9
            OnChanging = UpDownFontFzoneChanging
          end
          object FontFzone: TEdit
            Left = 272
            Top = 39
            Width = 20
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
            Text = '12'
          end
          object UpDownFontFPointSize: TUpDown
            Left = 297
            Top = 67
            Width = 15
            Height = 22
            Associate = FontFPointSize
            Min = 1
            Max = 25
            Position = 5
            TabOrder = 11
            OnChanging = UpDownFontFPointSizeChanging
          end
          object FontFPointSize: TEdit
            Left = 272
            Top = 67
            Width = 20
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
            Text = '5'
          end
          object Bound: TGroupBox
            Left = 0
            Top = 128
            Width = 324
            Height = 68
            Align = alBottom
            Caption = #1043#1088#1072#1085#1080#1094#1072' '#1079#1086#1085
            TabOrder = 13
            object Size: TLabel
              Left = 9
              Top = 29
              Width = 42
              Height = 13
              Caption = #1064#1080#1088#1080#1085#1072':'
            end
            object UseShowBound: TCheckBox
              Left = 155
              Top = 16
              Width = 140
              Height = 17
              Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1075#1088#1072#1085#1080#1094#1091' '#1079#1086#1085
              TabOrder = 0
              OnClick = UseShowBoundClick
            end
            object UpDownSizeBound: TUpDown
              Left = 72
              Top = 22
              Width = 15
              Height = 22
              Associate = SizeBound
              Enabled = False
              Min = 1
              Max = 99
              Position = 10
              TabOrder = 1
              OnChanging = UpDownSizeBoundChanging
            end
            object SizeBound: TEdit
              Left = 55
              Top = 22
              Width = 20
              Height = 20
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              Text = '10'
            end
            object UseBlockBound: TCheckBox
              Left = 155
              Top = 32
              Width = 127
              Height = 17
              Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1075#1088#1072#1085#1080#1094#1091
              TabOrder = 3
              OnClick = UseBlockBoundClick
            end
            object UseBlockNodes: TCheckBox
              Left = 155
              Top = 48
              Width = 133
              Height = 17
              Caption = #1041#1083#1086#1082'. '#1075#1088#1072#1085#1080#1095#1085#1099#1077' '#1091#1079#1083#1099
              TabOrder = 4
              Visible = False
              OnClick = UseBlockNodesClick
            end
          end
          object ReLoadResBTN: TButton
            Left = 223
            Top = 94
            Width = 88
            Height = 20
            Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1088#1077#1079'-'#1090
            TabOrder = 14
            Visible = False
            OnClick = ReLoadResBTNClick
          end
          object btncompilenow: TButton
            Left = 118
            Top = 94
            Width = 89
            Height = 20
            Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090
            TabOrder = 15
            Visible = False
            OnClick = btncompilenowClick
          end
        end
        object Page3: TTabSheet
          Caption = #1053#1086#1074#1072#1103' '#1089#1077#1090#1082#1072' '#1082'.'#1101'.'
          object SettingsRes: TGroupBox
            Left = 0
            Top = 0
            Width = 324
            Height = 185
            Align = alTop
            Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1089#1077#1090#1082#1072' '#1082'.'#1101'.'
            TabOrder = 0
            object ResPointSize: TLabel
              Left = 151
              Top = 67
              Width = 73
              Height = 13
              Caption = #1056#1072#1079#1084#1077#1088' '#1090#1086#1095#1077#1082':'
            end
            object Label3: TLabel
              Left = 152
              Top = 16
              Width = 110
              Height = 13
              Caption = #1056#1072#1079#1084#1077#1088' '#1085#1086#1084#1077#1088#1086#1074' '#1079#1086#1085':'
            end
            object Label5: TLabel
              Left = 152
              Top = 40
              Width = 110
              Height = 13
              Caption = #1056#1072#1079#1084#1077#1088' '#1085#1086#1084#1077#1088#1086#1074' '#1082'.'#1101'.:'
            end
            object UpDownFontRelem: TUpDown
              Left = 295
              Top = 35
              Width = 15
              Height = 22
              Min = 8
              Max = 50
              Position = 10
              TabOrder = 0
              OnClick = UpDownFontRelemClick
            end
            object UseResult: TCheckBox
              Left = 4
              Top = 17
              Width = 112
              Height = 17
              Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1082'.'#1101'.'
              TabOrder = 1
              OnClick = UseResultClick
            end
            object UseNodeRes: TCheckBox
              Left = 4
              Top = 34
              Width = 100
              Height = 17
              Caption = #1053#1086#1084#1077#1088#1072' '#1091#1079#1083#1086#1074
              TabOrder = 2
              OnClick = UseNodeResClick
            end
            object UseElements: TCheckBox
              Left = 4
              Top = 52
              Width = 87
              Height = 17
              Caption = #1053#1086#1084#1077#1088#1072' '#1082'.'#1101'.'
              TabOrder = 3
              OnClick = UseElementsClick
            end
            object UpDownFontRnode: TUpDown
              Left = 295
              Top = 61
              Width = 15
              Height = 22
              Associate = FontRnode
              Min = 8
              Max = 25
              Position = 8
              TabOrder = 4
              OnChanging = UpDownFontRnodeChanging
            end
            object FontRnode: TEdit
              Left = 275
              Top = 61
              Width = 20
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
              Text = '8'
            end
            object FontRPointSize: TEdit
              Left = 275
              Top = 9
              Width = 20
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
              Text = '5'
            end
            object UpDownFontRPointSize: TUpDown
              Left = 295
              Top = 9
              Width = 15
              Height = 22
              Associate = FontRPointSize
              Min = 1
              Max = 25
              Position = 5
              TabOrder = 7
              OnChanging = UpDownFontRPointSizeChanging
            end
            object UseINOUTNodes: TCheckBox
              Left = 3
              Top = 91
              Width = 156
              Height = 17
              Caption = #1056#1072#1079#1073#1080#1090#1100' '#1085#1072' '#1074#1085#1091#1090#1088'/'#1074#1085#1077#1096#1085#1080#1077
              TabOrder = 8
              Visible = False
              OnClick = UseINOUTNodesClick
            end
            object UseBlockINOUT: TCheckBox
              Left = 3
              Top = 72
              Width = 128
              Height = 17
              Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1082#1086#1085#1090#1091#1088
              Ctl3D = True
              ParentCtl3D = False
              TabOrder = 9
            end
            object Truncs: TGroupBox
              Left = 2
              Top = 136
              Width = 159
              Height = 40
              Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1099#1081' '#1091#1075#1086#1083
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 11
              object Label1: TLabel
                Left = 4
                Top = 17
                Width = 51
                Height = 13
                Caption = #1047#1085#1072#1095#1077#1085#1080#1077':'
              end
              object Label2: TLabel
                Left = 106
                Top = 15
                Width = 6
                Height = 13
                Caption = '>'
              end
              object UpDownMinTrunc: TUpDown
                Left = 83
                Top = 15
                Width = 15
                Height = 20
                Associate = MinTrunc
                Min = 1
                Max = 45
                Position = 10
                TabOrder = 0
              end
              object MinTrunc: TEdit
                Left = 63
                Top = 15
                Width = 20
                Height = 20
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                MaxLength = 2
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
                Text = '10'
              end
              object MinTruncInMesh: TEdit
                Left = 124
                Top = 13
                Width = 29
                Height = 19
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clLime
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 99
                ParentFont = False
                TabOrder = 2
              end
            end
            object Sums: TGroupBox
              Left = 170
              Top = 136
              Width = 151
              Height = 40
              Caption = #1057#1086#1086#1090#1085#1086#1096#1077#1085#1080#1077' '#1087#1083#1086#1097#1072#1076#1077#1081
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 10
              object Equ: TLabel
                Left = 63
                Top = 16
                Width = 6
                Height = 13
                Caption = '='
              end
              object Sum: TEdit
                Left = 9
                Top = 13
                Width = 50
                Height = 19
                TabOrder = 0
              end
              object NewSum: TEdit
                Left = 84
                Top = 13
                Width = 50
                Height = 19
                TabOrder = 1
              end
            end
            object Edit1: TEdit
              Left = 275
              Top = 37
              Width = 20
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 12
              Text = '8'
            end
          end
        end
        object Page2: TTabSheet
          Caption = #1057#1077#1090#1082#1072' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
          ImageIndex = 3
          object NodeTypeNew: TGroupBox
            Left = 9
            Top = 141
            Width = 112
            Height = 36
            Caption = #1058#1080#1087' '#1091#1079#1083#1072
            TabOrder = 0
            object NodeType: TComboBox
              Left = 1
              Top = 13
              Width = 96
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              Text = #1042#1085#1077#1096#1085'.'
              OnChange = NodeTypeChange
              Items.Strings = (
                #1042#1085#1077#1096#1085
                #1042#1085#1091#1090#1088)
            end
          end
          object ResElements: TGroupBox
            Left = 0
            Top = 30
            Width = 56
            Height = 107
            Caption = #1050#1069
            TabOrder = 1
            object ElementsList: TListBox
              Left = 2
              Top = 15
              Width = 52
              Height = 90
              Align = alClient
              ItemHeight = 13
              TabOrder = 0
              OnClick = ElementsListClick
            end
          end
          object ResNodes: TGroupBox
            Left = 70
            Top = 30
            Width = 49
            Height = 107
            Caption = #1059#1079#1083#1099
            TabOrder = 2
            object NodesList: TListBox
              Left = 2
              Top = 15
              Width = 45
              Height = 90
              Align = alClient
              ItemHeight = 13
              TabOrder = 0
              OnClick = NodesListClick
            end
          end
          object Coords: TGroupBox
            Left = 134
            Top = 30
            Width = 80
            Height = 164
            Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099
            TabOrder = 3
            object GroupBox5: TGroupBox
              Left = 2
              Top = 15
              Width = 76
              Height = 56
              Align = alTop
              Caption = #1058#1077#1082#1091#1097#1080#1077
              TabOrder = 0
              object Label6: TLabel
                Left = 9
                Top = 18
                Width = 7
                Height = 13
                Caption = 'X'
              end
              object Label7: TLabel
                Left = 9
                Top = 37
                Width = 7
                Height = 13
                Caption = 'Y'
              end
              object oldX: TEdit
                Left = 24
                Top = 14
                Width = 41
                Height = 21
                ReadOnly = True
                TabOrder = 0
              end
              object oldY: TEdit
                Left = 24
                Top = 32
                Width = 41
                Height = 21
                ReadOnly = True
                TabOrder = 1
              end
            end
            object GroupBox6: TGroupBox
              Left = 2
              Top = 71
              Width = 76
              Height = 91
              Align = alClient
              Caption = #1053#1086#1074#1099#1077
              TabOrder = 1
              object Label8: TLabel
                Left = 11
                Top = 17
                Width = 7
                Height = 13
                Caption = 'X'
              end
              object Label9: TLabel
                Left = 11
                Top = 37
                Width = 7
                Height = 13
                Caption = 'Y'
              end
              object NewY: TEdit
                Left = 24
                Top = 34
                Width = 41
                Height = 21
                TabOrder = 0
                OnEnter = NewYEnter
                OnExit = NewYExit
              end
              object NewX: TEdit
                Left = 24
                Top = 14
                Width = 41
                Height = 21
                TabOrder = 1
                OnEnter = NewXEnter
                OnExit = NewXExit
              end
              object Repair: TButton
                Left = 4
                Top = 57
                Width = 69
                Height = 31
                Caption = #1042#1077#1088#1085#1091#1090#1100
                TabOrder = 2
                OnClick = RepairClick
              end
            end
          end
          object INOUT: TGroupBox
            Left = 216
            Top = 32
            Width = 102
            Height = 58
            Caption = #1042#1099#1076#1077#1083#1077#1085#1080#1077' '#1091#1079#1083#1086#1074
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            TabOrder = 4
            object UseInNodes: TRadioButton
              Left = 10
              Top = 15
              Width = 81
              Height = 16
              Caption = #1042#1085#1091#1090#1088#1077#1085#1085#1080#1077
              TabOrder = 0
              OnClick = UseInNodesClick
            end
            object UseOUTNodes: TRadioButton
              Left = 10
              Top = 30
              Width = 75
              Height = 14
              Caption = #1042#1085#1077#1096#1085#1080#1077
              TabOrder = 1
              OnClick = UseOUTNodesClick
            end
            object UseALLNodes: TRadioButton
              Left = 10
              Top = 43
              Width = 73
              Height = 14
              Caption = #1042#1089#1077' '#1091#1079#1083#1099
              Checked = True
              TabOrder = 2
              TabStop = True
              OnClick = UseALLNodesClick
            end
          end
          object BitBtn1: TBitBtn
            Left = 11
            Top = 1
            Width = 83
            Height = 28
            Caption = #1050#1069' '#1080' '#1091#1079#1083#1099
            TabOrder = 6
            OnClick = BitBtn1Click
          end
          object btnShowBlockedNodes: TButton
            Left = 118
            Top = 1
            Width = 92
            Height = 28
            Caption = #1041#1083#1086#1082#1080#1088'-'#1099#1077' '#1091#1079#1083#1099
            TabOrder = 5
            OnClick = btnShowBlockedNodesClick
          end
        end
      end
    end
    object GroupBox7: TGroupBox
      Left = 0
      Top = 408
      Width = 336
      Height = 119
      Align = alClient
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      TabOrder = 4
      object Memo1: TMemo
        Left = 2
        Top = 15
        Width = 332
        Height = 102
        Align = alClient
        MaxLength = 9999999
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 453
    Height = 531
    Align = alClient
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 2
    object PaintBox1: TPaintBox
      Left = 1
      Top = 1
      Width = 451
      Height = 529
      Cursor = crCross
      Align = alClient
      OnClick = PaintBox1Click
      OnMouseDown = PaintBox1MouseDown
      OnMouseMove = PaintBox1MouseMove
      OnMouseUp = PaintBox1MouseUp
      OnPaint = PaintBox1Paint
    end
  end
  object ImageList1: TImageList
    Left = 626
    Top = 30
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FF000000FF00
      0000FF000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FF00
      000000000000FF000000FF0000000000000000000000FF000000FF0000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FF00
      000000000000FF000000FF0000000000000000000000FF000000FF0000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000FF000000FF00
      0000FF000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF000000000000000000FF000000FF000000FF00
      0000FF000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000000000008400000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F807FFFFFFFB0000F807FFFFFFD70000
      F8070000FFCF0000F00307E0C8870000E00347E2DFDF0000C0016996FFFF0000
      80017E7EDFDF000000017E7EDFDF000000006996FFFF0000800047E2DFDF0000
      E00007E0DFDF0000E0000000FFFF0000C0050000DFDF0000C0070000C91F0000
      E40F0000FFFF0000FE7FFFFFFFFF0000FF9FFFFFFFFFFFFFFF0FFFFBFFFBAAAA
      FF0FFFF1FFF1FFFFEE1FFFE3FFE3BFC2E61FF047F047FFE3E03FEB8FEB8FBFC2
      E03FD7DFD7DFFFCBE007ADEFAFEF803EE00F9DEF9FEF803FE01FB06FB06F803E
      E03FBDCFBFCF803FE07FBDAFBFAF803EE0FFDF5FDF5F803FE1FFEEBFEEBF802A
      E3FFF07FF07FFFFFE7FFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
