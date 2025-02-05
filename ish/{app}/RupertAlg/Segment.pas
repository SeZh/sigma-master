{*********************************************************************}
{                                                                     }
{                    ���������� ����������� ��������                  }
{                                                                     }
{                               ������� 609                           }
{                                                                     }
{                         ����� ���� ������� 2008                     }
{                                                                     }
{		    	                (����� ��������� �����)		                  }
{*********************************************************************}

unit Segment;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  StdCtrls, ComCtrls, ExtCtrls, Buttons, ImgList, ToolWin, IniFiles, ExtDlgs,
  TSigmaForm, ResFunc;

const
  HandAct  = 1;
  HandPas  = 2;
  ZoomIn   = 3;
  Zoomout  = 4;
  ZoomArea = 5;
  CM_Inch = 2.5428571428571428571428571428571;
  cursorcrosdx = 3;

type
// ������ ��� �������� ��������� ���
     ZoneStruct = Record
               ZoneNum    : word;      // ����� ����
               NodesNum   : Array [0..7] of word;      // ������ �����
               NodesCoord : Array [0..1,0..7] of real;      // ���������� �����
     End;
     TZoneInfo = Array [0..20] of ZoneStruct;
   TArrayElemNode = Array [0..3] of TMyNode;
// �����
  TSegment = class(TForm)
    BitBtn1: TBitBtn;
    ResElements: TGroupBox;
    ResNodes: TGroupBox;
    StatusBar1: TStatusBar;
    PaintBox1: TPaintBox;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    DefaultAction: TToolButton;
    ZoomInAction: TToolButton;
    ZoomOutAction: TToolButton;
    ZoomAreaAction: TToolButton;
    MoveAction: TToolButton;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    ChouseArea: TToolButton;
    Splitter1: TSplitter;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    LabelScale: TLabel;
    TrackBar1: TTrackBar;
    EditScale: TEdit;
    GroupBox2: TGroupBox;
    UseGridEps: TCheckBox;
    UseGrid: TCheckBox;
    UseBuffer: TCheckBox;
    UseNodeNum: TCheckBox;
    UseZoneNum: TCheckBox;
    GroupBox4: TGroupBox;
    LabelNodeCordX: TLabel;
    LabelNodeCordY: TLabel;
    LabelCurNode: TLabel;
    LabelCurZone: TLabel;
    CurZone: TComboBox;
    CurNode: TComboBox;
    EditX: TEdit;
    EditY: TEdit;
    ZoneNum: TLabel;
    Panel3: TPanel;
    RadioCM: TRadioButton;
    RadioMM: TRadioButton;
    RadioDM: TRadioButton;
    RadioM: TRadioButton;
    ElementsList: TListBox;
    NodesList: TListBox;
    Coords: TGroupBox;
    oldX: TEdit;
    oldY: TEdit;
    NewY: TEdit;
    NewX: TEdit;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox7: TGroupBox;
    Memo1: TMemo;
    UseForm: TCheckBox;
    UseResult: TCheckBox;
    GroupBox8: TGroupBox;
    MainForm: TRadioButton;
    MainRes: TRadioButton;
    MainNone: TRadioButton;
    UseNodeRes: TCheckBox;
    UseElements: TCheckBox;
    UpDownFontFnode: TUpDown;
    FontFnode: TEdit;
    UpDownFontFzone: TUpDown;
    FontFzone: TEdit;
    UpDownFontRnode: TUpDown;
    FontRnode: TEdit;
    UpDownFontRelem: TUpDown;
    btncompilenow: TButton;
    Bound: TGroupBox;
    UseShowBound: TCheckBox;
    UpDownSizeBound: TUpDown;
    SizeBound: TEdit;
    UseBlockBound: TCheckBox;
    UseBlockNodes: TCheckBox;
    Size: TLabel;
    btnShowBlockedNodes: TButton;
    ReLoadResBTN: TButton;
    ManualShow: TPageControl;
    Page1: TTabSheet;
    Page2: TTabSheet;
    SettingsRes: TGroupBox;
    FormPointSize: TLabel;
    UpDownFontFPointSize: TUpDown;
    FontFPointSize: TEdit;
    ResPointSize: TLabel;
    FontRPointSize: TEdit;
    UpDownFontRPointSize: TUpDown;
    UseBlockINOUT: TCheckBox;
    INOUT: TGroupBox;
    UseInNodes: TRadioButton;
    UseOUTNodes: TRadioButton;
    UseINOUTNodes: TCheckBox;
    Sum: TEdit;
    Equ: TLabel;
    NewSum: TEdit;
    Sums: TGroupBox;
    Truncs: TGroupBox;
    UpDownMinTrunc: TUpDown;
    MinTrunc: TEdit;
    Label1: TLabel;
    MinTruncInMesh: TEdit;
    Label2: TLabel;
    NodeTypeNew: TGroupBox;
    NodeType: TComboBox;
    Repair: TButton;
    UseALLNodes: TRadioButton;
    Edit1: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    Procedure PaintBox1Click(Sender: TObject);
    Procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
                                 Shift: TShiftState; X, Y: Integer);
    Procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
                                 Y: Integer);
    Procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
                               Shift: TShiftState; X, Y: Integer);
    Procedure PaintBox1Paint(Sender: TObject);
    Procedure TrackBar1Change(Sender: TObject);
    Procedure EditScaleKeyDown(Sender: TObject; Var Key: Word;
                               Shift: TShiftState);
    Procedure UseGridClick(Sender: TObject);
    Procedure NewXExit(Sender: TObject);
    Procedure NewYExit(Sender: TObject);
    Procedure CurNodeChange(Sender: TObject);
    procedure ChangeActionClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure EditScaleExit(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
//b:::::::::::::::
    procedure UseNodeNumClick(Sender: TObject);
    procedure UseZoneNumClick(Sender: TObject);
    procedure RadioCMClick(Sender: TObject);
    procedure RadioMMClick(Sender: TObject);
    procedure RadioDMClick(Sender: TObject);
    procedure RadioMClick(Sender: TObject);
// �����
    procedure FormShow(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
// ����
    procedure BitBtn1Click(Sender: TObject);
    procedure ElementsListClick(Sender: TObject);
    procedure NodesListClick(Sender: TObject);
// ����������
    procedure btncompilenowClick(Sender: TObject);
    procedure UseFormClick(Sender: TObject);
    procedure UseResultClick(Sender: TObject);
    procedure UseNodeResClick(Sender: TObject);
    procedure UseElementsClick(Sender: TObject);
    procedure UpDownFontFnodeChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure UpDownFontFzoneChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure UpDownFontRnodeChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure UpDownFontRelemClick(Sender: TObject; Button: TUDBtnType);
    procedure NewXEnter(Sender: TObject);
    procedure NewYEnter(Sender: TObject);
    procedure UseShowBoundClick(Sender: TObject);
    procedure UpDownSizeBoundChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure UseBlockNodesClick(Sender: TObject);
    procedure btnShowBlockedNodesClick(Sender: TObject);
    procedure ReLoadResBTNClick(Sender: TObject);
    procedure UpDownFontFPointSizeChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure UpDownFontRPointSizeChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure UseINOUTNodesClick(Sender: TObject);
    procedure MainResClick(Sender: TObject);
    procedure MainFormClick(Sender: TObject);
    procedure MainNoneClick(Sender: TObject);
    procedure NodeTypeChange(Sender: TObject);
    procedure CurZoneChange(Sender: TObject);
    procedure UseBlockBoundClick(Sender: TObject);
    procedure RepairClick(Sender: TObject);
    procedure UseInNodesClick(Sender: TObject);
    procedure UseOUTNodesClick(Sender: TObject);
    procedure UseALLNodesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dx, dy : MyReal;
    ActiveToolButton: TToolButton;
    ActiveRadio: TRadioButton;
    MousePushed:boolean;
    Dim_Modified : boolean;
    Procedure Scaling;
    Procedure SetScale;
    Procedure MainRePaint;
    Procedure SetDiapazon;
    Procedure ShowNodeInfo;
    Procedure ChangeDrawSize;
    Procedure UpdateVizParams;
    Procedure ZoomAreaRect(x1,y1,x2,y2:MyReal);
    Procedure ShowForm;
    procedure LoadForm(Name:string);
    procedure SaveForm(Name:string);
    procedure CheckBaseRegKeysForSegments;
    Procedure SetBaseRegKeysForSegments(Name : String);
    Function CheckPointZone(X:Real;Y:Real):boolean;
    procedure GetListBlockedNodes;
    function CheckListBlockedNodes(Node: Integer):boolean;
    procedure ReLoadResult;
    function CheckEditNodeInElement(Node: Integer;NewX:Real;NewY:Real):boolean;
  end;

var
  SegF: TSegment;
{ ����������� }
  ZoneInfo     : TZoneInfo;
  ZoneCount    : integer;
  PrevDim      : integer;
  BmpPic       : TBitMap;
  dop          : integer;
implementation

USES Math, MainInterface, Strfunc, Registry, PrnServ,FStruct, Main;

Const
  paintdx= 10;
  paintdy= 10;
Var
  GridOffSet              : MyReal;
  PaintWidth, PaintHeight : integer;
  Scale                   : MyReal;
  HighLightNode           : word;
  MouseX, MouseY          : MyReal;
  MovedNode               : word;
  DownX,DownY             : integer;
  CenterX,CenterY         : integer;
  OffsetX,OffsetY         : MyReal;
  SOffsetX,SOffsetY       : MyReal;
  FigureX,FigureY         : MyReal;
  CM                      : MyReal;
  FloatFormat             : string;
  Area                    : TArea;
  LastCoordX,LastCoordY   : real;
  LastNode                : Integer;
{$R *.DFM}
function MyFloatToStr(X:MyReal):String;
  begin Result:=FormatFloat(FloatFormat,X); end;

function MyDiv(x,y:MyReal):MyReal;
  begin if abs(y)<0.1E-4900 then Result:=0.1E-4900 else Result:=x/y; end;

Function Xreal2Xpaint(x:myreal):integer;
Var
  xx : MyReal;
Begin
  xx:=(OffsetX+(x-FigureX))*Scale*CM;
  If xx>32000 Then xx:=32000;
  Result:=CenterX+Round(xx);
End;

Function Yreal2Ypaint(y:myreal):integer;
Var
  yy : MyReal;
Begin
  yy:=(OffsetY+(y-FigureY))*Scale*CM;
  If yy>32000 Then yy:=32000;
  Result:=CenterY-Round(yy);
End;

Function Xpaint2Xreal(x:integer):myreal;
Begin
  if abs(Scale)<0.1E-15 then Scale:=0.1E-15;
  Result:=MyDiv((x-CenterX),Scale*CM)-OffsetX+FigureX;
End;

Function Yp2Yr(y:integer):myreal;
Begin
  if abs(Scale)<0.1E-15 then Scale:=0.1E-15;
  Result:=MyDiv((y-CenterY),Scale*CM)-OffsetY+FigureY;
End;

Function Ypaint2Yreal(y:integer):myreal;
  Begin Result:=Yp2Yr(PaintHeight-y); End;


// ��������� ���������� ������� ������� ����������� � ��������� ���
Procedure GetZoneInfo;
Var
  MainParams         : TMainParams;
  CountOfNodes, i, j : word;
  OneNode            : TNode;
//  CountOfEdges       : word;
Begin  
  MainParams:=GetMainParam;
  CountOfNodes:=Form_CountOfNodesInZone;
  ZoneCount := MainParams.INRG;
  If MainParams.INRG>0 Then
  Begin
    For i:=0 To MainParams.INRG-1 Do
    Begin
      For j:=0 To CountOfNodes-1 Do
      Begin
        OneNode:=Form_GetNodeValue(Form_GetNodeNumber(i,j));
        ZoneInfo[i].ZoneNum := i;
        ZoneInfo[i].NodesNum[j] := OneNode.Number;
        ZoneInfo[i].NodesCoord[0,j] := OneNode.x;
        ZoneInfo[i].NodesCoord[1,j] := OneNode.y;
      End;
    End;
  End;
End;
{************************** ����������� �������� *************************}
Procedure TSegment.PaintBox1Paint(Sender: TObject);
Var
Bitmap : TBitMap;
  Procedure ShowGrid(Canvas:TCanvas);
  Var
    i, x, y   : integer;
  Begin
    With Canvas Do Begin
      Pen.Width:=1;
      i:=0;
      y:=Yreal2Ypaint(i*GridOffSet);
      While y<=PaintHeight Do begin
        dec(i);
        y:=Yreal2Ypaint(i*GridOffSet);
      end;
      While y>=0 Do Begin
        if i<>0 then begin
          if (i mod 10)=0 then Pen.Color:=clBlack
          else Pen.Color:=clSilver;
          MoveTo(0,y);
          LineTo(PaintWidth,y);
        end;
        inc(i);
        y:=Yreal2Ypaint(i*GridOffSet);
      End;
      i:=0;
      x:=Xreal2Xpaint(i*GridOffSet);
      While x>=0 Do Begin
        dec(i);
        x:=Xreal2Xpaint(i*GridOffSet);
      End;
      While x<=PaintWidth Do Begin
        if i<>0 then begin
          if (i mod 10)=0 then Pen.Color:=clBlack
          else Pen.Color:=clSilver;
          MoveTo(x,0);
          LineTo(x,PaintHeight);
        end;
        inc(i);
        x:=Xreal2Xpaint(i*GridOffSet);
      End;
      Pen.Width:=3;
      Pen.Color:=clBlack;
      MoveTo(Xreal2Xpaint(0),0);
      LineTo(Xreal2Xpaint(0),PaintHeight);
      MoveTo(0,Yreal2Ypaint(0));
      LineTo(PaintWidth,Yreal2Ypaint(0));
      Pen.Width:=1;
    End;
  End;

  Procedure ShowZones(Active:word;Canvas:TCanvas);//offset �Zone+1
  Var
    CountOfNodes, count, i, j : word;
    FirstX, FirstY            : MyReal;
    ShowLast, ExistFirst      : boolean;
    OneNode                   : TNode;
    x, y                      : integer;
    Point                     : integer;
    MainParams                : TMainParams;
    NNode                     : word;
//b::::::::::::::::::::::::::
// ��������� ����������� ������� �����
    Procedure ShowNodeNum(Canvas:TCanvas;Point:integer);
    Var
      CountOfNodes, i, j, k : word;
      Node                  : TNode;
      MainParams            : TMainParams;
      S                     : string;
    Begin
      MainParams:=GetMainParam;
      CountOfNodes:=Form_CountOfNodesInZone;
      k := 0;
      With Canvas Do Begin
        Brush.Style:= bsDiagCross;
        Brush.Color := clWhite;
        For j:=0 To MainParams.INRG-1 Do Begin
          For i:=0 To CountOfNodes-1 Do Begin
            Node:=Form_NodeValue(k);
            If Node.Number>0 Then Begin
                Font.Color:=  clBlue;
                if MainForm.Checked then begin
                  S:=FloatToStr(Node.Number);
                  Font.Size :=  StrToInt(FontFnode.Text);
                end
                else begin
                  S:='('+FloatToStr(Node.Number)+')';
                  Font.Size :=  8;
                end;  
              TextOut(Round(Xreal2Xpaint(Node.X))+ Point,
                      Round(Yreal2Ypaint(Node.Y))+ Point,S);
            End;
            inc (k);
          End;
        End;
      End;
    End;
// ��������� ����������� ������� ���
    Procedure ShowZoneNum(Canvas:TCanvas;n:integer);
    Var
    MainParams                  : TMainParams;
    i, CountOfNodes             : word;
    x0,y0,x2,y2,x4,y4,x6,y6,x,y : real;
    S                           : string;
    Begin
      MainParams:=GetMainParam;
      CountOfNodes:=Form_CountOfNodesInZone;
      With Canvas Do Begin
        If MainParams.INRG>0 Then Begin
          GetZoneInfo;
          For i:=0 To MainParams.INRG-1-n Do Begin
            If CountOfNodes=8 Then
              Begin
                x0 := ZoneInfo[i].NodesCoord[0,0];
                x2 := ZoneInfo[i].NodesCoord[0,2];
                x4 := ZoneInfo[i].NodesCoord[0,4];
                x6 := ZoneInfo[i].NodesCoord[0,6];
                y0 := ZoneInfo[i].NodesCoord[1,0];
                y2 := ZoneInfo[i].NodesCoord[1,2];
                y4 := ZoneInfo[i].NodesCoord[1,4];
                y6 := ZoneInfo[i].NodesCoord[1,6];
                 x := ((x0+x4)/2+(x2+x6)/2)/2;
                 y := ((y0+y4)/2+(y2+y6)/2)/2;
                Brush.Color := clWhite;
                Brush.Style:= bsDiagCross;
                Font.Color := clFuchsia;
                if MainForm.Checked then begin
                  S:=IntToStr(ZoneInfo[i].ZoneNum+1);
                  Font.Size :=  StrToInt(FontFzone.Text);
                end
                else begin
                  S:='Zone('+IntToStr(ZoneInfo[i].ZoneNum+1)+')';
                  Font.Size :=  12;
                end;  
                TextOut(Round(Xreal2Xpaint(x)),Round(Yreal2Ypaint(y)),S);
              End;
            End;
          End;
        End;
      End;
//e:::::::::::::::::::::::
  Begin
    MainParams:=GetMainParam;
    CountOfNodes:=Form_CountOfNodesInZone;
    count:=MainParams.INRG;
// ������ ������ ����� �����
//    Point:=round(EpsilonVicinity/2);
//  IF MainForm.Checked then Point:=round(EpsilonVicinity/2) else Point:=1;
  IF MainForm.Checked then Point:=StrToInt(FontFPointSize.text) else Point:=1;
    With Canvas Do Begin
      IF MainForm.Checked then Pen.Width:=2 else Pen.Width:=1;
      pen.Mode:=pmMask;     //�����
      Pen.Color:=clBlue;
      If count>0 Then Begin
        For i:=0 To count-1 Do//������� ���
        Begin
          ShowLast:=false;
          ExistFirst:=false;
          Pen.Color:=clBlue;
          For j:=0 To CountOfNodes-1 Do//������� ����� ����
          Begin
            NNode:=Form_GetNodeNumber(i,j);
            If NNode<>0 Then Begin
              OneNode:=Form_GetNodeValue(NNode);
              x:=Xreal2Xpaint(OneNode.x);
              y:=Yreal2Ypaint(OneNode.y);
              If OneNode.Number=MovedNode Then Begin
                pen.Color   := clGreen;
                brush.color := clGreen;
                brush.style := bsSolid;
                Ellipse(x-Point,y-Point,x+Point,y+Point);
                pen.Color:=clBlue;
              End
              Else Begin
                If OneNode.Number=Active Then Begin
                  pen.Color   := clRed;
                  brush.color := clRed;
                  brush.style := bsSolid;
                  Ellipse(x-Point,y-Point,x+Point,y+Point);
                  pen.Color:=clBlue;
                End
                Else Begin
                  Pen.Color:=clBlue;
                  IF MainForm.Checked then brush.color:=clGreen else brush.color:=clBlue;
                  brush.style := bsSolid;
                  Ellipse(x-Point,y-Point,x+Point,y+Point);
                End;
              End;
              If (MainParams.INRG-1=i) and (not Form_ZoneFinished) Then pen.Color:=clRed;
              If j=0 Then Begin
                FirstX:=OneNode.x;
                FirstY:=OneNode.y;
                MoveTo(x,y);
                ExistFirst:=true;
              End
              Else LineTo(x,y);
              If j=CountOfNodes-1 Then ShowLast:=true;
            End
            Else Begin
              If ExistFirst Then lineto(Xreal2Xpaint(MouseX),Yreal2Ypaint(MouseY));
            End;
          End;
          If ShowLast Then LineTo(Xreal2Xpaint(FirstX),Yreal2Ypaint(FirstY));
        End;
      End;
    End;
//b::::::::::::::::::::::
// �������� �� ������� CheckBox'��, ���������� �� ����������� ������� ����� � ���
    If UseNodeNum.Checked Then ShowNodeNum(Canvas,Point);
    If UseZoneNum.Checked Then Begin
      If ShowLast Then ShowZoneNum(Canvas,0)
      Else ShowZoneNum(Canvas,1);
    End;
  End;

//���������� ��� ��������
  PROCEDURE ShowElements(Active:word;Canvas:TCanvas);
  VAR
//    OneElement : TElementOne;
    OneElement : TMyElement;
    Node       : TArrayElemNode;
    my         : integer;
//���������� ���� �������
    PROCEDURE ShowElement(Active:word;Canvas:TCanvas;OneElement:TMyElement; Node: TArrayElemNode);
    VAR
        j                         : integer;
        FirstX, FirstY            : Real;
        ShowLast, ExistFirst      : boolean;
        OneNode                   : TMyNode;
        x, y                      : integer;
        Point                     : integer;
        num                       : Array [0..3] of Integer;
        x1, y1                    : Array [0..3] of real;
      PROCEDURE ShowElementText(Canvas:TCanvas;x,y:INTEGER;S:STRING);
      VAR
        h,w:INTEGER;
      BEGIN
        With Canvas Do Begin
          Brush.Color := clWhite;
          Brush.Style:= bsDiagCross;
          if MainRes.Checked then begin
            Font.Color := clGreen;
            //Font.Size :=  StrToInt(FontRelem.Text);
          end
          else begin
            Font.Size :=  10;
            Font.Color := clBlack;
            S:='('+S+')';
            Font.Color := clLime;
          end;
          h:=ROUND(Canvas.TextHeight(s)/2);
          w:=ROUND(Canvas.TextWidth(s)/2);
          Canvas.TextOut(x-w,y-h,s);
        end;
      END;
      PROCEDURE ShowNodeText(Canvas:TCanvas;x,y:INTEGER;S:STRING);
      VAR
        h,w:INTEGER;
      BEGIN
        With Canvas Do Begin
          Brush.Color := clWhite;
          Brush.Style:= bsDiagCross;
          if MainRes.Checked then begin
            Font.Color := clTeal;
            Font.Size :=  StrToInt(FontRnode.Text);
            h:=ROUND(Canvas.TextHeight(s))+StrToInt(FontRPointSize.text);
            w:=ROUND(Canvas.TextWidth(s))+StrToInt(FontRPointSize.text);
          end
          else begin
            Font.Color := clBlack;
            Font.Size :=  8;
            S:='('+S+')';
            h:=ROUND(Canvas.TextHeight(s))+1;
            w:=ROUND(Canvas.TextWidth(s))+1;
          end;
          Canvas.TextOut(x-w,y-h,s);
        end;
      END;
// �������� ���� �������
    BEGIN
// �������� �� ������� CheckBox'��, ���������� �� ����������� ������� ����� � ���������
      For j:=0 To 2 Do Begin
        OneNode:=Node[j]; num[j]:=OneNode.Number; x1[j]:=OneNode.x; y1[j]:=OneNode.y;
      end;
      If UseNodeRes.Checked Then begin
        For j:=0 To 2 Do Begin
          ShowNodeText(Canvas, Round(Xreal2Xpaint(x1[j])),Round(Yreal2Ypaint(y1[j])),IntToStr(Upload.Find(num[j])));
        end;
      end;
        x:=Xreal2Xpaint((x1[0]+x1[1]+x1[2])/3);
        y:=Yreal2Ypaint((y1[0]+y1[1]+y1[2])/3);
      IF UseElements.Checked THEN ShowElementText(Canvas, Round(x),Round(y),
                                            IntToStr(OneElement.Number));
//    If UseElements.Checked Then Begin
//      If ShowLast Then // ���� ��������� ���
//      Else // ���� �� ��
//    End;
//      IF MainRes.Checked then Point:=round(EpsilonVicinity/2) else Point:=1;
      IF MainRes.Checked then Point:=StrToInt(FontRPointSize.Text) else Point:=1;
// ������..........
      With Canvas Do Begin
        IF MainRes.Checked then Pen.Width:=2 else Pen.Width:=1;
        pen.Mode:=pmMask; // �����
        Pen.Color:=clBlack;
        ShowLast:=false;
        ExistFirst:=false;
        For j:=0 To 2 Do//������� ����� ����
        Begin
          if Node[j].Number<>0 then begin
/////////////////// ��� ����� ���������! ������ ������ ���� �������, ���� ���������� ����
{            If UseINOUTNodes.Checked then begin
              if UseOUTNodes.Checked then begin
                if list.ResNodes.Nodes[upload.Find(Node[j].Number)].inf.InOut then
                  Point:=StrToInt(FontRPointSize.Text)
                else Point:=1;
              end
              else begin
                if not list.ResNodes.Nodes[upload.Find(Node[j].Number)].inf.InOut then
                  Point:=StrToInt(FontRPointSize.Text)
                else Point:=1;
              end;
            end;}
              if UseALLNodes.Checked then Point:=StrToInt(FontRPointSize.Text)
              else if UseOUTNodes.Checked then begin
                if list.ResNodes.Nodes[upload.Find(Node[j].Number)].inf.InOut then
                  Point:=StrToInt(FontRPointSize.Text)
                else Point:=1;
              end  
              else begin
                if not list.ResNodes.Nodes[upload.Find(Node[j].Number)].inf.InOut then
                  Point:=StrToInt(FontRPointSize.Text)
                else Point:=1;
              end;
/////////////////// ����������
            OneNode:=Node[j];
            x:=Xreal2Xpaint(OneNode.x);
            y:=Yreal2Ypaint(OneNode.y);
            If OneNode.Number=MovedNode Then Begin
              pen.Color   := clGreen;
              brush.color := clGreen;
              brush.style := bsSolid;
              Ellipse(x-Point,y-Point,x+Point,y+Point);
              pen.Color:=clBlue;
            End
            Else Begin
              If OneNode.Number=Active Then Begin
                pen.Color   := clRed;
                brush.color := clRed;
                brush.style := bsSolid;
                Ellipse(x-Point,y-Point,x+Point,y+Point);
               // IF MainRes.Checked then pen.Color:=clBlack else pen.Color:=clBlue;
                pen.Color:=clBlack;
              End
              Else Begin
                //IF MainRes.Checked then pen.Color:=clBlack else pen.Color:=clBlue;
                pen.Color:=clBlack;
                IF MainRes.Checked then brush.color:=clYellow else brush.color:=clPurple;
                brush.style := bsSolid;
                Ellipse(x-Point,y-Point,x+Point,y+Point);
              End;
            End;
            If j=0 Then Begin
              FirstX:=OneNode.x;
              FirstY:=OneNode.y;
              MoveTo(x,y);
              ExistFirst:=true;
            End
            Else LineTo(x,y);
            If j=2 Then ShowLast:=true;
          End
          Else Begin
            If ExistFirst Then lineto(Xreal2Xpaint(MouseX),Yreal2Ypaint(MouseY));
          End;
        End;
        If ShowLast Then LineTo(Xreal2Xpaint(FirstX),Yreal2Ypaint(FirstY));
      End;
    END;
// ���������� ��� ����������� ��������
  BEGIN
      for my:=1 to list.ResElements.Count do begin
          oneElement.Number:=list.ResElements.Elements[my].Number;
          Node[0]:=list.ResNodes.Nodes[Upload.Find(list.ResElements.Elements[my].Node1)];
          Node[1]:=list.ResNodes.Nodes[Upload.Find(list.ResElements.Elements[my].Node2)];
          Node[2]:=list.ResNodes.Nodes[Upload.Find(list.ResElements.Elements[my].Node3)];
        ShowElement(Active,Canvas,OneElement,Node);
      end;
  END;
// ���������� �������
  procedure ShowBound(Canvas:TCanvas);
  var
    CountOfNodes, count, i, j : word;
    FirstX, FirstY            : Real;
    ShowLast, ExistFirst      : boolean;
    OneNode                   : TNode;
    x, y                      : integer;
    MainParams                : TMainParams;
    NNode                     : word;
    Size                      : integer;
  begin
      MainParams:=GetMainParam;
      CountOfNodes:=Form_CountOfNodesInZone;
      count:=MainParams.INRG;
      With Canvas Do Begin
        Pen.Width:=StrToInt(SizeBound.Text)*(round(abs(2*Scale*CM)/10) div 1);
        Pen.Color:=$00D36BFF;
        pen.Style:=psDot;
      pen.Mode:=pmMask;
        If count>0 Then Begin
          For i:=0 To count-1 Do//������� ���
          Begin
// �������
            ShowLast:=false;
            ExistFirst:=false;
            Pen.Color:=$00D36BFF;
            pen.Style:=psDot;
            pen.Mode:=pmMask;
            For j:=0 To CountOfNodes-1 Do//������� ����� ����
            Begin
              NNode:=Form_GetNodeNumber(i,j);
              If NNode<>0 Then Begin
                OneNode:=Form_GetNodeValue(NNode);
                x:=Xreal2Xpaint(OneNode.x);
                y:=Yreal2Ypaint(OneNode.y);
                If (MainParams.INRG-1=i) and (not Form_ZoneFinished) Then pen.Color:=clRed;
                If j=0 Then Begin
                  FirstX:=OneNode.x;
                  FirstY:=OneNode.y;
                  MoveTo(x,y);
                  ExistFirst:=true;
                End
                Else LineTo(x,y);
                If j=CountOfNodes-1 Then ShowLast:=true;
              End
              Else Begin
                If ExistFirst Then lineto(Xreal2Xpaint(MouseX),Yreal2Ypaint(MouseY));
              End;
            End;
            If ShowLast Then LineTo(Xreal2Xpaint(FirstX),Yreal2Ypaint(FirstY));
          End;
        End;
      End;
//    end;
  end;    
{-----------------------------------------------}
// ���������������� ��������� �� PAINTBOX
Begin
  PaintWidth:=PaintBox1.Width;
  PaintHeight:=PaintBox1.Height;
  CenterX:=Trunc(PaintWidth/2);
  CenterY:=Trunc(PaintHeight/2);
  Try
    If UseBuffer.Checked Then Begin
      Bitmap := TBitmap.Create;
      Bitmap.Width:=PaintBox1.Width;
      Bitmap.Height:=PaintBox1.Height;
    End;
    If UseGrid.Checked Then Begin
      If UseBuffer.Checked Then ShowGrid(Bitmap.Canvas)
        Else ShowGrid(PaintBox1.Canvas);
    End;
    If UseBuffer.Checked Then Begin
      If UseShowBound.Checked Then ShowBound(Bitmap.Canvas);
      if UseForm.Checked then ShowZones(HighLightNode,BitMap.Canvas);
      if UseResult.Checked then ShowElements(HighLightNode,BitMap.Canvas);
      paintbox1.Canvas.Draw(0,0,BitMap);
    End
    Else begin
      If UseShowBound.Checked Then ShowBound(PaintBox1.Canvas);
      if UseForm.Checked then ShowZones(HighLightNode,PaintBox1.Canvas);
      if UseResult.Checked then ShowElements(HighLightNode,PaintBox1.Canvas);
    end;
  Finally
    If UseBuffer.Checked Then begin
//�������� ����������� � �������������� ����������
      bmpPic.Width:=Bitmap.Width;
      bmpPic.Height:=Bitmap.Height;
      bmpPic.Canvas.Draw(0,0,BitMap);
      Bitmap.Free;
    end;
  End;
End;

Procedure TSegment.TrackBar1Change(Sender: TObject);
var
  Half, Value : MyReal;
Begin
  Half:=round((TrackBar1.Max)/2);
  Value:=abs(TrackBar1.Position-Half);
  If TrackBar1.Position>=Half Then Scale:=1+Value
  Else Scale:=1/(1+Value);
  Scaling;
  MainRePaint;
End;

procedure TSegment.EditScaleExit(Sender: TObject);
  begin  SetDiapazon;  end;

Procedure TSegment.EditScaleKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
  If Key=VK_RETURN Then SetDiapazon;
End;

Procedure TSegment.PaintBox1Click(Sender: TObject);
Begin
  If MainForm.Checked then begin
    If HighLightNode<>0 Then ShowNodeInfo;
  end;
End;

////////////////////////Actions\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Procedure TSegment.Scaling;
Begin
  if Scale=0 then Scale:=0.1E-17;
  If Scale>=1 Then Begin
    LabelScale.Caption:=MyFloatToStr(Scale)+' : 1';
  End
  Else Begin
    LabelScale.Caption:='1 : '+MyFloatToStr(1/Scale);
  End;
  GridOffSet:=power(10,trunc(Log10(20/Scale)-1));//20 pixels
  ChangeDrawSize;
End;

Procedure TSegment.SetDiapazon;
Var
  value : integer;
  max   : integer;
  pos   : integer;
Begin
  value:=1;
  If CheckInt(EditScale.text,value) Then Begin
    if (Value<2) then begin
      EditScale.text:='2';
      Value:=2;
    end;
    Max:=TrackBar1.Max;
    pos:=TrackBar1.Position;
    TrackBar1.Max:=(value-1)*2;
    TrackBar1.Position:=Round(pos/Max*TrackBar1.Max);
    SetScale;
  End;
End;

Procedure TSegment.SetScale;
Var
  Half  : Integer;
  Value : MyReal;
Begin
  Half:=Round(TrackBar1.Max/2);
  if Scale>=1 then Value:=Scale else Value:=MyDiv(1,Scale);
  if Half<Value then begin
    Half:=Round(Value);
    TrackBar1.Max:=2*Half;
    EditScale.text:=inttostr(Half);
  end;
  if Scale>=1 then TrackBar1.Position:=Round(Half+Value-1)
  else TrackBar1.Position:=Round(Half-Value+1);
  Scaling;
End;

Procedure TSegment.ChangeDrawSize;
Begin
  Area:=Form_GetArea;
  FigureX:=(Area.maxx-Area.minx)/2;
  FigureY:=(Area.maxy-Area.miny)/2;
End;

Procedure TSegment.UpdateVizParams;
var
  MainParams  : TMainParams;
           i  : integer;
begin
  MainParams:=GetMainParam;
  ZoneNum.Caption:='���������� ���:'+inttostr(MainParams.INRG);
  CurZone.Items.Clear;
  If MainParams.INRG>0 Then Begin
    For i:=1 To MainParams.INRG Do CurZone.Items.Add(inttostr(i));
  End;
  CurNode.Items.Clear;
  If MainParams.INBP>0 Then Begin
    For i:=0 To MainParams.INBP-1 Do CurNode.Items.Add(inttostr(i+1));
  End;
  GroupBox4.Enabled:=true;
end;

Procedure TSegment.ShowNodeInfo;
Var
  CountOfNodes, i, j : word;
  Node               : TNode;
  Zone               : word;
  MainParams         : TMainParams;
Begin
  MainParams:=GetMainParam;
  CountOfNodes:=Form_CountOfNodesInZone;
  EditX.text:=MyFloatToStr(MouseX);
  EditY.text:=MyFloatToStr(MouseY);
  Node:=Form_FindNode(MouseX,MouseY,EpsilonVicinity/Scale);
  Zone:=0;
  If MainParams.INRG>0 Then Begin
    CurZone.Items.Clear;
    For i:=0 To MainParams.INRG-1 Do Begin
      For j:=0 To CountOfNodes-1 Do Begin
        If Form_GetNodeNumber(i,j)=Node.Number Then Zone:=i+1;
      End;
      CurZone.Items.Add(inttostr(i+1));
    End;
  End;
  UpdateVizParams;
  CurZone.ItemIndex:=zone-1;
  CurNode.ItemIndex:=node.number-1;
End;

Procedure TSegment.MainRePaint;
Begin
  If UseBuffer.Checked Then PaintBox1Paint(nil) Else PaintBox1.Repaint;
End;

//--------------------------- BUTTONS -----------------------------------
//���������� �������� ��� ��������
procedure TSegment.ChangeActionClick(Sender: TObject);
  Procedure ChangeAction(Sender: TToolButton);
  begin
    ActiveToolButton.Down:=false;
    Sender.Down:=true;
    ActiveToolButton:=Sender;
  end;
Begin
  ChangeAction(Sender as TToolButton);
  if ActiveToolButton=MoveAction Then //����������� �������(���������)
    PaintBox1.Cursor:= HandPas
  else if ActiveToolButton=ZoomInAction Then//�����������
    PaintBox1.Cursor:= ZoomIn
  else if ActiveToolButton=ZoomOutAction Then//���������
    PaintBox1.Cursor:= ZoomOut
  else if ActiveToolButton=ZoomAreaAction Then//����������� �����������
    PaintBox1.Cursor:= ZoomArea
  else if ActiveToolButton=DefaultAction Then //���������� ������
    PaintBox1.Cursor:= crCross;
end;

Procedure TSegment.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
  MovedNode:=HighLightNode;
  DownX:=X;
  DownY:=Y;
  if MoveAction.Down Then begin
    SOffsetX:=OffsetX;
    SOffsetY:=OffsetY;
    Screen.Cursor:= HandAct;
  end;
  LastNode:=MovedNode;
  LastCoordX:=list.ResNodes.Nodes[Upload.Find(LastNode)].X;
  LastCoordY:=list.ResNodes.Nodes[Upload.Find(LastNode)].Y;
  MousePushed:=true;
End;

Procedure TSegment.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
  if ActiveToolButton=MoveAction Then begin
    OffsetX:=SOffsetX+(Xpaint2Xreal(X)-Xpaint2Xreal(DownX));
    OffsetY:=SOffsetY+(Ypaint2Yreal(Y)-Ypaint2Yreal(DownY));
    Screen.Cursor:= crDefault;
  End
  else if ActiveToolButton=ZoomAreaAction Then begin
    if (abs(X-DownX)>5) and (abs(Y-DownY)>5) then
      ZoomAreaRect(Xpaint2Xreal(X+cursorcrosdx),
                   Ypaint2Yreal(Y+cursorcrosdx),
                   Xpaint2Xreal(DownX+cursorcrosdx),
                   Ypaint2Yreal(DownY+cursorcrosdx));
    End
    else if (ActiveToolButton=ZoomInAction) or (ActiveToolButton=ZoomOutAction) Then begin
      OffsetX:=OffsetX+(Xpaint2Xreal(CenterX)-Xpaint2Xreal(X+11));
      OffsetY:=OffsetY+(Ypaint2Yreal(CenterY)-Ypaint2Yreal(Y+11));
      if (ActiveToolButton=ZoomInAction) then TrackBar1.Position:=TrackBar1.Position+1
      else TrackBar1.Position:=TrackBar1.Position-1;
    end
  else MovedNode:=0;
  MousePushed:=false;
  MainRePaint;
End;

procedure TSegment.ZoomAreaRect(x1,y1,x2,y2:MyReal);
var
  x,y : MyReal;
begin
  if (x1<>x2) and (y1<>y2) then begin
    if x1>x2 then begin x:=x2; x2:=x1; x1:=x; end;
    if y1>y2 then begin y:=y2; y2:=y1; y1:=y; end;
    OffsetX:=FigureX-x1-(x2-x1)/2;
    OffsetY:=FigureY-y1-(y2-y1)/2;
    x:=MyDiv((CenterX*2-2*paintdx),(x2-x1)*CM);
    y:=MyDiv((CenterY*2-2*paintdy),(y2-y1)*CM);
    if x>y then Scale:=y else Scale:=x;
    SetScale;
  end;
end;

Procedure TSegment.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
Var
  node        : TNode;
  NeedRePaint : boolean;
  OneNode     : TMyNode;
  n           : INteger;
{***********************************}
  Procedure CheckEditResPointInOUT;
  begin
    oldX.Text:=MyFloatToStr(list.ResNodes.Nodes[Upload.Find(MovedNode)].X);
    oldY.Text:=MyFloatToStr(list.ResNodes.Nodes[Upload.Find(MovedNode)].Y);
    IF list.ResNodes.Nodes[Upload.Find(MovedNode)].inf.InOut  then NodeType.ItemIndex := 0  else NodeType.ItemIndex := 1; {��� ����}
    IF UseBlockINOUT.Checked then begin
     if not list.ResNodes.Nodes[Upload.Find(MovedNode)].inf.InOut then begin
       If CheckEditNodeInElement(MovedNode,MouseX,MouseY) then begin // ������ ��������������
         list.ResNodes.Nodes[Upload.Find(MovedNode)].X:=MouseX;
         list.ResNodes.Nodes[Upload.Find(MovedNode)].Y:=MouseY;
       end;
      end
      else Memo1.Lines.Add('����:'+IntToStr(Upload.Find(MovedNode))+'������ ��������');
    end
    else begin
       If CheckEditNodeInElement(MovedNode,MouseX,MouseY) then begin // ������ ��������������
         list.ResNodes.Nodes[Upload.Find(MovedNode)].X:=MouseX;
         list.ResNodes.Nodes[Upload.Find(MovedNode)].Y:=MouseY;
       end;
    end;
  end;
{***********************************}  
Begin
  if MousePushed then begin
    if ActiveToolButton=MoveAction Then begin
      OffsetX:=SOffsetX+(Xpaint2Xreal(X)-Xpaint2Xreal(DownX));
      OffsetY:=SOffsetY+(Ypaint2Yreal(Y)-Ypaint2Yreal(DownY));
      MainRePaint;
    end
    else
      if ActiveToolButton=ZoomAreaAction Then begin
        MainRePaint;
        PaintBox1.Canvas.Brush.Style:=bsClear;
        PaintBox1.Canvas.Pen.Style:=psDash;
        PaintBox1.Canvas.Rectangle(X+cursorcrosdx,
                                   Y+cursorcrosdx,
                                   DownX+cursorcrosdx,
                                   DownY+cursorcrosdx);
      end;
    end;
    if ActiveToolButton=DefaultAction Then Begin
      if MainForm.Checked then begin
        node:=Form_FindNode(Xpaint2Xreal(x),Ypaint2Yreal(y),EpsilonVicinity/(2*Scale*CM));
        NeedRePaint:=false;
        If node.Number=0 Then Begin
          MouseX:=Xpaint2Xreal(x);
          MouseY:=Ypaint2Yreal(y);
          If HighLightNode<>0 Then NeedRePaint:=true;
          HighLightNode:=0;
          StatusBar1.Panels[0].Text:='X: '+MyFloatToStr(MouseX);
          StatusBar1.Panels[1].Text:='Y: '+MyFloatToStr(MouseY);
        End
        Else Begin
          MouseX:=node.x;
          MouseY:=node.y;
          If HighLightNode<>node.Number Then NeedRePaint:=true;
          HighLightNode:=node.Number;
          StatusBar1.Panels[0].Text:='!X: '+MyFloatToStr(node.x);
          StatusBar1.Panels[1].Text:='!Y: '+MyFloatToStr(node.y);
        end;
      end
      else if MainRes.Checked then begin
        n:=Upload.FormFindResNode(Xpaint2Xreal(x),Ypaint2Yreal(y),EpsilonVicinity/(2*Scale*CM));
        OneNode:= List.ResNodes.Nodes[Upload.Find(n)];
        NeedRePaint:=false;
        If OneNode.Number=0 Then Begin
          MouseX:=Xpaint2Xreal(x);
          MouseY:=Ypaint2Yreal(y);
          If HighLightNode<>0 Then NeedRePaint:=true;
          HighLightNode:=0;
          StatusBar1.Panels[0].Text:='X: '+MyFloatToStr(MouseX);
          StatusBar1.Panels[1].Text:='Y: '+MyFloatToStr(MouseY);
        End
        Else Begin
          MouseX:=OneNode.x;
          MouseY:=OneNode.y;
          If HighLightNode<>OneNode.Number Then NeedRePaint:=true;
          HighLightNode:=OneNode.Number;
          StatusBar1.Panels[0].Text:='!X: '+MyFloatToStr(OneNode.x);
          StatusBar1.Panels[1].Text:='!Y: '+MyFloatToStr(OneNode.y);
        end
      end
      else begin
          MouseX:=Xpaint2Xreal(x);
          MouseY:=Ypaint2Yreal(y);
          StatusBar1.Panels[0].Text:='!X: '+MyFloatToStr(X);
          StatusBar1.Panels[1].Text:='!Y: '+MyFloatToStr(Y);
      End;
    If ((Form_ZoneFinished) Or (MovedNode<>0))and MainForm.Checked Then Begin
      If UseGridEps.Checked Then Begin
        MouseX:=Round(MouseX/GridOffSet)*GridOffSet;
        MouseY:=Round(MouseY/GridOffSet)*GridOffSet;
      End;
      NeedRePaint:=true;
    End;
    If (MovedNode<>0) then begin
{      if MainForm.Checked and not UseBlockNodes.Checked Then Form_SetNodeValue(MovedNode,MouseX,MouseY);}
      if MainRes.Checked then begin
        if UseBlockBound.Checked and UseBlockNodes.Checked then {���� ���� ����������� ������� � ��������� ���� �����}
          if not CheckListBlockedNodes(MovedNode) and CheckPointZone(MouseX,MouseY) then  CheckEditResPointInOUT;
        if UseBlockBound.Checked and (not UseBlockNodes.Checked) then {���� ���� ����������� �������}
          if CheckPointZone(MouseX,MouseY) then begin
             If CheckEditNodeInElement(MovedNode,MouseX,MouseY) then begin // ������ ��������������
               list.ResNodes.Nodes[Upload.Find(MovedNode)].X:=MouseX;
               list.ResNodes.Nodes[Upload.Find(MovedNode)].Y:=MouseY;
             end;
          end;
        if (not UseBlockBound.Checked) and UseBlockNodes.Checked then {���� ���� ����������� ��������� ���� �����}
          if not CheckListBlockedNodes(MovedNode) then begin
             If CheckEditNodeInElement(MovedNode,MouseX,MouseY) then begin // ������ ��������������
               list.ResNodes.Nodes[Upload.Find(MovedNode)].X:=MouseX;
               list.ResNodes.Nodes[Upload.Find(MovedNode)].Y:=MouseY;
             end;
          end;
        if (not UseBlockBound.Checked) and (not UseBlockNodes.Checked) then {���� �� ���� �����������}
          begin CheckEditResPointInOUT; end;
      end;
    end;
    If NeedRePaint Then MainRePaint;
  end;
End;

// ���� ���� ����� �� �������, �� ������ false ����� true 
Function TSegment.CheckPointZone(X,Y:Real):boolean;
Var
  FirstNode   : TNode;
  i, j        : Integer;
  c           : array [0..1,0..8] of real;
  Res         : boolean;
    function Geometry(x1,y1,x2,y2,x,y,dim,eps:real): boolean;
    var
      Xo,Xn,Yo,Yn : real;
      flag        : boolean;
      function Dimension(x1,y1,x2,y2:real): real; // ���������� ����� ����� �������
        begin Result:=sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1)); end;
      function LineFunc(x1,x2,y1,y2,x:real): real;  // ��������� ������ �� ���� ������
        begin Result:=((y2-y1)/(x2-x1))*(x-x1)+y1; end;
    begin
      Xo:=X1; Xn:=X2; Yo:=Y1; Yn:=Y2; flag:=true;
      if Xo<>Xn then begin  // ��� ������ �� ������������ �� � � �����
        if (Xn>=0)and(Xo<Xn) then eps:=eps else eps:=-eps;
        If Dimension(X1,Y1,X,Y)<dim then Flag:=False
        else if Dimension(X2,Y2,X,Y)<dim then Flag:=False
        else begin
          While Not(abs(Xn-Xo)<abs(eps)) do begin
           Yn:=LineFunc(X1,X2,Y1,Y2,Xo);
           if Dimension(Xo,Yn,X,Y)<dim then Flag:=False;
           Xo:=Xo+eps;
          end;
        end;
      end
      else begin  // ������ ������������ Y (������������ � ����� �� �)
       if (Y2>=0)and(Yo<Yn) then eps:=eps else eps:=-eps;
        While Not(abs(Yo-Yn)<abs(eps)) do begin
          if Dimension(X1,Yo,X,Y)<dim then Flag:=False;
          Yo:=Yo+eps;
        end;
      end;
      if flag=false then Result:=false else Result:=true;
    end;
  Begin
  GetZoneInfo;
  Res:=True;
  For i:=0 To ZoneCount-1 Do Begin
    For j:=0 To 7 Do Begin
      If j=0 then begin
        FirstNode.Number:=ZoneInfo[i].NodesNum[0];
        FirstNode.x:=ZoneInfo[i].NodesCoord[0,0];
        FirstNode.y:=ZoneInfo[i].NodesCoord[1,0];
       End;
      c[0,j]:=ZoneInfo[i].NodesCoord[0,j];
      c[1,j]:=ZoneInfo[i].NodesCoord[1,j];
    End;
    c[0,8]:=FirstNode.x;
    c[1,8]:=FirstNode.y;
    For j:=0 To 7 Do Begin
      if not(Geometry(c[0,j],c[1,j],c[0,j+1],c[1,j+1],X,Y,
            (StrToInt(SizeBound.Text)/10),0.01)) then Res:=false;
    end;
  end;
  if Res=false  then Result:=false else Result:=true;
