unit Sets;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, FileCtrl, Shellapi;

type
  TConfForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    OK: TButton;
    Cancel: TButton;
    GroupBox1: TGroupBox;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    StartCoordinates: TEdit;
    Label2: TLabel;
    StartForce: TEdit;
    Label3: TLabel;
    StartBound: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    StartMovings: TEdit;
    StartRenum: TEdit;
    StartElements: TEdit;
    StartStress: TEdit;
    Start1: TEdit;
    Start2: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ScrollBox1: TScrollBox;
    Label11: TLabel;
    Finish5: TEdit;
    Finish4: TEdit;
    Finish3: TEdit;
    Finish2: TEdit;
    Finish1: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Start3: TEdit;
    Start4: TEdit;
    Start5: TEdit;
    Start6: TEdit;
    Finish6: TEdit;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Start7: TEdit;
    Start8: TEdit;
    Start9: TEdit;
    Start10: TEdit;
    Start11: TEdit;
    Start12: TEdit;
    Finish12: TEdit;
    Finish11: TEdit;
    Finish10: TEdit;
    Finish9: TEdit;
    Finish8: TEdit;
    Finish7: TEdit;
    Label22: TLabel;
    Start13: TEdit;
    Finish13: TEdit;
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    DelObj: TCheckBox;
    MakeBak: TCheckBox;
    DelData: TCheckBox;
    DelMak: TCheckBox;
    GroupBox3: TGroupBox;
    Label23: TLabel;
    Button1: TButton;
    SourceDir: TEdit;
    GroupBox4: TGroupBox;
    Label24: TLabel;
    FloatFormat: TEdit;
    Label25: TLabel;
    OutDir1: TEdit;

    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    TabSheet4: TTabSheet;
    GroupBox5: TGroupBox;
    TreeView1: TTreeView;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    GroupBox6: TGroupBox;
    Label26: TLabel;
    Button6: TButton;
    SourceDirDll: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    TabSheet5: TTabSheet;
    GroupBox7: TGroupBox;
    Label27: TLabel;
    ColorDialog1: TColorDialog;
    zonesLineColor: TEdit;
    ZonesFontColor: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label28: TLabel;
    ComboBoxZoneFontSize: TComboBox;
    ScrollBox2: TScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure OKClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeView1Collapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure TreeView1CustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure zonesLineColorClick(Sender: TObject);
    procedure ZonesFontColorClick(Sender: TObject);
{kotov}
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CreateCheckbox;
    procedure UpdateCheckBox;
    procedure ReadResultConst;
    procedure WriteResultConst;
    procedure ReadFiles;                                                        
    procedure WriteFiles;
    procedure SaveColors;
    procedure ReadColors;
    {kotov}
    procedure GetModulesCompile;
  end;
const
     MsgCount=32;
     CheckHints:array [1..MsgCount] of String=
     ('1. NRC, �������, ��������� ���������, �������� ��.(DATA)', '2. �������� ���������� ������� ����� ���.(GRIDDM)', '3. ����� ��� ���������.(GRIDDM)',
'4. ������ ����� �� ����� (GRIDDM)', '5. ��������-���� �� ����� (GRIDDM)', '6. ���������� ����� �� ����� (GRIDDM)', '7. �������������� ����� � �������������� ������� (GRIDDM)',
'8. ������ ������� �  (MAIN)', '9. ������ ������� � ��������� ����', '10. ��������� ��������� - �� � ��� ����. (RENMDD)',
'11. ��������� ��������� XADJ, ADJNCY. (RENMDD)', '12. ������� ������� �����- ������/����� ������ (RENMDD)', '13.  ������� ������� ����� - �����/������ ������ (RENMDD)',
'14. �������� ��������� - �� � ��� ����. ( MAIN )', '15. ������ ����������� ����������� ����� (REGULARIZATION)', '16.  ������ ��������� L (RCMSLV)', '17.  ����������� ������ ���������� ������  �����  FNENDD (MAIN)',
'18. ������', '19. ���������� ����� (MAIN)', '20.  ������  NOP ����� � � FORMDD (MAIN)', '21.  ��������� �����������  (BOUND)', '22. ��������� ��������� � FORCE (��������)',
'23. ������������� �������� �� �����. (FORCE)', '24. ��������� ����� �������� ������', '25. �������������� ���������������� ���������� ����� ��������', '26.  ��������� � ������ ��������', '27.  ������������� ������ ��� ����������� ������ XENV (MAIN)',
'28. ������ ��������, ������ ����� ������� (MAIN)', '29. ������', '30. ������','31.  ����������� ����� (MAIN)','32.  ���������� � �� (STRDD)');
var
  ConfForm: TConfForm;

