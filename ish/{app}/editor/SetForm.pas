{*********************************************************************}
{                                                                     }
{                    ���������� ����������� ��������                  }
{                                                                     }
{                               ������� 609                           }
{                                                                     }
{                    ������� ����� ����������� 2001                   }
{                                                                     }
{*********************************************************************}
Unit SetForm;

Interface

Uses
     Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, ComCtrls, ExtCtrls, Buttons, TSigmaForm, ImgList, ToolWin,
     IniFiles, ExtDlgs;
const
     HandAct  = 1;
     HandPas  = 2;
     ZoomIn   = 3;
     Zoomout  = 4;
     ZoomArea = 5;
     CM_Inch = 2.5428571428571428571428571428571;
     cursorcrosdx = 3;
Type
//b:::::::::::::::
// ������ ��� �������� ��������� ���
     ZoneStruct = Record
               ZoneNum    : word;      // ����� ����
               NodesNum   : Array [0..7] of word;      // ������ �����
               NodesCoord : Array [0..1,0..7] of real;      // ���������� �����
               // ������� ����
               ZoneS :  real;
     End;
     TZoneInfo = Array [0..20] Of ZoneStruct;
//e:::::::::::::::
     TSetForm1 = Class(TForm)
               ScrollBox1  : TScrollBox;
               Splitter1   : TSplitter;
               StatusBar1  : TStatusBar;
               GroupBox1   : TGroupBox;
    TrackBar1: TTrackBar;
               GroupBox2   : TGroupBox;
               UseGridEps  : TCheckBox;
               GroupBox3   : TGroupBox;
               AddZone     : TButton;
               GroupBox4   : TGroupBox;
               Label2      : TLabel;
               Label3      : TLabel;
               EditX       : TEdit;
               EditY       : TEdit;
               EditScale   : TEdit;
               Label4      : TLabel;
               Label1      : TLabel;
               CurNode     : TComboBox;
               UseGrid     : TCheckBox;
               GroupBox5   : TGroupBox;
               SaveBtn     : TBitBtn;
               BitBtn2     : TBitBtn;
               UseBuffer   : TCheckBox;
               DelZone     : TButton;
               SaveDialog1 : TSaveDialog;
               SpeedButton1: TSpeedButton;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    DefaultAction: TToolButton;
    ZoomInAction: TToolButton;
    ZoomOutAction: TToolButton;
    ZoomAreaAction: TToolButton;
    MoveAction: TToolButton;
    ToolButton1: TToolButton;
    Panel3: TPanel;
    RadioCM: TRadioButton;
    RadioMM: TRadioButton;
    RadioDM: TRadioButton;
    RadioM: TRadioButton;
    ImageList1: TImageList;
    Panel1: TPanel;
    PaintBox1: TPaintBox;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SavePicDlg: TSavePictureDialog;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
//b:::::::::::::::
    UseNodeNum: TCheckBox;
    UseZoneNum: TCheckBox;
    GroupBox6: TGroupBox;
//e:::::::::::::::
    SpeedButton6: TSpeedButton;
    LabelScale: TLabel;
    Button1: TButton;
    Label5: TLabel;
    CurZone: TComboBox;
    Button2: TButton;
    Button4: TButton;
    btnSetVisiblePanel: TButton;
    btnCalcDistance: TButton;
              Procedure EditYConfirm(Sender: TObject);
               Procedure EditXConfirm(Sender: TObject);
               Procedure FormCreate(Sender: TObject);
               Procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
               Y: Integer);
               Procedure PaintBox1Paint(Sender: TObject);
               Procedure TrackBar1Change(Sender: TObject);
               Procedure SetForm1Resize(Sender: TObject);
               Procedure EditScaleKeyDown(Sender: TObject; Var Key: Word;
               Shift: TShiftState);
               Procedure PaintBox1Click(Sender: TObject);
               Procedure AddZoneClick(Sender: TObject);
               Procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
               Shift: TShiftState; X, Y: Integer);
               Procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
               Shift: TShiftState; X, Y: Integer);
               Procedure SaveBtnClick(Sender: TObject);
               Procedure RepearBtnClick(Sender: TObject);
               Procedure UseGridClick(Sender: TObject);
               Procedure CurNodeChange(Sender: TObject);
               Procedure DelZoneClick(Sender: TObject);
               procedure FormClose(Sender: TObject; var Action: TCloseAction);
               procedure SpeedButton1Click(Sender: TObject);
    procedure ChangeActionClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure EditScaleExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
//b:::::::::::::::
    procedure UseNodeNumClick(Sender: TObject);
    procedure UseZoneNumClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure RadioMMClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditXKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure EditXExit(Sender: TObject);
    procedure EditYExit(Sender: TObject);
    procedure New(Sender: TObject; var NewSize: Integer;var Accept: Boolean);
    procedure btnSetVisiblePanelClick(Sender: TObject);
    procedure btnCalcDistanceClick(Sender: TObject);
  
//e:::::::::::::::
          private
               { Private declarations }
          public
               { Public declarations }

               dx, dy : MyReal;
               ActiveToolButton: TToolButton;
               ActiveRadio: TRadioButton;
               MousePushed:boolean;
               //b:::::::::::::::::
                    Dim_Modified : boolean;
               //e::::::::::::::::::
               Procedure ChangeDrawSize;
               Procedure Scaling;
               Procedure SetScale;
               Procedure AppendZone;
               Procedure DeleteZone;
               Procedure AppendNode;
               Procedure ShowNodeInfo;
               Procedure MainRePaint;
               procedure LoadForm(Name:string);
               procedure SaveForm(Name:string);
               procedure ZoomAreaRect(x1,y1,x2,y2:MyReal);
               Procedure SetDiapazon;
               Procedure UpdateVizParams;
               Procedure ShowForm;
     End;

Var
//b:::::::::::::::
     ZoneInfo     : TZoneInfo;
     ZoneCount    : integer;
     PrevDim      : integer;

//e:::::::::::::::
     SetForm1 : TSetForm1;
{**********************************}
     dop :integer;
     BmpPic: TBitMap;{***}
     
procedure AddBeckUp;
Procedure GetZoneInfo(var ZoneInfo: TZoneInfo;var ZoneCount: integer);
procedure SaveSdmFile;

Implementation
Uses Math, strfunc, MainInterface,MainParam,Registry,PrnServ,FStruct ,
  FormSettingsUnit, CalcDistanceUnit;