end;

// �������� ����������� "��"
procedure TSegment.RadioMMClick(Sender: TObject);
Const     MmDim = 0;
begin
  Dim_Modified := true;
  PrevDim := GetCurDim;
  SetCurDim(MmDim);
  Node_ReDimension(PrevDim-GetCurDim);
  ToolButton1Click(Self);
  ToolButton1Click(Self);
  ActiveRadio := RadioMM;
end;

// �������� ����������� "��"
procedure TSegment.RadioCMClick(Sender: TObject);
Const     CmDim = 1;
begin
  Dim_Modified := true;
  PrevDim := GetCurDim;
  SetCurDim(CmDim);
  Node_ReDimension(PrevDim-GetCurDim);
  ToolButton1Click(Self);
  ToolButton1Click(Self);
  ActiveRadio := RadioCM;
end;

// �������� ����������� "��"
procedure TSegment.RadioDMClick(Sender: TObject);
Const     DmDim = 2;
begin
  Dim_Modified := true;
  PrevDim := GetCurDim;
  SetCurDim(DmDim);
  Node_ReDimension(PrevDim-GetCurDim);
  ToolButton1Click(Self);
  ToolButton1Click(Self);
  ActiveRadio := RadioDM;
end;

// �������� ����������� "�"
procedure TSegment.RadioMClick(Sender: TObject);
Const     MDim = 3;
begin
  Dim_Modified := true;
  PrevDim := GetCurDim;
  SetCurDim(MDim);
  Node_ReDimension(PrevDim-GetCurDim);
  ToolButton1Click(Self);
  ToolButton1Click(Self);
  ActiveRadio := RadioM;