implementation
uses MainForm, BrowseFolder,Registry,Constants,TProject{kotov};

{
����� �������� �����(�������� �� ��� ��� �����
������� �������� �� �������. � ��, ������� ���
�������������, ������ ������ ����� ������ �� ���
���������� ���������� �������. *�������*
}
{$R *.DFM}
procedure TConfForm.CreateCheckbox;
var
     i,z:integer;
     //CheckBox:TCheckBox;
begin
     for i:=1 to MsgCount do
     begin
          with TCheckBox.Create(GroupBox1) do
          begin
               Parent:=GroupBox1;
               Name:='CheckBox'+InttoStr(i);
               Hint:=CheckHints[i];
               Caption:=CheckHints[i];
               ShowHint:=true;
               //����� �������� �����, ������ ������������� ����, ���������� ����
               Width:= 420;
               Height:= 17;
               z:=(i-1) mod 2;
               Left:=8+Width*(z);
               Top:=14+16*trunc((i-z)/2);
               if CheckHints[i]='������' then State:=cbGrayed
               else Checked:=(SigmaIni.ReadString('FortranPrint',InttoStr(i),'NO')='YES');
          end;
     end;
end;
procedure TConfForm.UpdateCheckBox;
var
     i,l:integer;
     control:TControl;
     Name:string;
begin
     l:=GroupBox1.ControlCount;
     for i := 1 to l do
     begin
          control:=GroupBox1.Controls[i-1];
          if (control is TCheckBox) then
          begin
               Name:=control.Name;
               Name:=Copy(Name,9,Length(Name)-8);
               if (control as TCheckBox).checked then SigmaIni.WriteString('FortranPrint',Name,'YES')
               else SigmaIni.WriteString('FortranPrint',Name,'NO');
          end;
     end;
end;
procedure TConfForm.ReadResultConst;
     procedure ReadIt(Edit:TEdit);
     begin
          Edit.Text:=SigmaIni.ReadString('ResultSets',Edit.Name,'');
     end;
begin
     ReadIt(StartCoordinates);
     ReadIt(StartForce);
     ReadIt(StartBound);
     ReadIt(StartRenum);
     ReadIt(StartMovings);
     ReadIt(StartElements);
     ReadIt(StartStress);
     ReadIt(Start1); ReadIt(Finish1);
     ReadIt(Start2); ReadIt(Finish2);
     ReadIt(Start3); ReadIt(Finish3);
     ReadIt(Start4); ReadIt(Finish4);
     ReadIt(Start5); ReadIt(Finish5);
     ReadIt(Start6); ReadIt(Finish6);
     ReadIt(Start7); ReadIt(Finish7);
     ReadIt(Start8); ReadIt(Finish8);
     ReadIt(Start9); ReadIt(Finish9);
     ReadIt(Start10);ReadIt(Finish10);
     ReadIt(Start11);ReadIt(Finish11);
     ReadIt(Start12);ReadIt(Finish12);
     ReadIt(Start13);ReadIt(Finish13);
end;
procedure TConfForm.WriteResultConst;
     procedure WriteIt(Edit:TEdit);
     begin
          SigmaIni.WriteString('ResultSets',Edit.Name,Edit.Text);
     end;
begin
     WriteIt(StartCoordinates);
     WriteIt(StartForce);
     WriteIt(StartBound);
     WriteIt(StartRenum);
     WriteIt(StartMovings);
     WriteIt(StartElements);
     WriteIt(StartStress);
     WriteIt(Start1); WriteIt(Finish1);
     WriteIt(Start2); WriteIt(Finish2);
     WriteIt(Start3); WriteIt(Finish3);
     WriteIt(Start4); WriteIt(Finish4);
     WriteIt(Start5); WriteIt(Finish5);
     WriteIt(Start6); WriteIt(Finish6);
     WriteIt(Start7); WriteIt(Finish7);
     WriteIt(Start8); WriteIt(Finish8);
     WriteIt(Start9); WriteIt(Finish9);
     WriteIt(Start10);WriteIt(Finish10);
     WriteIt(Start11);WriteIt(Finish11);
     WriteIt(Start12);WriteIt(Finish12);
     WriteIt(Start13);WriteIt(Finish13);
end;

procedure TConfForm.SaveColors;
procedure WriteIt(Edit:TEdit);
     begin
          SigmaIni.WriteString('ColorSets',Edit.Name,ColorToString(Edit.Color));
     end;
procedure WriteFont(Edit:TComboBox);
     begin
          SigmaIni.WriteString('ColorSets',Edit.Name,Edit.Text);
     end;

begin
     WriteIt(zonesLineColor);
     WriteFont(ComboBoxZoneFontSize);
     WriteIt(ZonesFontColor);
end;
procedure TConfForm.ReadColors ;
procedure ReadIt(Edit:TEdit);
     begin
          Edit.Color:=StringToColor(SigmaIni.ReadString('ColorSets',Edit.Name,'0'));
     end;
procedure ReadFont(Edit:TComboBox);
     begin
          Edit.Text:=SigmaIni.ReadString('ColorSets',Edit.Name,'20');
     end;

begin
     ReadIt(zonesLineColor);
     ReadFont(ComboBoxZoneFontSize);
     ReadIt(ZonesFontColor);
end;
procedure TConfForm.ReadFiles;
var
     Registry:TRegistry;
begin
     Registry        :=TRegistry.Create;
     Registry.RootKey:=HKEY_CURRENT_USER;
     if Registry.OpenKey(StringReg, true) then
     begin
          SourceDir.Text:=Registry.ReadString(SigmaSource);
          if Registry.ValueExists(DelMakReg) then
          DelMak.Checked:=Registry.ReadBool(DelMakReg);
          if Registry.ValueExists(DelObjReg) then
          DelObj.Checked:=Registry.ReadBool(DelObjReg);
          if Registry.ValueExists(DelTmpReg) then
          DelData.Checked:=Registry.ReadBool(DelTmpReg);
          if Registry.ValueExists(CreateBakReg) then
          MakeBak.Checked:=Registry.ReadBool(CreateBakReg);
          if Registry.ValueExists('FloatFormat') then
          FloatFormat.Text:=Registry.ReadString('FloatFormat');
          if Registry.ValueExists('OutDir') then
          OutDir1.Text:=Registry.ReadString('OutDir');
          {kotov ->}
          SourceDirDll.Text:=Registry.ReadString(SigmaSourceDll);
          if Registry.ValueExists('CalcModule') then
          begin;
                if Registry.ReadBool('CalcModule') = false then
                        RadioButton1.Checked := true;
                if Registry.ReadBool('CalcModule') = true then
                        RadioButton2.Checked := true;
          end;              
          {<- kotov}
     End;
     Registry.Free;
end;
procedure TConfForm.WriteFiles;
var
     Registry:TRegistry;
begin
     Registry        :=TRegistry.Create;
     Registry.RootKey:=HKEY_CURRENT_USER;
     if Registry.OpenKey(StringReg, true) then
     begin
          Registry.WriteString(SigmaSource,SourceDir.Text);
          Registry.WriteBool(DelMakReg,DelMak.Checked);
          Registry.WriteBool(DelObjReg,DelObj.Checked);
          Registry.WriteBool(DelTmpReg,DelData.Checked);
          Registry.WriteBool(CreateBakReg,MakeBak.Checked);
          Registry.WriteString('FloatFormat',FloatFormat.Text);
          Registry.WriteString('OutDir',OutDir1.Text);
          {kotov ->}
          Registry.WriteString(SigmaSourceDll,SourceDirDLL.Text);
          if RadioButton1.Checked = true then
                Registry.WriteBool('CalcModule',false);
          if RadioButton2.Checked = true then
                Registry.WriteBool('CalcModule',true);
          {<- kotov}
     End;
     Registry.Free;
end;
procedure TConfForm.FormCreate(Sender: TObject);
var
     Registry:TRegistry;
begin
     Registry        :=TRegistry.Create;
     Registry.RootKey:=HKEY_CURRENT_USER;
     if Registry.OpenKey(StringReg, true) then

begin
     CreateCheckbox;
     ReadResultConst;
     ReadColors;
     ReadFiles;
     {kotov->}
     GetModulesCompile;
     if RadioButton1.Checked = true then begin
        SourceDir.Enabled := true;
        Button1.Enabled := true;
        SourceDirDLL.Enabled := false;
        Button6.Enabled := false;
     end
     else begin
        SourceDir.Enabled := false;
        Button1.Enabled := false;
        SourceDirDLL.Enabled := true;
        Button6.Enabled := true;
     end;
     if Project_Name <> '' then begin

{
        RadioButton1.Enabled := false;
        RadioButton2.Enabled := false;
}
          begin;
                if Registry.ReadBool('CalcModule') = true then
                        RadioButton1.Enabled := false;
                if Registry.ReadBool('CalcModule') = false then
                        RadioButton2.Enabled := false;
          end;
        {
        SourceDir.Enabled := false;
        Button1.Enabled := false;
        SourceDirDLL.Enabled := false;
        Button6.Enabled := false;}
     end
     {<- kotov}
end;
end;

procedure TConfForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TConfForm.FormDestroy(Sender: TObject);
begin
     ConfForm:=nil;
end;

procedure TConfForm.CancelClick(Sender: TObject);
begin
     close;
end;

procedure TConfForm.OKClick(Sender: TObject);
begin
     Hide;
     UpdateCheckBox;
     WriteResultConst;
     SaveColors;
     WriteFiles;
     {kotov}
     if RadioButton1.Checked = true then
     Project_SetSource(PChar(SourceDir.Text))
     else
     Project_SetSource(PChar(SourceDirDll.Text));
     close;
end;
{if Registry.OpenKey(StringReg, true) then
     begin
          s:=Registry.ReadString(SigmaSource);
          if (s='') or (not DirectoryExists(s)) then
          begin
               s:=SigmaLocation+'Source\';
               //������� ������� � ����� ������������
               //������������� ���������� � �������
               Registry.WriteString(SigmaSource,s);}
procedure TConfForm.Button1Click(Sender: TObject);
var
     Dialog:TBrowseFolderDlg;
     s:string;
begin
     Dialog:=TBrowseFolderDlg.Create(self);
     Dialog.FolderName:=SourceDir.Text;
     if Dialog.Execute then
     //if SelectDirectory(Path, [sdAllowCreate, sdPerformCreate, sdPrompt], 0) then
     begin
          s:=Dialog.FolderName;
          if s[Length(s)]<>'\' then s:=s+'\';
          SourceDir.Text := s;
     end;
     Dialog.Free;
end;

procedure TConfForm.Button6Click(Sender: TObject);
{kotov}
var
     Dialog:TBrowseFolderDlg;
     s:string;
begin
     Dialog:=TBrowseFolderDlg.Create(self);
     Dialog.FolderName:=SourceDirDll.Text;
     if Dialog.Execute then
     //if SelectDirectory(Path, [sdAllowCreate, sdPerformCreate, sdPrompt], 0) then
     begin
          s:=Dialog.FolderName;
          if s[Length(s)]<>'\' then s:=s+'\';
          SourceDirDll.Text := s;
     end;
     Dialog.Free;
end;

procedure TConfForm.RadioButton1Click(Sender: TObject);
begin
        {kotov}
        tabSheet4.TabVisible := false;
        SourceDir.Enabled := true;
        Button1.Enabled := true;
        SourceDirDLL.Enabled := false;
        Button6.Enabled := false;

end;

procedure TConfForm.RadioButton2Click(Sender: TObject);
begin
        {kotov}
        tabSheet4.TabVisible := true;
        SourceDir.Enabled := false;
        Button1.Enabled := false;
        SourceDirDLL.Enabled := true;
        Button6.Enabled := true;

end;

procedure TConfForm.GetModulesCompile;
{kotov}
begin
TreeView1.Items.Clear;
   if FileExists(SigmaLocation+'bin\'+'modules_compile.ini') then  begin
     TreeView1.LoadFromFile(SigmaLocation+'bin\'+'modules_compile.ini');
     TreeView1.FullExpand();
   end
   else
     if RadioButton2.Checked = true then
     MessageDlg('���������� ��������� ����������� � ������� ���������� �������. ���� modules_compile.ini �� ����������.', mtError,[mbYes],0)
end;
procedure TConfForm.TreeView1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
Node, SelNode, NewNode: TTreeNode;
begin

try
Node := TreeView1.GetNodeAt(X, Y);
if Node = nil then Exit;
SelNode := TreeView1.Selected;
if Node.Text = SelNode.Text then Exit;
TreeView1.items.AddChild(Node,SelNode.Text);
Node.Expand(false);


except;
end;

end;

procedure TConfForm.TreeView1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
const 
  cScrollOffset = 5;
var
  Node  : TTreeNode;

begin;
Accept := Source = TreeView1;

  Node    := TreeView1.TopItem;                                     //Get the top node as a reference.
  if (y < cScrollOffset) then                                             //Are we dragging at the top of the treeview ?
    SendMessage(TreeView1.Handle, WM_VSCROLL, SB_LINEUP,   0)       //Hey ... well scroll the treeview.
  else if (y > TreeView1.Height - cScrollOffset) then               //Dragging at the bottom ?
    SendMessage(TreeView1.Handle, WM_VSCROLL, SB_LINEDOWN, 0);      //Do a scroll !
  if (Node <> TreeView1.TopItem) then                               //Did we scroll ? ... well need to redraw ...
      TreeView1.Refresh;

end;

procedure TConfForm.TreeView1Collapsing(Sender: TObject; Node: TTreeNode;
  var AllowCollapse: Boolean);
begin
  AllowCollapse:=false;
end;

procedure TConfForm.TreeView1CustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
   if Node.Level = 0 then Sender.Canvas.Font.Style := [fsBold];
end;

procedure TConfForm.Button2Click(Sender: TObject);
begin
GetModulesCompile;
end;

procedure TConfForm.Button3Click(Sender: TObject);
var
Node, Node1: TTreeNode;
begin
   Node := TreeView1.Selected;
   Node.Delete;
   TreeView1.SetFocus();
end;

procedure TConfForm.Button4Click(Sender: TObject);
var
Node, NextNode: TTreeNode;
begin
  Node := TreeView1.Selected;
  if Node <> nil then
  begin;
   if Node.Level = 0 then
   begin
   if not Node.IsFirstNode then
    begin
        Node.MoveTo(Node.getPrevSibling,naInsert);
        Node.Expand(true);
    end;
    TreeView1.SetFocus();
   end
  end

end;

procedure TConfForm.Button5Click(Sender: TObject);
var
Node, NextNode: TTreeNode;
begin
  Node := TreeView1.Selected;
  if Node <> nil then
  begin;
   if Node.Level = 0 then
   begin
//     Node.MoveTo(TreeView2.Items.,naInsert);
   NextNode := Node.getNextSibling;
   if NextNode <> nil then
   begin
     NextNode.MoveTo(Node,naInsert);
     NextNode.Expand(true);
   end;
     TreeView1.SetFocus();
   end
  end

end;

//******���� 2012  - ��������� ��������� �.�.
procedure TConfForm.CheckBox1Click;
var
     i,l:integer;
     control:TControl;
begin
   if(CheckBox1.checked = true) then CheckBox2.Checked:= false;

     l:=GroupBox1.ControlCount;
     for i := 1 to l do
     begin
          control:=GroupBox1.Controls[i-1];
if CheckBox1.checked then (control as TCheckBox).checked:=True else
(control as TCheckBox).checked:=False;


     end;
     if(CheckBox1.checked = false) then exit;
end;
//******���� 2012

procedure TConfForm.CheckBox2Click(Sender: TObject);
var
     i,l:integer;
     control:TControl;
begin
   if(CheckBox2.checked = true) then CheckBox1.Checked:= false;

   l:=GroupBox1.ControlCount;
for i := 1 to l do
     begin
     if(i=1)or(i=19)or(i=21)or(i=22)or(i=23)or(i=26)or(i=31)or(i=32) then
          begin
          control:=GroupBox1.Controls[i-1];
          if CheckBox2.checked then (control as TCheckBox).checked:=True else
          (control as TCheckBox).checked:=False;
          end;
     end;
      if(CheckBox2.checked = false)  then exit;
end;
procedure TConfForm.zonesLineColorClick(Sender: TObject);
begin
        if ColorDialog1.Execute then
        begin
        zonesLineColor.Color :=ColorDialog1.Color;
        end;
end;


procedure TConfForm.ZonesFontColorClick(Sender: TObject);
begin
              if ColorDialog1.Execute then
        begin
        ZonesFontColor.Color :=ColorDialog1.Color;
        end;
end;





end.