Const
     paintdx= 10;
     paintdy= 10;
Var
     GridOffSet              : MyReal;
     PaintWidth, PaintHeight : integer;
     MouseX, MouseY          : MyReal;
     Scale                   : MyReal;
     HighLightNode           : word;
     MovedNode               : word;
     DownX,DownY             : integer;
     CenterX,CenterY         : integer;
     OffsetX,OffsetY         : MyReal;
     SOffsetX,SOffsetY       : MyReal;
     FigureX,FigureY         : MyReal;
     CM                      : MyReal;
     FloatFormat             : string;
     Area                    : TArea;
     RestoreButton           : TToolButton;
     CurrentBackUp           : integer=0;
     CountBackUp             : integer=0;
     Edit                    : boolean;

{$R *.DFM}
{$R Cur.res}

procedure SaveSdmFile;
var
     FileName  : string;
     fhname    : TextFile;
     fname     : string;
begin
               // ���������� ����������� ��������� �����
               FileName:=String(Project_GetFormFile);
               if FileName='' then exit;
               fname := GetDimFileName(FileName) + '.sdm';
               AssignFile(fhname,fname);
               Rewrite(fhname);
               WriteLn(fhname,GetCurDim);
               WriteLn(fhname,GetSila);
               CloseFile(fhname);
end;

procedure DeleteAllBackUp;
var
     FileName:string;
begin
  while CountBackUp>0 do
  begin
      FileName:=ExtractFilePath(Project_GetFormFile);
      FileName:=FileName+'~'+IntToStr(CountBackUp)+'.sfm';
      DeleteFile(FileName);
      Dec(CountBackUp);
  end;
end;

procedure AddBeckUp;
var
     FileName:string;
Begin
  Inc(CurrentBackUp);
  inc(CountBackUp);
  FileName:=ExtractFilePath(Project_GetFormFile);
  FileName:=FileName+'~'+IntToStr(CurrentBackUp)+'.sfm';
  If FileName<>'' Then Form_Save(PChar(FileName));
  CheckState;
  if CurrentBackUp>0 then FormSettings.btnReset.Enabled:=true;
end;

procedure LoadBackUp;
var
     FileName:string;
begin
 if CurrentBackUp>0 then
 begin
      FileName:=ExtractFilePath(Project_GetFormFile);
      FileName:=FileName+'~'+IntToStr(CurrentBackUp)+'.sfm';
      If FileName<>'' Then Form_Load(PChar(FileName));
      SetForm1.ShowNodeInfo;
      SetForm1.MainRePaint;
      Dec(CurrentBackUp);
 end;
 if CurrentBackUp<1 then FormSettings.btnReset.Enabled:=false;
end;

function MyFloatToStr(X:MyReal):String;
begin
     Result:=FormatFloat(FloatFormat,X);
end;

function getTriangleArea(Node1, Node2, Node3:TNode): real ;
  var
    x1, x2, x3, y1, y2, y3 : real;
begin
    x1 := Node1.x;
    y1 := Node1.y;
    x2 := Node2.x;
    y2 := Node2.y;
    x3 := Node3.x;
    y3 := Node3.y;
  Result := abs(x1*(y2 - y3) + x2*(y3 - y1) + x3*(y1 - y2))/2;
end;

function MyDiv(x,y:MyReal):MyReal;
begin
     if abs(y)<0.1E-4900 then Result:=0.1E-4900
     else Result:=x/y;
end;
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
Begin
     Result:=Yp2Yr(PaintHeight-y);
End;

//b::::::::::::::::::
// ��������� ���������� ������� ������� ����������� � ��������� ���
Procedure GetZoneInfo(var ZoneInfo: TZoneInfo;var ZoneCount: integer);
        Var
             MainParams         : TMainParams;
             CountOfNodes, i, j : word;
             OneNode            : TNode;
             CountOfEdges       : word;
             S                  : real;
             Node1, Node2, Node3 : TNode;
        Begin
             MainParams:=GetMainParam;
             CountOfNodes:=Form_CountOfNodesInZone;
             CountOfEdges:=round(CountOfNodes/(MainParams.CountElements-1));
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
                       // ��������� ������� ����
                       // ��������� ������� ������������ 1-2-8
                       Node1 := Form_GetNodeValue(ZoneInfo[i].NodesNum[0]);
                       Node2 := Form_GetNodeValue(ZoneInfo[i].NodesNum[1]);
                       Node3 := Form_GetNodeValue(ZoneInfo[i].NodesNum[7]);
                       S := getTriangleArea(Node1, Node2, Node3);
                       // ��������� ������� ������������ 2-3-4
                       Node1 := Form_GetNodeValue(ZoneInfo[i].NodesNum[1]);
                       Node2 := Form_GetNodeValue(ZoneInfo[i].NodesNum[2]);
                       Node3 := Form_GetNodeValue(ZoneInfo[i].NodesNum[3]);
                       S := S + getTriangleArea(Node1, Node2, Node3);
                       // ��������� ������� ������������ 4-5-6
                       Node1 := Form_GetNodeValue(ZoneInfo[i].NodesNum[3]);
                       Node2 := Form_GetNodeValue(ZoneInfo[i].NodesNum[4]);
                       Node3 := Form_GetNodeValue(ZoneInfo[i].NodesNum[5]);
                       S := S + getTriangleArea(Node1, Node2, Node3);
                       // ��������� ������� ������������ 2-4-6
                       Node1 := Form_GetNodeValue(ZoneInfo[i].NodesNum[1]);
                       Node2 := Form_GetNodeValue(ZoneInfo[i].NodesNum[3]);
                       Node3 := Form_GetNodeValue(ZoneInfo[i].NodesNum[5]);
                       S := S + getTriangleArea(Node1, Node2, Node3);
                       // ��������� ������� ������������ 6-7-8
                       Node1 := Form_GetNodeValue(ZoneInfo[i].NodesNum[5]);
                       Node2 := Form_GetNodeValue(ZoneInfo[i].NodesNum[6]);
                       Node3 := Form_GetNodeValue(ZoneInfo[i].NodesNum[7]);
                       S := S + getTriangleArea(Node1, Node2, Node3);
                       // ��������� ������� ������������ 2-6-8
                       Node1 := Form_GetNodeValue(ZoneInfo[i].NodesNum[1]);
                       Node2 := Form_GetNodeValue(ZoneInfo[i].NodesNum[5]);
                       Node3 := Form_GetNodeValue(ZoneInfo[i].NodesNum[7]);
                       S := S + getTriangleArea(Node1, Node2, Node3);

                       ZoneInfo[i].ZoneS := S;
                       
                  End;
             End;