end;
// �������� ����������� ������� �����
procedure TSegment.UseNodeNumClick(Sender: TObject);
  begin MainRePaint;  end;
// �������� ����������� ������� ���
procedure TSegment.UseZoneNumClick(Sender: TObject);
  begin MainRePaint;  end;
// �������� ��������� � �����
Procedure TSegment.UseGridClick(Sender: TObject);
  begin MainRePaint;  end;
// �������� ����� ��������
procedure TSegment.UseFormClick(Sender: TObject);
  begin MainRePaint;  end;
// �������� �������������� �����
procedure TSegment.UseResultClick(Sender: TObject);
  begin MainRePaint;  end;
// �������� ���� �����
procedure TSegment.UseNodeResClick(Sender: TObject);
  begin MainRePaint;  end;
// �������� �������� �����
procedure TSegment.UseElementsClick(Sender: TObject);
  begin MainRePaint;  end;
// �������� ������� - �� ������� � �������, ������������ ����
procedure TSegment.UseShowBoundClick(Sender: TObject);
  begin
    IF UseShowBound.Checked then UpDownSizeBound.Enabled:=True
      else UpDownSizeBound.Enabled:=False;
    MainRePaint;
    end;
// ����������� ����� �� �������
procedure TSegment.UseBlockNodesClick(Sender: TObject);
  begin MainRePaint; end;
// ��������� �� ���������� � �������
procedure TSegment.UseINOUTNodesClick(Sender: TObject);
begin
{  IF UseINOUTNodes.Checked then begin
    INOUT.Enabled:=True;
    UseInNodes.Enabled:=True;
    UseOUTNodes.Enabled:=True;
  end
  else begin
    INOUT.Enabled:=False;
    UseInNodes.Enabled:=False;
    UseOUTNodes.Enabled:=False;
  end;}
  MainRePaint;
end;

//-------- ��������� �������
procedure TSegment.UpDownFontFnodeChanging(Sender: TObject;
  var AllowChange: Boolean);
  begin MainRePaint;  end;
procedure TSegment.UpDownFontFzoneChanging(Sender: TObject;
  var AllowChange: Boolean);
  begin MainRePaint;  end;
procedure TSegment.UpDownFontRnodeChanging(Sender: TObject;
  var AllowChange: Boolean);
  begin MainRePaint;  end;
procedure TSegment.UpDownFontRelemClick(Sender: TObject;
  Button: TUDBtnType);
  begin MainRePaint;  end;
procedure TSegment.UpDownSizeBoundChanging(Sender: TObject;
  var AllowChange: Boolean);
  begin MainRePaint;  end;
procedure TSegment.UpDownFontFPointSizeChanging(Sender: TObject;
  var AllowChange: Boolean);
  begin MainRePaint;  end;