End;
//e::::::::::::::::::::
//********************************************************************************************************************
Procedure GetZoneInfo_1;  // �������
        Var
             MainParams         : TMainParams;
             CountOfNodes, i, j : word;
             OneNode            : TNode;
             CountOfEdges       : word;
        Begin
             MainParams:=GetMainParam;
             CountOfNodes:=Form_CountOfNodesInZone;
             CountOfEdges:=round(CountOfNodes/(MainParams.CountElements-1));
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
             if   OneNode.y>15 then    begin  ShowMessage('>20'); ShowMessage(floattostr(OneNode.y)); end;
             if   OneNode.y<20 then      ShowMessage('<20');

End;
//********************************************************************************************************************


procedure TSetForm1.LoadForm(Name:string);
var
     Registry:TRegistry;
     function ReadString(Name:string;Def:string):String;
     begin
          if Registry.ValueExists(Name) then Result:=Registry.ReadString(Name)
          else Result:=def;
     end;
     function ReadInteger(Name:string;Def:integer):integer;
     begin
          if Registry.ValueExists(Name) then Result:=Registry.ReadInteger(Name)
          else Result:=def;
     end;
     function ReadFloat(Name:string;Def:MyReal):MyReal;
     begin
          if Registry.ValueExists(Name) then Result:=Registry.ReadFloat(Name)
          else Result:=def;
     end;
     function ReadBool(Name:string;Def:boolean):boolean;
     begin
          if Registry.ValueExists(Name) then Result:=Registry.ReadBool(Name)
          else Result:=def;
     end;