procedure TSegment.UpDownFontRPointSizeChanging(Sender: TObject;
  var AllowChange: Boolean);
  begin MainRePaint; end;

// �������������� ��������� �� ������
Procedure TSegment.NewXExit(Sender: TObject);
Begin
IF MainRes.Checked then begin
  LastNode:=list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].Number;
  LastCoordX:=list.ResNodes.Nodes[Upload.Find(LastNode)].X;
  LastCoordY:=list.ResNodes.Nodes[Upload.Find(LastNode)].Y;
  if NewX.Text<>'' then begin
    if not list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].inf.InOut then begin
      IF CheckEditNodeInElement(list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].Number,
        StrToFloat(NewX.Text),StrToFloat(OldY.Text)) then
        list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].X:=StrToFloat(NewX.Text)
      else Memo1.Lines.Add('������ �������� ���������');
    end
    else Memo1.Lines.Add('����:'+NodesList.Items.Strings[NodesList.ItemIndex]+'������ ��������');
    MainRePaint;
//    NewX.Text:='';
  end;
  end
  else Memo1.Lines.Add('�� ������� ����� ��, ��� �������� ����');
End;
Procedure TSegment.NewYExit(Sender: TObject);
Begin
IF MainRes.Checked then begin
  LastNode:=list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].Number;
  LastCoordX:=list.ResNodes.Nodes[Upload.Find(LastNode)].X;
  LastCoordY:=list.ResNodes.Nodes[Upload.Find(LastNode)].Y;
  if NewY.Text<>''  then begin
    if not list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].inf.InOut then begin
      IF CheckEditNodeInElement(list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].Number,
        StrToFloat(OldX.Text),StrToFloat(NewY.Text)) then
      list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].Y:=StrToFloat(NewY.Text)
      else Memo1.Lines.Add('������ �������� ���������');      
    end
    else Memo1.Lines.Add('����:'+NodesList.Items.Strings[NodesList.ItemIndex]+'������ ��������');
    MainRePaint;