begin
     Registry:=TRegistry.Create;
     Registry.RootKey:=HKEY_CURRENT_USER;
     if Registry.OpenKeyReadOnly(StringReg+'\'+Name) then
     begin
          WindowState:=wsNormal;
          Top:=ReadInteger('Top',Top);
          Left:=ReadInteger('Left',Left);
          Width:=ReadInteger('Width',Width);
          Height:=ReadInteger('Height',Height);
          if ReadBool('Maximized',false) then WindowState:=wsMaximized
          else WindowState:=wsNormal;
     end;
     if Registry.OpenKeyReadOnly(StringReg) then FloatFormat:=ReadString('FloatFormat','0.000E+00');
     Registry.free;
end;
procedure TSetForm1.SaveForm(Name:string);
var
     Registry:TRegistry;
begin
     Registry:=TRegistry.Create;
     Registry.RootKey:=HKEY_CURRENT_USER;
     if Registry.OpenKey(StringReg+'\'+Name,true) then
     begin
          Registry.WriteBool('Maximized',WindowState=wsMaximized);
          if WindowState=wsMaximized then WindowState:=wsNormal;
          Registry.WriteInteger('Top',Top);
          Registry.WriteInteger('Left',Left);
          Registry.WriteInteger('Width',Width);
          Registry.WriteInteger('Height',Height);
     end;
     if Registry.OpenKey(StringReg,true) then Registry.WriteString('FloatFormat',FloatFormat);
     Registry.free;
end;

////////////////////////Actions\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Procedure TSetForm1.Scaling;
Var
     Value : MyReal;
Begin
     if Scale=0 then Scale:=0.1E-17;
     If Scale>=1 Then
     Begin
          FormSettings.LabelScale.Caption:=MyFloatToStr(Scale)+' : 1';
     End
     Else Begin
          FormSettings.LabelScale.Caption:='1 : '+MyFloatToStr(1/Scale);
     End;
     GridOffSet:=power(10,trunc(Log10(20/Scale)-1));//20 pixels
     ChangeDrawSize;
End;
Procedure TSetForm1.SetDiapazon;
Var
     value : integer;
     max   : integer;
     pos   : integer;
Begin
     value:=1;
     If CheckInt(FormSettings.EditScale.text,value) Then
     Begin
          if (Value<2) then
          begin
               FormSettings.EditScale.text:='2';
               Value:=2;
          end;
          Max:=FormSettings.TrackBar1.Max;
          pos:=FormSettings.TrackBar1.Position;
          FormSettings.TrackBar1.Max:=(value-1)*2;
          FormSettings.TrackBar1.Position:=Round(pos/Max*FormSettings.TrackBar1.Max);
          SetScale;
     End;
End;
Procedure TSetForm1.SetScale;
Var
     Half:Integer;
     Value : MyReal;
Begin
     Half:=Round(FormSettings.TrackBar1.Max/2);
     if Scale>=1 then Value:=Scale else Value:=MyDiv(1,Scale);
     if Half<Value then
     begin
          Half:=Round(Value);
          FormSettings.TrackBar1.Max:=2*Half;
          FormSettings.EditScale.text:=inttostr(Half);
     end;
     if Scale>=1 then FormSettings.TrackBar1.Position:=Round(Half+Value-1)
     else FormSettings.TrackBar1.Position:=Round(Half-Value+1);
     Scaling;
End;
Procedure TSetForm1.ChangeDrawSize;
Begin
     Area:=Form_GetArea;
     FigureX:=(Area.maxx-Area.minx)/2;
     FigureY:=(Area.maxy-Area.miny)/2;
End;
Procedure TSetForm1.AppendZone;
Var
     i : word;
     INRG:word;
Begin
     Form_AddZone;
     UpdateVizParams;
     CurZone.ItemIndex:=INRG-1;
End;

Procedure TSetForm1.UpdateVizParams;
var
     MainParams:TMainParams;
     i,j,k:integer;
begin
     MainParams:=GetMainParam;
     FormSettings.GroupBox3.Caption:='���� <���������� ���: '+inttostr(MainParams.INRG)+'>';

     FormSettings.CurZone.Items.Clear;
     Form_SetCurreanZone(0);
     If MainParams.INRG>0 Then
     Begin
          For i:=1 To MainParams.INRG Do
          Begin
               FormSettings.CurZone.Items.Add(inttostr(i));
          End;
     End;
     FormSettings.GroupBox4.Caption:='���� <���������� �����: '+IntToStr(Form_GetNodeCount)+'>';

     FormSettings.CurNode.Items.Clear;
//������� ���������� �.�.
//  ShowMessage(IntToStr(Form_GetNodeCount));
     for i:=0 to Form_GetNodeCount-1 do
      FormSettings.CurNode.Items.Add(inttostr(Form_NodeValue(i).Number));
     FormSettings.GroupBox4.Enabled:=true;
end;

Procedure TSetForm1.DeleteZone;
Var
     i : word;
     INRG:word;
Begin
     AddBeckUp;
     Form_RemoveLastZone;
     UpdateVizParams;
     CurZone.ItemIndex:=INRG-1;
     ShowNodeInfo;
     MainRePaint;
End;

Procedure TSetForm1.AppendNode;
Begin
     If Form_PushNode(MouseX,MouseY) Then
     Begin
         ShowNodeInfo;
     End;
End;

Procedure TSetForm1.ShowNodeInfo;
Var
     CountOfNodes, i, j : word;
     Node               : TNode;
     Zone               : word;
     MainParams         : TMainParams;
Begin
     MainParams:=GetMainParam;
     CountOfNodes:=Form_CountOfNodesInZone;
     FormSettings.EditX.text:=MyFloatToStr(MouseX);
     FormSettings.EditY.text:=MyFloatToStr(MouseY);
     Node:=Form_FindNode(MouseX,MouseY,EpsilonVicinity/Scale);
     if Node.Number<=0 then Node:=Form_NodeValue(Form_GetNodeCount);
     Zone:=0;
     If MainParams.INRG>0 Then
     Begin
          FormSettings.CurZone.Items.Clear;
          For i:=0 To MainParams.INRG-1 Do
          Begin
               For j:=0 To CountOfNodes-1 Do
               Begin
                    If Form_GetNodeNumber(i,j)=Node.Number Then Zone:=i+1;
               End;
               FormSettings.CurZone.Items.Add(inttostr(i+1));
          End;
     End;
     UpdateVizParams;
     FormSettings.CurZone.ItemIndex:=zone-1;
     FormSettings.CurNode.ItemIndex:=0;
     //�������� Node.Number ��� �������������� ������������
     if (Form_GetNodeCount>0) and (Node.Number>0) then
     while (FormSettings.CurNode.Items.Strings[FormSettings.CurNode.ItemIndex]<>inttostr(node.number)) and (FormSettings.CurNode.ItemIndex<FormSettings.CurNode.Items.Count) do
      FormSettings.CurNode.ItemIndex:=FormSettings.CurNode.ItemIndex+1;
//�� ��� ����
//     CurNode.ItemIndex:=node.number-1;
End;
Procedure TSetForm1.MainRePaint;
Begin
     If FormSettings.UseBuffer.Checked Then
      PaintBox1Paint(Nil)
     Else PaintBox1.Repaint;
End;

{
������� ��� ���������
����� ������� ��
������� ���� � ����� �������
������� ����� � �������
}
function GetProjectName:String;
var
  projName:String;
  tempStr:String;
  slashPos:Integer;
  Registry:TRegistry;
begin
      projName := '';
     Registry        :=TRegistry.Create;
     Registry.RootKey:=HKEY_CURRENT_USER;
     if Registry.OpenKey(StringReg, true) then
     begin
          if Registry.ValueExists('InputFileName') then
          begin
          // �������� ������ ���� �� ����� �������
            tempStr:=Registry.ReadString('InputFileName');

            // �������� ������ ��� ����� �������
            while(Pos('\',tempStr) <> 0) do
            begin
              slashPos:= Pos('\',tempStr);
              Delete(tempStr,1,slashPos);
            end;
            Delete(tempStr,Pos('.',tempStr),Length(tempStr));
            // ������� ���������� � �������� ��� �������
            projName:= tempStr;
          end;
     end;
     Result := projName;
End;

/////////////////////////Events\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Procedure TSetForm1.FormCreate(Sender: TObject);
var
//b::::::::::::::
     dim    : integer;
//e::::::::::::::
{***************************************}
cfF: TIniFile;{***}
SigmaLocation:string;
i:integer;
Begin
    // ������ �. 2012
    // ������� ������ ��������, �� ���� �� ����������
    FormSettings := TFormSettings.Create(Self);
    FormSettings.Position := poScreenCenter;
    // ������� ������ �������� ����������
    CalcDistanceForm := TCalcDistanceForm.Create(Self);

     Caption := Caption + ' ' + GetProjectName+', �����: '+Project_GetFormFile;

     {*********************************************************}
      bmpPic:=Tbitmap.Create;
     {***}
     LoadForm('SetForm');

     MousePushed:=false;
     CM:=Screen.PixelsPerInch/CM_Inch;
     OffsetX:=0;
     OffsetY:=0;
     ActiveToolButton:=DefaultAction;
     ActiveRadio := RadioCM;
     Scale:=0.125;
     MovedNode:=0;
     Scaling;

     Form_Load(Project_GetFormFile);
//     if Form_Modified then MessageDlg('Modified!',mtError,[mbOk],0);
//b:::::::::::::::::::

//     if Form_Modified then MessageDlg('Modified12!',mtError,[mbOk],0);
     Dim_Modified := false;
//     if Form_Modified then MessageDlg('Modified2!',mtError,[mbOk],0);
//e::::::::::::::::::::
     UpdateVizParams;
//     if Form_Modified then MessageDlg('Modified3!',mtError,[mbOk],0);
     {***********************************}
     dop:=0;
     top:=0;
          //����������� ����� ������������ �����
     SigmaLocation   :=LowerCase(ExtractFilePath(ParamStr(0)));
     i:=pos('\bin',SigmaLocation);
     if i>0 then SetLength(SigmaLocation,i);
     cfF:=TIniFile.Create(SigmaLocation+'bin\sforms.ini');
//      cfF:=TIniFile.Create('sforms.ini');
      try
                dop:=CfF.ReadInteger('�������','������',top);
                top:=dop-StatusBar1.Height-8;
                left:=0;
                Height:=Screen.Height-dop;
                cfF.Free;
      except
                MessageDlg('�� ���� ��������� ���� sforms.ini!',mtError,[mbOk],0);
      end;
      {***}
      CurrentBackUp:=0;
      CountBackUp:=0;
      Edit:=false;
      Screen.Cursors[ZoomArea]:=LoadCursor(HInstance,'ZOOM');
      Screen.Cursors[ZoomIn]:=LoadCursor(HInstance,'IN');
      Screen.Cursors[ZoomOut]:=LoadCursor(HInstance,'OUT');
      Screen.Cursors[HandPas]:=LoadCursor(HInstance,'Hand');
//      Screen.Cursors[HandAct]:=LoadCursor(HInstance,'HandAct');

        // ������� ���������������� RadioButton'� � ����������� �� �����������
{     dim := StrToInt(getDimension);
//     if Form_Modified then MessageDlg('Modified1!',mtError,[mbOk],0);
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
     end; }
End;

Procedure TSetForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
Var
     node        : TNode;
     NeedRePaint : boolean;
Begin
  //TrackBar1.SetFocus;
     if MousePushed then
     begin
          if ActiveToolButton=MoveAction Then
          begin
               OffsetX:=SOffsetX+(Xpaint2Xreal(X)-Xpaint2Xreal(DownX));
               OffsetY:=SOffsetY+(Ypaint2Yreal(Y)-Ypaint2Yreal(DownY));
               MainRePaint;
          end else
          if ActiveToolButton=ZoomAreaAction Then
          begin
               MainRePaint;
               PaintBox1.Canvas.Brush.Style:=bsClear;
               PaintBox1.Canvas.Pen.Style:=psDash;
               PaintBox1.Canvas.Rectangle(X+cursorcrosdx,Y+cursorcrosdx,DownX+cursorcrosdx,DownY+cursorcrosdx);
          end;
     end;
     if ActiveToolButton=DefaultAction Then
     Begin
     node:=Form_FindNode(Xpaint2Xreal(x),Ypaint2Yreal(y),EpsilonVicinity/(2*Scale*CM));
     NeedRePaint:=false;
     If node.Number=0 Then
     Begin
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
     End;
     If (Form_ZoneFinished) Or (MovedNode<>0) Then
     Begin
          If FormSettings.UseGridEps.Checked Then
          Begin
               MouseX:=Round(MouseX/GridOffSet)*GridOffSet;
               MouseY:=Round(MouseY/GridOffSet)*GridOffSet;
          End;
          NeedRePaint:=true;
     End;
     if (Edit=false) and (MovedNode<>0) and (Form_ZoneFinished) then
     begin
      AddBeckUp;
      edit:=true;
     end;
     If MovedNode<>0 Then Form_SetNodeValue(MovedNode,MouseX,MouseY);
     If NeedRePaint Then MainRePaint;
     end;
End;
Procedure TSetForm1.PaintBox1Paint(Sender: TObject);
Var
     Bitmap : TBitMap;

     Procedure ShowGrid(Canvas:TCanvas);
     Var
          i, x, y : integer;
          ten:integer;
     Begin
          With Canvas Do
          Begin
               Pen.Width:=1;
               i:=0;
               y:=Yreal2Ypaint(i*GridOffSet);
               While y<=PaintHeight Do
               begin
                    dec(i);
                    y:=Yreal2Ypaint(i*GridOffSet);
               end;
               While y>=0 Do
               Begin
                    if i<>0 then
                    begin
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
               While x>=0 Do
               Begin
                    dec(i);
                    x:=Xreal2Xpaint(i*GridOffSet);
               End;
               While x<=PaintWidth Do
               Begin
                    if i<>0 then
                    begin
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
        Zone                  : word;
        MainParams            : TMainParams;
        Begin
             MainParams:=GetMainParam;
             CountOfNodes:=Form_CountOfNodesInZone;
             k := 0;
             With Canvas Do
             Begin
              Brush.Color := clWhite;
              For j:=0 To MainParams.INRG-1 Do
              Begin
                   For i:=0 To CountOfNodes-1 Do
                   Begin
                        Node:=Form_NodeValue(k);
                        If Node.Number>0 Then
                        Begin
                             TextOut(Round(Xreal2Xpaint(Node.X))+Point,Round(Yreal2Ypaint(Node.Y))+Point,FloatToStr(Node.Number));
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
             OneNode                     : TNode;
             x0,y0,x2,y2,x4,y4,x6,y6,x,y : real;
             width, heigth, d            : integer;
        Begin
             MainParams:=GetMainParam;
             CountOfNodes:=Form_CountOfNodesInZone;
             With Canvas Do
             Begin
                  If MainParams.INRG>0 Then
                  Begin
                       GetZoneInfo(ZoneInfo,ZoneCount);
                       //���� ��������� ��� ������ 1, �� ��������� ������
                       if MainParams.INRG-1-n>-1 then
                       For i:=0 To MainParams.INRG-1-n Do
                       Begin
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
                            Font.Size := 14;
                            Font.Color := clFuchsia;
                              TextOut(Round(Xreal2Xpaint(x)),Round(Yreal2Ypaint(y)),IntToStr(ZoneInfo[i].ZoneNum+1));
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
          Point:=round(EpsilonVicinity/2);
          With Canvas Do
          Begin
               Pen.Width:=2;
               Pen.Color:=clBlue;
               If count>0 Then
               Begin
                    For i:=0 To count-1 Do//������� ���
                    Begin
                         ShowLast:=false;
                         ExistFirst:=false;
                         Pen.Color:=clBlue;
                         For j:=0 To CountOfNodes-1 Do//������� ����� ����
                         Begin
                              NNode:=Form_GetNodeNumber(i,j);
                              If NNode<>0 Then
                              Begin
                                   OneNode:=Form_GetNodeValue(NNode);
                                   //Pen.Width:=2;
                                   x:=Xreal2Xpaint(OneNode.x);
                                   y:=Yreal2Ypaint(OneNode.y);
                                   If OneNode.Number=MovedNode Then
                                   Begin
                                        pen.Color   := clGreen;
                                        brush.color := clGreen;
                                        brush.style := bsSolid;
                                        Ellipse(x-Point,y-Point,x+Point,y+Point);
                                        pen.Color:=clBlue;
                                   End
                                   Else Begin
                                        If OneNode.Number=Active Then
                                        Begin
                                             pen.Color   := clRed;
                                             brush.color := clRed;
                                             brush.style := bsSolid;
                                             Ellipse(x-Point,y-Point,x+Point,y+Point);
                                             pen.Color:=clBlue;
                                        End

                                        Else Begin
                                             pen.Color   := clBlue;
                                             brush.color := clBlue;
                                             brush.style := bsSolid;
                                             Ellipse(x-Point,y-Point,x+Point,y+Point);
                                        End;
                                   End;
                                   If (MainParams.INRG-1=i) and (not Form_ZoneFinished) Then pen.Color:=clRed;
                                   If j=0 Then
                                   Begin
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
          If FormSettings.UseNodeNum.Checked Then ShowNodeNum(Canvas,Point);
          If FormSettings.UseZoneNum.Checked Then
          Begin
               If ShowLast Then
                    ShowZoneNum(Canvas,0)
               Else
                    ShowZoneNum(Canvas,1);
          End;
//e::::::::::::::::::::::
     End;
Begin

     PaintWidth:=PaintBox1.Width;
     PaintHeight:=PaintBox1.Height;
     CenterX:=Trunc(PaintWidth/2);
     CenterY:=Trunc(PaintHeight/2);
     Try
          If FormSettings.UseBuffer.Checked Then
          Begin
               Bitmap := TBitmap.Create;
               Bitmap.Width:=PaintBox1.Width;
               Bitmap.Height:=PaintBox1.Height;
          End;
          If FormSettings.UseGrid.Checked Then
          Begin
               If FormSettings.UseBuffer.Checked Then ShowGrid(Bitmap.Canvas)
               Else ShowGrid(PaintBox1.Canvas);
          End;
          If FormSettings.UseBuffer.Checked Then
          Begin
               ShowZones(HighLightNode,BitMap.Canvas);
               paintbox1.Canvas.Draw(0,0,BitMap);
{****************************************************}
//�������� ����������� � �������������� ����������
              bmpPic.Width:=Bitmap.Width;
              bmpPic.Height:=Bitmap.Height;
              bmpPic.Canvas.Draw(0,0,BitMap);  {***}
          End
          Else ShowZones(HighLightNode,PaintBox1.Canvas);
     Finally
          If FormSettings.UseBuffer.Checked Then Bitmap.Free;
     End;
End;

Procedure TSetForm1.TrackBar1Change(Sender: TObject);
var
     Half, Value : MyReal;
Begin
     Half:=round((FormSettings.TrackBar1.Max)/2);
     Value:=abs(FormSettings.TrackBar1.Position-Half);
     If FormSettings.TrackBar1.Position>=Half Then Scale:= 1+Value
     Else Scale:=1/(1+Value);
     Scaling;
     MainRePaint;
End;

Procedure TSetForm1.SetForm1Resize(Sender: TObject);
Begin
{     Constraints.MaxHeight:=Screen.Height-dop;
     top:=dop-StatusBar1.Height-8;
     ChangeDrawSize;    }
End;
Procedure TSetForm1.EditScaleKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
     If Key=VK_RETURN Then SetDiapazon;
End;

Procedure TSetForm1.PaintBox1Click(Sender: TObject);
Begin
     If not Form_ZoneFinished Then AppendNode;
     If HighLightNode<>0 Then ShowNodeInfo;

     // ������ �. ��������� ����� �� ���������� ���������� ����� ������
     CalcDistanceForm.insertNodeIntoList(MouseX, MouseY, Scale);
End;

Procedure TSetForm1.AddZoneClick(Sender: TObject);
Begin
    //��������� ������ � ������� �������. ���� ��������� ���� ����� ������,
    //�� ���� ����� ��������� �� ���������.
    DefaultAction.OnClick(DefaultAction);
    AddBeckUp;
    AppendZone;
End;

Procedure TSetForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
  //�������� �� ������������� ������� ���� ������ ����
   if (ssLeft in shift) and (ssRight in shift) then
   begin
    ToolButton1.click;
    DefaultAction.Click;
    RestoreButton:=nil;
   end
   else
   begin
     MovedNode:=HighLightNode;
     DownX:=X;
     DownY:=Y;
     //�������� �� ������� ������ ������ ����
     if Button = mbRight then
     begin
      MovedNode:=0;
      if RestoreButton = nil then
      begin
        //���������� ����� ������ ���� ������
        RestoreButton:=ActiveToolButton;
        //�������� ������ MoveAction
        MoveAction.Click;
      end;
     end;
     if MoveAction.Down Then
     begin
          SOffsetX:=OffsetX;
          SOffsetY:=OffsetY;
     end;
     MousePushed:=true;
   end;
End;
procedure TSetForm1.ZoomAreaRect(x1,y1,x2,y2:MyReal);
var
     x,y:MyReal;
begin
     if (x1<>x2) and (y1<>y2) then
     begin
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
Procedure TSetForm1.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
     if ActiveToolButton=MoveAction Then
     begin
          OffsetX:=SOffsetX+(Xpaint2Xreal(X)-Xpaint2Xreal(DownX));
          OffsetY:=SOffsetY+(Ypaint2Yreal(Y)-Ypaint2Yreal(DownY));
          Screen.Cursor:= crDefault;
     End else if ActiveToolButton=ZoomAreaAction Then
     begin
          if (abs(X-DownX)>5) and (abs(Y-DownY)>5) then
          ZoomAreaRect(Xpaint2Xreal(X+cursorcrosdx), Ypaint2Yreal(Y+cursorcrosdx), Xpaint2Xreal(DownX+cursorcrosdx), Ypaint2Yreal(DownY+cursorcrosdx));
     End
     else if (ActiveToolButton=ZoomInAction) or (ActiveToolButton=ZoomOutAction) Then
     begin
          OffsetX:=OffsetX+(Xpaint2Xreal(CenterX)-Xpaint2Xreal(X+11));
          OffsetY:=OffsetY+(Ypaint2Yreal(CenterY)-Ypaint2Yreal(Y+11));
          if (ActiveToolButton=ZoomInAction) then
            FormSettings.TrackBar1.Position:=FormSettings.TrackBar1.Position+1
          else FormSettings.TrackBar1.Position:=FormSettings.TrackBar1.Position-1;
     end else MovedNode:=0;
     MousePushed:=false;
     Edit:=false;
     //�������������� ������
     if RestoreButton<>nil then
     begin
      RestoreButton.Click;
      RestoreButton:=nil;
     end;
     MainRePaint;
End;

Procedure TSetForm1.SaveBtnClick(Sender: TObject);
var
     FileName:string;
Begin
     FileName:=String(Project_GetFormFile);
     if not ((Length(FileName)>0) and (LowerCase(ExtractFileExt(FileName))='.sfm')) then
     Begin
          If SaveDialog1.Execute Then
          Begin
               Project_SetFormFile(PChar(SaveDialog1.FileName));
          End;
          FileName:=String(Project_GetFormFile);
     End;
     If FileName<>'' Then
     begin
      Form_Save(PChar(FileName));
      SaveSdmFile;
      Dim_Modified:=false;
     end;
     {
     ShowMessage('qqqq');
     GetZoneInfo_1;
     ShowMessage('qqqq_111');
     }
CheckState;
End;

Procedure TSetForm1.RepearBtnClick(Sender: TObject);
Begin
    LoadBackUp;
    GroupBox4.Enabled:=true;
End;

Procedure TSetForm1.UseGridClick(Sender: TObject);
Begin
     MainRePaint;
End;

Procedure TSetForm1.CurNodeChange(Sender: TObject);
Var
     N : TNode;
Begin
     N:=Form_GetNodeValue(StrToInt(FormSettings.CurNode.Items.Strings[FormSettings.CurNode.ItemIndex]));
     FormSettings.EditX.text:=MyFloatToStr(N.X);
     FormSettings.EditY.text:=MyFloatToStr(N.Y);
End;

Procedure TSetForm1.DelZoneClick(Sender: TObject);
Begin
 if FormSettings.CurZone.Text='' then
 begin
    ShowMessage('�� ������� ����');
    exit;
 end;
  Form_SetCurreanZone(0);
  Form_SetCurreanZone(StrToInt(FormSettings.CurZone.text));
  if Form_GetCurreanZone>0 then DeleteZone else ShowMessage('������� ����� ����� ����');
End;

procedure TSetForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
     can_close : boolean;
     Dialog    : word;
//b::::::::::::::::::
     FileName  : string;
     fhname    : TextFile;
     fname     : string;
//e::::::::::::::::::
begin
{     if Form_Modified or Dim_Modified then
        can_close:=false
     else
        can_close:=true;

     if not can_close then
     begin
          Dialog:=MessageDlg('��������� �����?', mtConfirmation,mbYesNoCancel, 0);
          if Dialog=mrYes then
          begin
               //b::::::::::::::::::
               // ���������� ����������� ��������� �����
               //FileName:=String(Project_GetFormFile);
               //fname := GetDimFileName(FileName) + '.sdm';
               //AssignFile(fhname,fname);
               //Rewrite(fhname);
               //WriteLn(fhname,GetCurDim);
               //CloseFile(fhname);
               SaveBtnClick(Sender);
               //e::::::::::::::::::
               if Form_Modified then
                  can_close:=false
               else
                  can_close:=true;
               Action:=caFree;
          end;
          if Dialog=mrNo then can_close:=true;
          if Dialog=mrCancel then Action:=caNone;
     end;

     if can_close then
     begin}
        DeleteAllBackUp;
        if frmZoneStruct <> nil then frmZoneStruct.Close;
        SaveForm('SetForm');
        SetForm1:=nil;
        bmpPic.Free;
        Action:=caFree;
{     end
     else
        Action:=caNone;}

{*************************************************}

end;

procedure TSetForm1.SpeedButton1Click(Sender: TObject);
begin
     if MainParamsForm=nil then
     begin
          MainParamsForm:=TMainParamsForm.Create(nil);
          MainParamsForm.Icon.Handle:=SetForm1.Icon.Handle;
     end;
     MainParamsForm.ShowModal;
end;

//���������� �������� ��� ��������
procedure TSetForm1.ChangeActionClick(Sender: TObject);
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
     MainRePaint;
end;

procedure TSetForm1.ToolButton1Click(Sender: TObject);
//var
begin
     Area:=Form_GetArea;

     ZoomAreaRect(Area.minx, Area.miny, Area.maxx, Area.maxy);
     MainRePaint;
end;
procedure TSetForm1.ShowForm;
begin
     show;
     ToolButton1Click(nil);
end;

procedure TSetForm1.EditScaleExit(Sender: TObject);
begin
     SetDiapazon;
end;

procedure TSetForm1.SpeedButton3Click(Sender: TObject);
begin
{*************************************************}
//���������� �����������  ������ �����
     if SavePicDlg.Execute then
     begin
//b:::::::::::::::::
// �������� �� ������������� �����
          If FileExists(SavePicDlg.FileName) Then
          Begin
               If MessageDlg('�������� '+SavePicDlg.FileName+' ?', mtConfirmation,mbOKCancel, 0)=mrOK Then bmpPic.SaveToFile(SavePicDlg.FileName);
          End
               Else
//e:::::::::::::::::
               bmpPic.SaveToFile(SavePicDlg.FileName);
     end;
end;

procedure TSetForm1.SpeedButton2Click(Sender: TObject);
begin
{*************************************************}
//���������� ����������� ����� ����
     if SavePicDlg.Execute then
     begin
//b:::::::::::::::::
// �������� �� ������������� �����
          If FileExists(SavePicDlg.FileName) Then
          Begin
               If MessageDlg('�������� '+SavePicDlg.FileName+' ?', mtConfirmation,mbOKCancel, 0)=mrOK Then GetFormImage.SaveToFile(SavePicDlg.FileName);
          End
               Else
//e:::::::::::::::::
               GetFormImage.SaveToFile(SavePicDlg.FileName);
     end;
end;

procedure TSetForm1.SpeedButton5Click(Sender: TObject);
   var ttt:TPrintService;
begin
             ttt.PrinterSetupDialog;
end;

procedure TSetForm1.SpeedButton4Click(Sender: TObject);
begin
           print;
end;

//b::::::::::::::::::
// �������� ����������� ������� �����
procedure TSetForm1.UseNodeNumClick(Sender: TObject);
begin
     MainRePaint;
end;

// �������� ����������� ������� ���
procedure TSetForm1.UseZoneNumClick(Sender: TObject);
begin
     MainRePaint;
end;

// ������� ������ "��������� ���"
procedure TSetForm1.SpeedButton6Click(Sender: TObject);
begin
     if frmZoneStruct = nil then
     begin
          frmZoneStruct := TfrmZoneStruct.Create(nil);
          GetZoneInfo(ZoneInfo,ZoneCount);
          frmZoneStruct.ZoneInfo := ZoneInfo;
          frmZoneStruct.ZoneCount := ZoneCount;
          frmZoneStruct.Show;
     end
     else
          frmZoneStruct.Show;
end;

// �������� ����������� "��"
procedure TSetForm1.RadioMMClick(Sender: TObject);
var
    MmDim : byte;
begin
    if TRadioButton(Sender).Name='RadioMM' then MmDim:= 0;
    if TRadioButton(Sender).Name='RadioCM' then MmDim:= 1;
    if TRadioButton(Sender).Name='RadioDM' then MmDim:= 2;
    if TRadioButton(Sender).Name='RadioM' then MmDim:= 3;
     Dim_Modified := true;
     PrevDim := GetCurDim;
     SetCurDim(MmDim);
     Node_ReDimension(PrevDim-GetCurDim);
     ToolButton1Click(Self);
     //ToolButton1Click(Self);
     ActiveRadio := RadioMM;
     if FormSettings.CurNode.Text='' then HighLightNode:=0 else HighLightNode:=StrToInt(FormSettings.CurNode.Text);
     MouseX:=Form_GetNodeValue(HighLightNode).x;
     MouseY:=Form_GetNodeValue(HighLightNode).y;
     If HighLightNode<>0 Then ShowNodeInfo;
end;
//e::::::::::::::::::

procedure TSetForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Modified: Boolean;
    Dialog    : word;
begin
     if Form_Modified or Dim_Modified then
        Modified:=true
     else
        Modified:=false;

     if Modified then
     begin
          Dialog:=MessageDlg('��������� �����?', mtConfirmation,mbYesNoCancel, 0);
          if Dialog=mrYes then
          begin
               //b::::::::::::::::::
               SaveBtnClick(Sender);
               //e::::::::::::::::::
//               if Form_Modified then
//                  can_close:=false
//               else
//                  can_close:=true;
               CanClose:=true;
          end;
          if Dialog=mrNo then CanClose:=true;
          if Dialog=mrCancel then CanClose:=false;
     end;

end;

procedure TSetForm1.Button1Click(Sender: TObject);
begin
close;
end;

procedure TSetForm1.Button4Click(Sender: TObject);
begin
  AddBeckUp;
  Form_NodeRefresh;
  UpdateVizParams;
  MainRePaint;
end;

procedure TSetForm1.Button2Click(Sender: TObject);
var
  num:integer;
begin
 if CurZone.Text='' then
 begin
    ShowMessage('�� ������� ����');
    exit;
 end;
 num:=StrToInt(CurZone.Text);
 if (num>0) and (num<=ZoneCount) then
 begin
  AddBeckUp;
  Form_SetZonePass(num-1);
  UpdateVizParams;
  MainRePaint;
 end else MessageDlg('������� ����� ����� ����',mtError,[mbOK],0)
end;

procedure TSetForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  RestoreButton:=ActiveToolButton;
  if key=VK_F4 then ToolButton1.click;
  if key=VK_F2 then ZoomAreaAction.Click;
end;

// ��������� ��������� �������� � ���� ����� ���������� X
procedure TSetForm1.EditXConfirm(Sender: TObject);
Var
     NewPos : MyReal;
     N : TNode;
begin

    if FormSettings.CurNode.Text='' then
    begin
      //ShowMessage('�� ������ ����');
      exit;
    end;
    NewPos:=1;
    If CheckReal(TEdit(sender).Text,NewPos) Then
    Begin
      AddBeckUp;
      N:=Form_GetNodeValue(StrToInt(FormSettings.CurNode.Text));
      if TEdit(sender).Name='EditX' then Form_SetNodeValue(StrToInt(FormSettings.CurNode.Text),NewPos,N.Y)
      else Form_SetNodeValue(StrToInt(FormSettings.CurNode.Text),N.X,NewPos);
      MainRePaint;
    End;
end;

// ��������� ��������� �������� � ���� ����� ���������� Y
procedure TSetForm1.EditYConfirm(Sender: TObject);
Var
     NewPos : MyReal;
     N : TNode;
begin

    if FormSettings.CurNode.Text='' then
    begin
      //ShowMessage('�� ������ ����');
      exit;
    end;
    NewPos:=1;
    If CheckReal(TEdit(sender).Text,NewPos) Then
    Begin
      AddBeckUp;
      N:=Form_GetNodeValue(StrToInt(FormSettings.CurNode.Text));
      if TEdit(sender).Name='EditX' then Form_SetNodeValue(StrToInt(FormSettings.CurNode.Text),NewPos,N.Y)
      else Form_SetNodeValue(StrToInt(FormSettings.CurNode.Text),N.X,NewPos);
      MainRePaint;
    End;
end;

procedure TSetForm1.EditXKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    EditXConfirm(Sender);
  end
  else
    if not (key in ['0'..'9']+[',']+[#8]) then key:=#0;
end;



procedure TSetForm1.FormDestroy(Sender: TObject);
begin
  DeleteAllBackUp;
end;

procedure TSetForm1.EditXExit(Sender: TObject);
begin
    EditXConfirm(Sender);
end;

procedure TSetForm1.EditYExit(Sender: TObject);
begin
    EditYConfirm(Sender);
end;

procedure TSetForm1.New(Sender: TObject; var NewSize: Integer;
  var Accept: Boolean);
begin
 If NewSize< 200 then
 begin
 NewSize:=200;
 end;
end;

procedure TSetForm1.btnSetVisiblePanelClick(Sender: TObject);
begin
  // ���������� ������, ���� ��� ������
  if ( FormSettings.Visible = false ) then
  begin
    // ������� ������ �������
    FormSettings.Visible := true;
    // �������� ������� ���������
    UpdateVizParams;
    //btnSetVisiblePanel.Caption := '������ ������ ��������';
  end
  else
  begin
    // ������ ������
    FormSettings.Visible := false;
    //btnSetVisiblePanel.Caption := '�������� ������ ��������';
  end;

end;

procedure TSetForm1.btnCalcDistanceClick(Sender: TObject);
begin
  //���������� ����� �������� ����������
  if (CalcDistanceForm = nil ) then
  begin
    CalcDistanceForm := TCalcDistanceForm.Create(self);
    CalcDistanceForm.Position := poScreenCenter;
  end;
  CalcDistanceForm.Show;
  // ���������� ������, ���� ��� ������
{  if ( CalcDistanceForm.Visible = false ) then
  begin
    // ������� ������ �������
    CalcDistanceForm.Visible := true;
    //SetForm1.btnCalcDistance.Caption := '������ ������� ����������';
  end
  else
  begin
    // ������ ������
    CalcDistanceForm.Visible := false;
    //SetForm1.btnCalcDistance.Caption := '������� ������� ����������';
  end;   }
end;



End.