//    NewY.Text:='';
  end;
  end
  else Memo1.Lines.Add('�� ������� ����� ��, ��� �������� ����');
End;
// �������������� ��������� �� Enter
procedure TSegment.NewXEnter(Sender: TObject);
begin
IF MainRes.Checked then begin
  LastNode:=list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].Number;
  LastCoordX:=list.ResNodes.Nodes[Upload.Find(LastNode)].X;
  LastCoordY:=list.ResNodes.Nodes[Upload.Find(LastNode)].Y;
  if NewX.Text<>''  then begin
    if not list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].inf.InOut then begin
      IF CheckEditNodeInElement(list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].Number,
        StrToFloat(NewX.Text),StrToFloat(OldY.Text)) then
        list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].X:=StrToFloat(NewX.Text)
      else Memo1.Lines.Add('������ �������� ���������');
    end
    else Memo1.Lines.Add('����:'+NodesList.Items.Strings[NodesList.ItemIndex]+'������ ��������');
    MainRePaint;
//    NewX.Text:='';
  end;
  end
  else Memo1.Lines.Add('�� ������� ����� ��, ��� �������� ����');
end;
procedure TSegment.NewYEnter(Sender: TObject);
begin
IF MainRes.Checked then begin
  LastNode:=list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].Number;
  LastCoordX:=list.ResNodes.Nodes[Upload.Find(LastNode)].X;
  LastCoordY:=list.ResNodes.Nodes[Upload.Find(LastNode)].Y;
  if NewY.Text<>'' then begin
    if not list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].inf.InOut then begin
      IF CheckEditNodeInElement(list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].Number,
        StrToFloat(OldX.Text),StrToFloat(NewY.Text)) then
      list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].Y:=StrToFloat(NewY.Text)
      else Memo1.Lines.Add('������ �������� ���������');
    end
    else Memo1.Lines.Add('����:'+NodesList.Items.Strings[NodesList.ItemIndex]+'������ ��������');
    MainRePaint;
//    NewY.Text:='';
  end;
  end
  else Memo1.Lines.Add('�� ������� ����� ��, ��� �������� ����');
end;

procedure TSegment.CurZoneChange(Sender: TObject);
begin
{}
end;

Procedure TSegment.CurNodeChange(Sender: TObject);
Var
  N : TNode;
Begin
  N:=Form_GetNodeValue(CurNode.ItemIndex+1);
  EditX.text:=MyFloatToStr(N.X);
  EditY.text:=MyFloatToStr(N.Y);
End;

{============================ FORMS & Registry ============================}
// ���������� ������� �� �� ����
procedure TSegment.ToolButton1Click(Sender: TObject);
begin
  Area:=Form_GetArea;
  ZoomAreaRect(Area.minx-3, Area.miny-3, Area.maxx+3, Area.maxy+3);
  MainRePaint;
end;
procedure TSegment.ShowForm;
begin
  show;
//  ToolButton1Click(nil);
end;

procedure TSegment.FormClose(Sender: TObject; var Action: TCloseAction);
begin
// ��������� ���� ����
  IF SaveSegmentF = True then SaveForm(PluginReg.SegmentsRegF.Current);
  if SegF <> nil then begin
    MainR.ActiveWindow.Items.Delete(MainR.ActiveWindow.items.IndexOf('Grid of FE'));
    MainR.ActiveForm[3]:=-1;
    MainR.RefreshIndexes;
    SegF := nil;
  end;
  bmpPic.Free;
  Action:=caFree;
end;

procedure TSegment.FormShow(Sender: TObject);
begin
  If ReDrawAuto then begin
    ToolButton1Click(Self);
    ToolButton1Click(Self);
  end;
  if ReLoadResWhenShow then ReLoadResult;
// ���������� ������������� �������� �����
//  GetListBlockedNodes;
end;

procedure TSegment.LoadForm(Name:string);
var
  Registry:TRegistry;
  Function Read(name: String;Def:boolean):boolean;
  begin
    IF Registry.ValueExists(name) then Result:=Registry.readBool(Name) else Result:=Def;
  end;
  function ReadString(Name:string;Def:string):String;
  begin
    if Registry.ValueExists(Name) then Result:=Registry.ReadString(Name)
    else Result:=def;
  end;
begin
  Registry:=TRegistry.Create;
  Registry.RootKey:=HKEY_CURRENT_USER;
  if Registry.OpenKeyReadOnly(Name) then begin
    WindowState:=wsNormal;
// ������ �������� �����
//    UseGridEps.Checked:=Read('UseGridEps',True); //- ������-�� �������� ��� ������
//    UseGrid.Checked:=Read('UseGrid',True);      // - ������-�� �������� ��� ������
    UseBuffer.Checked:=Read('UseBuffer',True);
// �����
    UseForm.Checked:=Read('UseForm',False);
    UseNodeNum.Checked:=Read('UseNodeNum',False);
    UseZoneNum.Checked:=Read('UseZoneNum',False);
// �����
    UseResult.Checked:=Read('UseResult',False);
    UseNodeRes.Checked:=Read('UseNodeRes',False);
    UseElements.Checked:=Read('UseElements',False);
    UseINOUTNodes.Checked:=Read('UseINOUTNodes',False);
// �������
//    UseShowBound.Checked:=Read('UseShowBound',False);
    UseBlockBound.Checked:=Read('UseBlockBound',False);
    UseBlockNodes.Checked:=Read('UseBlockNodes',True);
    UseBlockINOUT.Checked:=Read('UseBlockINOUT',True);
  end;
//  if Registry.OpenKeyReadOnly(StringReg) then FloatFormat:=Registry.ReadString('FloatFormat');
  if Registry.OpenKeyReadOnly(PluginReg.SigmaReg) then FloatFormat:=ReadString('FloatFormat','0.000E+00');
  Registry.free;
end;

procedure TSegment.SaveForm(Name:string);
var
  Registry:TRegistry;
begin
  Registry:=TRegistry.Create;
  Registry.RootKey:=HKEY_CURRENT_USER;
  if Registry.OpenKey(Name,true) then begin
// ����� ��������� �����
//    Registry.WriteBool('UseGridEps',UseGridEps.Checked);
//    Registry.WriteBool('UseGrid',UseGrid.Checked);
//    Registry.WriteBool('UseBuffer',UseBuffer.Checked);
// �����
    Registry.WriteBool('UseForm',UseForm.Checked);
    Registry.WriteBool('UseNodeNum',UseNodeNum.Checked);
    Registry.WriteBool('UseZoneNum',UseZoneNum.Checked);
// �����
    Registry.WriteBool('UseResult',UseResult.Checked);
    Registry.WriteBool('UseNodeRes',UseNodeRes.Checked);
    Registry.WriteBool('UseElements',UseElements.Checked);
    Registry.WriteBool('UseINOUTNodes',UseINOUTNodes.Checked);
// �������
//    Registry.WriteBool('UseShowBound',UseShowBound.Checked);
    Registry.WriteBool('UseBlockBound',UseBlockBound.Checked);
    Registry.WriteBool('UseBlockNodes',UseBlockNodes.Checked);
    Registry.WriteBool('UseBlockINOUT',UseBlockINOUT.Checked);
  end;
  if Registry.OpenKey(PluginReg.SigmaReg,true) then Registry.WriteString('FloatFormat',FloatFormat);
    Registry.free;
end;
/////////////////////////Events\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Procedure TSegment.FormCreate(Sender: TObject);
var
  dim : integer;
Begin
  Memo1.Lines.Clear;
// �������� �����
  bmpPic:=Tbitmap.Create;
  StatusBar1.Panels[2].Text:=Project_GetFormFile;
//  LoadForm(PluginReg.SegmentsRegF.FullPath);
  MousePushed:=false;
  CM:=Screen.PixelsPerInch/CM_Inch;
  OffsetX:=0;
  OffsetY:=0;
  ActiveToolButton:=DefaultAction;
  ActiveRadio := RadioCM;
  Scale:=0.125;
  MovedNode:=0;
  Scaling;
  UseGrid.Checked:=true;
  Form_Load(Project_GetFormFile);
// ������� ���������������� RadioButton'� � ����������� �� �����������
  dim := StrToInt(getDimension);
  case dim of
    0 : ActiveRadio := RadioMM;
    1 : ActiveRadio := RadioCM;
    2 : ActiveRadio := RadioDM;
    3 : ActiveRadio := RadioM;
  end;
  case dim of
    0 : RadioMM.Checked := True;
    1 : RadioCM.Checked := True;
    2 : RadioDM.Checked := True;
    3 : RadioM.Checked := True;
  end;
  Dim_Modified := false;
  UpdateVizParams;
End;

// �������� ������� ������, ��� ������������� �������� ��
procedure TSegment.CheckBaseRegKeysForSegments;
Var
Registry: TRegistry;
begin
// ������������� � �������� �� ���������
  LoadSegmentF:=False;
  SaveSegmentF:=False;
// �������� � ��������
  Registry:=TRegistry.Create;
  Registry.RootKey:=HKEY_CURRENT_USER;
  IF Registry.KeyExists(PluginReg.SegmentsRegF.FullPath) then begin // ���� �� ����� ��� Segments
    IF not(Registry.KeyExists(PluginReg.SegmentsRegF.Default)) then // �� ��������� (Segments)
      Registry.CreateKey(PluginReg.SegmentsRegF.Default);
    IF not(Registry.KeyExists(PluginReg.SegmentsRegF.Current)) then // ������� (Segments)
      Registry.CreateKey(PluginReg.SegmentsRegF.Current);
    if Registry.OpenKeyReadOnly(PluginReg.SegmentsRegF.FullPath) then begin // ��� ����� ���� - ������ ���������
      LoadSegmentF:=Registry.ReadBool('LoadSegmentF');
      SaveSegmentF:=Registry.ReadBool('SaveSegmentF');
      ReDrawAuto:=Registry.ReadBool('ReDrawAuto');
      ReLoadResWhenShow:=Registry.ReadBool('ReLoadResWhenShow');
    end
  end
  else begin
    Registry.CreateKey(PluginReg.SegmentsRegF.FullPath);
    Registry.CreateKey(PluginReg.SegmentsRegF.Default);
    Registry.CreateKey(PluginReg.SegmentsRegF.Current);
    Registry.OpenKey(PluginReg.SegmentsRegF.FullPath,True);
      Registry.WriteBool('LoadSegmentF',False);
      Registry.WriteBool('SaveSegmentF',False);
      Registry.WriteBool('ReDrawAuto',True);
      Registry.WriteBool('ReLoadResWhenShow',False);
    SetBaseRegKeysForSegments(PluginReg.SegmentsRegF.Current);
  end;
  Registry.Free;
// ��������� ����� �� ���������
  SetBaseRegKeysForSegments(PluginReg.SegmentsRegF.Default);
end;

procedure TSegment.SetBaseRegKeysForSegments;
Var
Registry: TRegistry;
begin
  Registry:=TRegistry.Create;
  Registry.RootKey:=HKEY_CURRENT_USER;
  Registry.OpenKey(Name,True);
  Registry.WriteBool('UseGridEps',False);
  Registry.WriteBool('UseGrid',True);
  Registry.WriteBool('UseBuffer',True);
// �����
  Registry.WriteBool('UseForm',False);
  Registry.WriteBool('UseNodeNum',False);
  Registry.WriteBool('UseZoneNum',False);
// �����
  Registry.WriteBool('UseResult',True);
  Registry.WriteBool('UseNodeRes',False);
  Registry.WriteBool('UseElements',False);
  Registry.WriteBool('UseINOUTNodes',False);
// �������
  Registry.WriteBool('UseShowBound',False);
  Registry.WriteBool('UseBlockBound',False);
  Registry.WriteBool('UseBlockNodes',False);
  Registry.WriteBool('UseBlockINOUT',True);
  Registry.CloseKey;
  Registry.Free;
end;



procedure TSegment.FormResize(Sender: TObject);
begin
{ if Screen.Width=1280 then Width:=1060
  else if Screen.Width=1024 then Width:=800
  else if Screen.Width=1440 then Width:=1240
  else if Screen.Width>801 then Width:=800
  else if Screen.Width<801 then Width:=600
  elseWidth:=600;}
{if Screen.Height=1024 then Height:=800
  else If Screen.Height=768 then Height:=620
  else If Screen.Height=900 then Height:=740
  else If Screen.Height>649 then Height:=650
  else If Screen.Height<601 then Height:=450
  elseHeight:=600;
  Top  :=100;
  Left :=0;//Screen.Width; }
  ChangeDrawSize;
end;

procedure TSegment.btncompilenowClick(Sender: TObject);
Var
  Handle  : TextFile;
  res     : string;
  i       : Integer;
  IOError : boolean;
begin
    Memo1.Lines.Add(format('-------------------- %s -------------------',
                            ['��������/������ ���������� ����� ��������� �����']));
// ����� � ���� ����� ���������� ����� ���������������
// ������ ���� �������� � CORD � ��� �� ������������������
// �.�. ������ �������� ����� ������������ ����� �� �����
    Memo1.Lines.Add(format('--- %s', ['�������� ���������']));
  Upload.Params;
    Memo1.Lines.Add(format('--- %s', ['�������� �����']));
  Upload.UploadNodes;
    Memo1.Lines.Add(format('--- %s', ['�������� ���������']));
  Upload.UploadElements;
    Memo1.Lines.Add(format('--- %s', ['�������� ������ �����']));
  Upload.GeTInOuT;
    Memo1.Lines.Add(format('--- %s', ['���������� �������']));
  CompileNow;
    Memo1.Lines.Add(format('--- %s', ['������ �������']));
  RunNow;
    Sleep(3000);
    Memo1.Lines.Add(format('--- %s', ['�������� �����������']));
  Upload.CreateRes;
  Upload.LoadResult;
  Upload.DestroyRes;
    Sleep(500);
    Memo1.Lines.Add(format('--- %s', ['�������� ����� �������']));
  Upload.GeTInOuT;
  Upload.TieInOut;
    Sleep(500);
    Memo1.Lines.Add(format('--- %s', ['�������� ���������� ����� ��������� ����� ']));
  Upload.DeleteUpLoadingFiles;
end;

// ������ ����� � ���������
procedure TSegment.BitBtn1Click(Sender: TObject);
Var
  i: integer;
begin
  ElementsList.Items.Clear;
  NodesList.Items.Clear;
  For i:=1 to list.ResNodes.Count do NodesList.Items.Add(IntToStr(i));
  For i:=1 to list.ResElements.Count do ElementsList.Items.Add(IntToStr(i));
end;

procedure TSegment.ElementsListClick(Sender: TObject);
Var
  Node       : TArrayElemNode;
begin
  NodesList.Items.Clear;
  If list.ResElements.Count>0 Then Begin
    NodesList.Items.Add(IntToStr(Upload.Find(list.ResElements.Elements[ElementsList.ItemIndex+1].Node1)));
    NodesList.Items.Add(IntToStr(Upload.Find(list.ResElements.Elements[ElementsList.ItemIndex+1].Node2)));
    NodesList.Items.Add(IntToStr(Upload.Find(list.ResElements.Elements[ElementsList.ItemIndex+1].Node3)));
  End;
end;

procedure TSegment.NodesListClick(Sender: TObject);
begin
    If NodesList.Count>0 Then Begin
      oldX.Text:=MyFloatToStr(list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].X);
      oldY.Text:=MyFloatToStr(list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].Y);
      IF list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].inf.InOut
        then NodeType.ItemIndex := 0
        else NodeType.ItemIndex := 1;
      NewX.Text:='';
      NewY.Text:='';
    End;
end;

// ��������� ���� ����
procedure TSegment.NodeTypeChange(Sender: TObject);
begin
//  if not list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].inf.InOut then begin
    IF NodeType.ItemIndex = 0 then list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].inf.InOut:=True
      else list.ResNodes.Nodes[StrToInt(NodesList.Items.Strings[NodesList.ItemIndex])].inf.InOut:= False;
//  end
//  else Memo1.Lines.Add('����:'+NodesList.Items.Strings[NodesList.ItemIndex]+'������ ��������');
end;

procedure TSegment.Splitter1Moved(Sender: TObject);
begin
//  ChangeDrawSize;
end;

procedure TSegment.FormDestroy(Sender: TObject);
begin
//
end;
// ������� ������ ����� �����, ����������� �� �������
procedure TSegment.GetListBlockedNodes;
Var
  i: integer;
begin
//  Memo1.Lines.Clear;
//  Memo1.Lines.Add('��������������� ����:');
  List.ResNodes.CountOfBlocked:=0;
  List.ResNodes.CountOfUnBlocked:=0;
  IF List.ResNodes.Count>0 then begin
    For i:=1 to List.ResNodes.Count do begin
      if not (CheckPointZone(List.ResNodes.Nodes[i].X,List.ResNodes.Nodes[i].Y)) then begin
        List.ResNodes.Nodes[i].inf.Blocked:=True;
//        Memo1.Lines.Add('������������:'+IntToStr(i));
        inc(List.ResNodes.CountOfBlocked);
      end
      else begin
        List.ResNodes.Nodes[i].inf.Blocked:=False;
//        Memo1.Lines.Add('�� ������������:'+IntToStr(i));
        inc(List.ResNodes.CountOfUnBlocked);
      end;
    end;
    Memo1.Lines.Add('����� ������������� ����� �� �������:'+IntToStr(list.ResNodes.CountOfBlocked));
  end;

end;
// ���� ���� ���� � ������ ������������� �� �������, �� ������ TRUE, ���� ��� �� FALSE
function TSegment.CheckListBlockedNodes(Node:Integer):boolean;
BEGIN
  IF list.ResNodes.CountOfBlocked>0 then begin
    if list.ResNodes.Nodes[Upload.Find(Node)].inf.Blocked then Result:=true
    else Result:=False;
  END;
END;

procedure TSegment.btnShowBlockedNodesClick(Sender: TObject);
Var
  i,n: integer;
begin
// ���������� ������������� �������� �����
  ElementsList.Items.Clear;
  NodesList.Items.Clear;
  IF UseBlockBound.Checked then begin
    GetListBlockedNodes;
    IF List.ResNodes.CountOfBlocked>0 then begin
      FOR i:=1 to List.ResNodes.Count do  begin if List.ResNodes.Nodes[i].inf.Blocked then NodesList.Items.Add(IntToStr(i)); end;
    end;
  end
  else begin
      n:=0;
      FOR i:=1 to List.ResNodes.Count do begin
        if List.ResNodes.Nodes[i].inf.InOut then begin NodesList.Items.Add(IntToStr(i)); inc(n);end;
      END;
      Memo1.Lines.Add('����� ������������� (�������) �����:'+IntToStr(n));
  end;
end;

procedure TSegment.ReLoadResult;
begin
  Upload.CreateRes;
  Upload.LoaDResult;
  Upload.DestroyRes;
  MainRePaint;
end;

procedure TSegment.ReLoadResBTNClick(Sender: TObject);
  begin ReLoadResult; end;

// ���� ����� ������ ��������������, �� ��������� True, ���� �� ������� ���� �� ��������, �� False
Function TSegment.CheckEditNodeInElement(Node: Integer;NewX:Real;NewY:Real):boolean;
var
  i,ne,nn :integer; // �������, ���-�� ���������, �����
  s: array [0..10] of integer; // ��������� ������ ���������
  RoundE: array of integer; // ���������� ��������
  RoundNodes: array of integer; // ���������� ����
  CenterX,CenterY: real; // ����� ��������������
  Fx,Fy,Lx,Ly,X,Y: real; // X, Y ���������, �������� � ������� �����
  Flag: boolean; // ���� ������������ ����
  function find(k: integer):integer; // ����� ���� � ������� ����� ��������, ��� �����
  begin
    if (list.ResElements.Elements[k].Node1=Node) or (list.ResElements.Elements[k].Node2=Node) or (list.ResElements.Elements[k].Node3=Node) then Result:=k
    else Result:=-1;
  end;
  function findNotAs(k: integer;R: integer):integer;// ����� ������������� � R ���� � k ��������
  begin
    if list.ResElements.Elements[k].Node1<>R then Result:=list.ResElements.Elements[k].Node1
    else if list.ResElements.Elements[k].Node2<>R then Result:=list.ResElements.Elements[k].Node2
    else if list.ResElements.Elements[k].Node3<>R then Result:=list.ResElements.Elements[k].Node3
    else Result:=-1;
  end;
  function findNextNode(k:Integer;k2:integer):integer; // ����� ��������� ���� � ��������, ��� �������� 2 ����, ��� ����� �� �� ����������
  var
    i2: integer;
  begin
    for i2:=1 to ne do begin
      if list.ResElements.Elements[RoundE[i2]].Node1=Node then begin
          IF (list.ResElements.Elements[RoundE[i2]].Node2=k) and (list.ResElements.Elements[RoundE[i2]].Node3<>k2) then begin Result:=list.ResElements.Elements[RoundE[i2]].Node3; Exit; end
          else IF (list.ResElements.Elements[RoundE[i2]].Node3=k) and (list.ResElements.Elements[RoundE[i2]].Node2<>k2) then begin Result:=list.ResElements.Elements[RoundE[i2]].Node2; Exit; end;
      end
      else if list.ResElements.Elements[RoundE[i2]].Node2=Node then begin
          IF (list.ResElements.Elements[RoundE[i2]].Node1=k) and (list.ResElements.Elements[RoundE[i2]].Node3<>k2) then begin Result:=list.ResElements.Elements[RoundE[i2]].Node3; Exit; end
          else IF (list.ResElements.Elements[RoundE[i2]].Node3=k) and (list.ResElements.Elements[RoundE[i2]].Node1<>k2) then begin Result:=list.ResElements.Elements[RoundE[i2]].Node1; Exit; end;
      end
      else if list.ResElements.Elements[RoundE[i2]].Node3=Node then begin
          IF (list.ResElements.Elements[RoundE[i2]].Node1=k) and (list.ResElements.Elements[RoundE[i2]].Node2<>k2) then begin Result:=list.ResElements.Elements[RoundE[i2]].Node2; Exit; end
          else IF (list.ResElements.Elements[RoundE[i2]].Node2=k) and (list.ResElements.Elements[RoundE[i2]].Node1<>k2) then begin Result:=list.ResElements.Elements[RoundE[i2]].Node1; Exit; end;
      end
      else Result:=-1;
    end;
  end;
// ������� ������������� ������ ����
  function GetS: real;
  var
    k: integer;
    Cs,sv,Si,S: real; // ������� ������ + ������� ��������������
  begin
    for k:=2 to nn do begin
      Cs:= ((List.ResNodes.Nodes[Upload.Find(RoundNodes[k-1])].X * List.ResNodes.Nodes[Upload.Find(RoundNodes[k])].Y)
         - (List.ResNodes.Nodes[Upload.Find(RoundNodes[k])].X * List.ResNodes.Nodes[Upload.Find(RoundNodes[k-1])].Y))/2;
      Si:=Si+Cs;
    end;
    sv:=  abs(Si);
    Result:=Round(Sv*10)/10;
  end;
// ����� �������� �������������, ���������� �������������, � ������� � NewX � NewY
  function GetNewS: real;
  Const
    pi=3.1415926535897932384626433832795;
  var
    k: integer;
    x1,y1,x2,y2,x3,y3,a,b,c,p,s:real;
    tr1,tr2,tr3,tr:real;
  begin
     x1:=NewX; y1:=NewY; S:=0;
    for k:=1 to nn-1 do begin
     x2:=List.ResNodes.Nodes[Upload.Find(RoundNodes[k])].X;
     y2:=List.ResNodes.Nodes[Upload.Find(RoundNodes[k])].Y;
     x3:=List.ResNodes.Nodes[Upload.Find(RoundNodes[k+1])].X;
     y3:=List.ResNodes.Nodes[Upload.Find(RoundNodes[k+1])].Y;
     c:=sqrt(sqr(y1-y2)+sqr(x1-x2));
     a:=sqrt(sqr(y2-y3)+sqr(x2-x3));
     b:=sqrt(sqr(y1-y3)+sqr(x1-x3));
     p:=(a+b+c)/2;
     S:=S+sqrt(p*(p-a)*(p-b)*(p-c));
      tr1:=ABS(ArcTan2((x2-x1)*(y3-y1)-(x3-x1)*(y2-y1),(x2-x1)*(x3-x1)+(y2-y1)*(y3-y1))*(180/pi));
      tr2:=ABS(ArcTan2((x1-x2)*(y3-y2)-(x3-x2)*(y1-y2),(x1-x2)*(x3-x2)+(y1-y2)*(y3-y2))*(180/pi));
      tr3:=ABS(180-(tr1+tr2));
// �������� ������������ ����
      IF tr1<StrToInt(MinTrunc.Text) then begin Flag:=False; MinTruncInMesh.Text:=format('%f',[tr1]) end
        ELSE IF tr2<StrToInt(MinTrunc.Text) then begin Flag:=False; MinTruncInMesh.Text:=format('%f',[tr2]) end
        ELSE IF tr3<StrToInt(MinTrunc.Text) then begin Flag:=False; MinTruncInMesh.Text:=format('%f',[tr3]) end
      else begin
        IF (tr1<=tr2) and (tr1<=tr3) then MinTruncInMesh.Text:=format('%f',[tr1])
          ELSE IF (tr2<=tr1) and (tr2<=tr3) then MinTruncInMesh.Text:=format('%f',[tr2])
          ELSE IF (tr3<=tr1) and (tr3<=tr2) then MinTruncInMesh.Text:=format('%f',[tr3])
      end;
    end;
    Result:=Round(abs(S)*10)/10;
  end;
begin
// ���� ���� ����������, �� ����� ������� ����� ����� ����� ���������
// +1 ������ ������ � �����, ����� ������� ������ (nn:=ne+1)
  if not list.ResNodes.Nodes[Upload.Find(Node)].inf.InOut then begin
    ne:=0;  Flag:=true;
    for I:=1 to list.ResElements.Count do begin
      if find(i)<>-1 then begin
        inc(ne); s[ne]:=i;
      end;
    end;
    nn:=ne+1;
    SetLength(RoundE,ne+1); SetLength(RoundNodes,nn+1);
// ���������� ������� ��������
    for I:=1 to ne do RoundE[i]:=s[i];
//  for I:=1 to ne do memo1.Lines.Add(format('%D',[RoundE[i]]));
//    memo1.Lines.Add(format('%D--------------------------',[Node]));
// ���������� ������� ����
    for i:=1 to nn-1 do begin
      if i=1 then begin
        RoundNodes[i]:=findNotAs(RoundE[i],node);
        RoundNodes[i+1]:=findNextNode(RoundNodes[i],0);
      end
      else RoundNodes[i+1]:=findNextNode(RoundNodes[i],RoundNodes[i-1]);
    end;
// ��������� �������� - ���� ����� �������� ��������� ����� ��� �����������
    Sum.Text:=format('%f',[GetS]);
    NewSum.Text:=format('%f',[GetNewS]);
    IF Flag then begin // �������� �� ����
      MinTruncInMesh.Color:=clWhite;
      MinTruncInMesh.Text:='';
      IF GetS=GetNewS then begin
        Result:=True;
        NewSum.Color:=clWhite;
      end
      Else begin
        Result:=False;
        NewSum.Color:=clRed;
      end;
    end
    ELSE begin
      MinTruncInMesh.Color:=clRed;
      Result:=False;
    end;
  end
  else Memo1.Lines.Add('����:'+IntToStr(Upload.Find(Node))+'������ ��������');
end;




procedure TSegment.MainResClick(Sender: TObject);
begin
  UseResult.Enabled:=False; {���������� ��}
  UseForm.Enabled:=True; {���������� ����}
  ManualShow.ActivePageIndex:=1;
  UseResult.Checked:=True;
  MainRePaint;
end;

procedure TSegment.MainFormClick(Sender: TObject);
begin
  UseResult.Enabled:=True;  {���������� ��}
  UseForm.Enabled:=False; {���������� ����}
  ManualShow.ActivePageIndex:=0;
  UseForm.Checked:=True;
  MainRePaint;
end;

procedure TSegment.MainNoneClick(Sender: TObject);
begin
  UseResult.Enabled:=True;  {���������� ��}
  UseForm.Enabled:=True; {���������� ����}
  ManualShow.ActivePageIndex:=1;
  UseResult.Checked:=True;
  UseForm.Checked:=False;
  MainRePaint;  
end;




procedure TSegment.UseBlockBoundClick(Sender: TObject);
begin
  IF UseBlockBound.Checked then begin
    UseBlockNodes.Checked:=True;
    IF not UseShowBound.Checked then UseShowBound.Checked:=True;    
// ���������� ������������� �������� �����
    GetListBlockedNodes;
    UseBlockINOUT.Enabled:=False;
  end
  else begin
    UseBlockNodes.Checked:=False;
    UseBlockINOUT.Enabled:=True;
  end
end;

procedure TSegment.RepairClick(Sender: TObject);
begin
//  Memo1.Lines.Add(format('x=%f:y=%f',[LastCoordX,LastCoordY]));
  list.ResNodes.Nodes[Upload.Find(LastNode)].X:=LastCoordX;
  list.ResNodes.Nodes[Upload.Find(LastNode)].Y:=LastCoordY;
  MainRePaint;  
end;

procedure TSegment.UseInNodesClick(Sender: TObject);
begin
  MainRePaint;
end;

procedure TSegment.UseOUTNodesClick(Sender: TObject);
begin
  MainRePaint;
end;

procedure TSegment.UseALLNodesClick(Sender: TObject);
begin
  MainRePaint;
end;

end.
