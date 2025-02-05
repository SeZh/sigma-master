{*********************************************************************}
{                                                                     }
{                    ���������� ����������� ��������                  }
{                                                                     }
{                               ������� 609                           }
{                                                                     }
{                    ������� ����� ����������� 2001                   }
{                                                                     }
{                     ������� ����� ���������� 2003                   }
{                                                                     }
{*********************************************************************}
//test
Unit MainForm;

Interface

Uses
     Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     Menus, ExtCtrls, ComCtrls, ToolWin, ImgList, inifiles, Registry,
  Buttons, StrUtils, IdGlobal, TSigmaForm,
  { dll version ... kotov ->}
  project_config,project_order,ProjectRunUnit, StdCtrls,
  {<-  dll version ... kotov}
  //"������� ���������� �  Excel"
  // ��� ������ ��������� ����������������� MS Excel, ������������ ������
                                            // Excel_TLB, ActiveX, ComObj;
   Variants, SplitUnit,Excel_TLB, ActiveX, ComObj;

const
     Untitled='';	//TSH(������ ��� ������ � ��������)
Type
     TToolBarFunc=Procedure (ToolBar:TToolBar) of object;
     TMainForm1 = Class(TForm)
               ControlBar1      : TControlBar;
               MainMenu1        : TMainMenu;
               MenuFile         : TMenuItem;
               view             : TMenuItem;
               Edit             : TMenuItem;
               new              : TMenuItem;
               open             : TMenuItem;
               openlast         : TMenuItem;
               saveas           : TMenuItem;
               sp1              : TMenuItem;
               exit             : TMenuItem;
               Compile          : TMenuItem;
               Service          : TMenuItem;
               Configuration    : TMenuItem;
               StatusBar        : TStatusBar;
               PopupMenu1       : TPopupMenu;
               ActiveImageList  : TImageList;
               FileToolBar      : TToolBar;
               about            : TMenuItem;
               ToolButton1      : TToolButton;
               ToolButton2      : TToolButton;
               ToolButton3      : TToolButton;
               ToolButton5      : TToolButton;
               OpenDialog1      : TOpenDialog;
               SaveDialog1      : TSaveDialog;
               CompileAndRun    : TMenuItem;
               SaveDialog2      : TSaveDialog;
               N1               : TMenuItem;
               execmenu         : TMenuItem;
               ProjectConf      : TMenuItem;
               HelpMenu         : TMenuItem;
               N2               : TMenuItem;
               RealHelp         : TMenuItem;
               PluginsInfo      : TMenuItem;
               N4               : TMenuItem;
    Sigma321: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Run: TMenuItem;
    N3: TMenuItem;
    CompileTreeView :TTreeview;
    grid: TMenuItem;
    research: TMenuItem;
    N7: TMenuItem;
    modDelone: TMenuItem;
    metMK: TMenuItem;
    Denisity: TMenuItem;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton12: TToolButton;
    ToolButton6: TToolButton;
    ToolBar3: TToolBar;
    ToolBar4: TToolBar;
    Grafics: TToolButton;
    Statistic: TToolButton;
    ToolBar5: TToolBar;
    ButtonFrontalMethod: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    Label1: TLabel;
    NRC: TComboBox;
    btn1: TToolButton;
    btn2: TToolButton;
    ToolButton11: TToolButton;
    Excel1: TMenuItem;
               Procedure DeleteAllRunFiles;
               Procedure FormCreate(Sender: TObject);
               Procedure NewClick(Sender: TObject);
               Procedure OpenClick(Sender: TObject);
               Procedure OpenLastClick(Sender: TObject);
					Procedure SaveClick(Sender: TObject);//
               Procedure SaveAsClick(Sender: TObject);
               Procedure FormDestroy(Sender: TObject);
               Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
               Procedure ProjectConfClick(Sender: TObject);
               Procedure exitClick(Sender: TObject);

               Procedure CompileClick(Sender: TObject);
               Procedure CompileAndRunClick(Sender: TObject);
               function  RunClick(Sender: TObject):Integer;
               procedure PopupMenuShow(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
               procedure PopupMenuClick(Sender: TObject);
               procedure AutoSizeToolBar(Sender: TObject);
               procedure PluginsInfoClick(Sender: TObject);
               procedure aboutClick(Sender: TObject);
               procedure RealHelpClick(Sender: TObject);
               procedure ConfigurationClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Sigma321Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure GraficsClick(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    function CutFileName(dir: String): String;
    procedure N3Click(Sender: TObject);

    procedure GetModulesCompile(TreeView1 : TTreeView); {dll version ... kotov}
    function FindModule(name : String):String; {dll version ... kotov}
    function CheckAfterCompile():boolean;    {dll version ... kotov}
    function CheckAfterRun():boolean;
    procedure StatisticClick(Sender: TObject);
    procedure ShowDensityClick(Sender: TObject);
    procedure ButtonFrontalMethodClick(Sender: TObject);
    procedure NRCChange(Sender: TObject);
    procedure modDeloneClick(Sender: TObject);
    procedure metMKClick(Sender: TObject);
    procedure DenisityClick(Sender: TObject);
    procedure Excel1Click(Sender: TObject);






{dll version ... kotov}
          private
               { Private declarations }
          public
               { Public declarations }
               Registry        : TRegistry;
               RunAfterCompile : boolean;
               function CloseProject:boolean;
               procedure EmptyMenu;
               procedure PluginMenuClick(Sender: TObject);
               procedure PluginButtonClick(Sender: TObject);
     End;

     TMyMenuItem = class(TMenuItem)
     public
          MyonClick  : procedure;stdcall;
     end;
     TMyToolButton = class(TToolButton)
     public
          MyonClick  : procedure;stdcall;
     end;
     PT=record
          PluginType:Integer;
          Module:HModule;
     end;
var
     PluginsTypes    : array of PT;
     MainForm1       : TMainForm1;
     LinkedPlugins   : TList;
     ProcessInfo     : TProcessInformation;
     ProjectFileName : String;
     maxScreen       : TRect;
     LeaveResize     : boolean;
     SigmaLocation   : String;
     SigmaIni : TIniFile;
     OutDir : String;





Procedure CheckState;stdcall;
function GetPlugin(PluginType:integer):HModule;stdcall;
procedure LoadToolBar(Caption:string; ToolBar:TToolBar);
function GetProject_FileName:PChar;stdcall;

 {*****>}    //Bokov
  procedure CompileNow; stdcall;  // �������������� �� ���
  procedure RunNow; stdcall;      // ��������� �� ���
 {<*****}
{*****>}
exports CompileNow, RunNow;
{<*****}


function GetDOSFileName(FileName:string):string; {dll version ... kotov}
exports GetProject_FileName;
Implementation
Uses FileCtrl, TProject, Constants, WaitForm,
     UPluginList, AddFile, Mak_File, Splash,
     About, Sets, Unit3, Main;
var
     StartupInfo     : TStartupInfo;
     Errors          : boolean;
function GetProject_FileName:PChar;stdcall;
begin
     Result:=PChar(ProjectFileName);
end;
procedure LoadToolBar(Caption:string; ToolBar:TToolBar);
begin
     if MainForm1.Registry.OpenKey(StringReg+'\toolbars\'+Caption,true) then
     begin
          if (MainForm1.Registry.ValueExists('DockSite')) then
               ToolBar.DockSite := MainForm1.Registry.ReadBool('DockSite');
          if (MainForm1.Registry.ValueExists('X')) then
               ToolBar.Left     := MainForm1.Registry.ReadInteger('X');
          if (MainForm1.Registry.ValueExists('Y')) then
               ToolBar.Top      := MainForm1.Registry.ReadInteger('Y');
          if (MainForm1.Registry.ValueExists('Visible')) then
               ToolBar.Visible  := MainForm1.Registry.ReadBool('Visible');
     end;
     MainForm1.StatusBar.Panels.Items[0].width := MainForm1.Width div 2;
end;

{*****>}    //Bokov
Procedure CompileNow; stdcall;
 begin MainForm1.CompileClick(nil); end;
Procedure RunNow; stdcall;
 begin MainForm1.RunClick(nil); end;
{<*****}


{$R *.DFM}
Procedure CheckState;stdcall;
Var
     i,count : word;
     Module :^HModule;
     func:procedure;stdcall;
     MP:TMainParams;
begin

     with MainForm1 do
      begin
        //��������� NRC
        with TZonesClass.Create do
           begin
           Load(Project_GetFormFile);
           NRC.Text := inttostr(MainParamsClass.MainParams.NRC);
           Save(Project_GetFormFile);
           Free;
         end;
        //
          if ProjectFileName='' then
          begin
            //����� ����  //����������� ������ ���� � ������
              MenuFile.Visible:=False;
              N3.Visible:=False;
              Edit.Visible:=False;
              grid.Visible:=False;
              execmenu.Visible:=False;
              Service.Visible:=False;
              view.Visible:=False;
              research.Visible:=False;
              HelpMenu.Visible:=False;

              Compile.Enabled:=False;
              Run.Enabled:=False;
              CompileAndRun.Enabled:=False;
              N5.Enabled:=False;
              Grafics.Enabled:=False;
              ButtonFrontalMethod.Enabled:=False;

                modDelone.Enabled:=false;
                metMK.Enabled:=false;
                Denisity.Enabled:=False;
                Configuration.Enabled:=False;
                ProjectConf.Enabled:=False;
                PluginsInfo.Enabled:=False;
                Statistic.Enabled:=False;
                ToolButton7.Enabled:=False;
           if (Registry.OpenKey(StringReg,true)) and (Registry.ReadString(InputFileNameReg)='') then ToolButton3.Enabled:=False
           else ToolButton3.Enabled:=True;

               ProjectConf.Enabled :=false;   {dll version ... kotov}

          end else
          begin
            // ����������� ������� ����
                modDelone.Enabled:=True;
                metMK.Enabled:=True;
                Denisity.Enabled:=True;
                CompileAndRun.Enabled:=true;
                Configuration.Enabled:=True;
                ProjectConf.Enabled:=True;
                 PluginsInfo.Enabled:=True;
                 ButtonFrontalMethod.Enabled:=True;
                 ToolButton7.Enabled:=True;

               ProjectConf.Enabled :=true;   {dll version ... kotov}
               if (Registry.OpenKey(StringReg, true)) and (Registry.ReadBool('CalcModule')) = true then
               begin
                       If not Errors and CheckAfterCompile Then

                       begin
                                Run.Enabled:=true;
                                if CheckAfterRun then begin
                                 N5.Enabled:=True;
                                 Grafics.Enabled:=True;
                                 Statistic.Enabled:=True;
                                end
                                else begin
                                 N5.Enabled:=false;
                                 Grafics.Enabled:=false;
                                 Statistic.Enabled:= false;
                                end;

                                ToolButton12.Enabled:=true;

                       end else
                       begin
                                Run.Enabled:=false;
                                ToolButton12.Enabled:=false;

                                N5.Enabled:=False;
                                Grafics.Enabled:=False;
                                Statistic.Enabled:= false;

                       end;
               end
               else begin
                       //MessageDlg(ChangeFileExt(ProjectFileName,'.exe'), mtError,[mbYes],0);
                       If FileExists(ChangeFileExt(ProjectFileName,'.exe')) Then
                       begin
                            Run.Enabled:=true;
                            N5.Enabled:=True;
                            Grafics.Enabled:=True;
                            Statistic.Enabled:= True;
                            ToolButton12.Enabled:=true;
                           
                       end else
                       begin
                            Run.Enabled:=false;
                            ToolButton12.Enabled:=false;
                            N5.Enabled:=False;
                            Grafics.Enabled:=False;
                            Statistic.Enabled:= False;

                       end;
               end;
               Compile.Enabled:=true;
               CompileAndRun.Enabled:=true;
          end;
           //TSH(������ ��� ������ � ��������) -->
	   StatusBar.Panels[0].Text:='������: '+Project_Name;
           StatusBar.Panels[1].Text:='�����: '+Project_GetFormFile;
	   //TSH(������ ��� ������ � ��������) <--
     end;
     count:=LinkedPlugins.Count;
     if Count>0 then
     begin
          for i:=0 to count-1 do
          begin
               Module:=LinkedPlugins.Items[i];
               func:=GetProcAddress(Module^,'CheckState');
               if Assigned(func) then func;
          end;
     end;
End;
//��������� ��������� �� �������� ���������� �� �������� ���
function GetPlugin(PluginType:integer):HModule;stdcall;
var
     res:HModule;
     count,i:integer;
begin
     res:=0;
     count:=Length(PluginsTypes);
     if count>0 then
     begin
          for i:=0 to count-1 do
          begin
               if PluginsTypes[i].PluginType=PluginType then res:=PluginsTypes[i].Module;
          end;
     end;
     Result:=res;
end;
Procedure WinExec(FileName,WorkDir : String; Visibility : word);
Var
     zAppName : array [0..512] Of char;
     zCurDir  : array [0..255] Of char;
begin
     StrPCopy (zAppName,FileName);
     StrPCopy(zCurDir,WorkDir);
     FillChar(StartupInfo,Sizeof(StartupInfo),#0);
     StartupInfo.cb         :=Sizeof(StartupInfo);

     StartupInfo.dwFlags    :=STARTF_USESHOWWINDOW;
     StartupInfo.wShowWindow:=Visibility;
     CreateProcess(nil, zAppName, nil, nil, false, CREATE_NEW_CONSOLE Or NORMAL_PRIORITY_CLASS, nil, zCurDir, StartupInfo, ProcessInfo);
End;

/////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Procedure TMainForm1.FormCreate(Sender: TObject);
Var
     i : word;
     s : String;
     {**}
     CfFile: TIniFile;
begin
     // Caption:=Caption + ' ' + GetProjectName;
     Errors:=false;
     //�������� ������ ��� ������ � ��������� ��������
     Registry        :=TRegistry.Create;
     Registry.RootKey:=HKEY_CURRENT_USER;
     //����������� ����� ������������ �����
     SigmaLocation   :=LowerCase(ExtractFilePath(ParamStr(0)));
     i:=pos('\bin',SigmaLocation);
     if i>0 then SetLength(SigmaLocation,i);
 if Registry.OpenKey(StringReg, true) then
     begin
       {dll version ... kotov ->}
       if Registry.ReadBool('CalcModule') = true then begin
          s:=Registry.ReadString(SigmaSourceDll);
          if (s='') or (not DirectoryExists(s)) then
          begin
               s:=SigmaLocation+'Source\dll\';
               //������� ������� � ����� ������������
               //������������� ���������� � �������
               Registry.WriteString(SigmaSourceDll,s);
          End;
          if s[Length(s)]<>'\' then s:=s+'\';
       end
       else begin
          s:=Registry.ReadString(SigmaSource);
          if (s='') or (not DirectoryExists(s)) then
          begin
//               s:=SigmaLocation+'Source\';
               s:=SigmaLocation+'Source\Source__sort\';   //Imametdinov
               //������� ������� � ����� ������������
               //������������� ���������� � �������
               Registry.WriteString(SigmaSource,s);
          End;
          if s[Length(s)]<>'\' then s:=s+'\';
       end
       {<- dll version ... kotov}
     End
     Else begin
          Registry.CreateKey(StringReg);
     End;

     //�������� ������ ��� ����������� �������
     Project_SetSource(PChar(s));
     SetIniFile(SigmaLocation+'bin\sigma32.ini');
     SigmaIni:=TIniFile.Create(SigmaLocation+'bin\sigma32.ini');
     if ParamCount>0 then
     begin
          if LowerCase(ExtractFileExt(ParamStr(1)))='.spr' then
          begin
               Project_Open(PChar(ParamStr(1)));
               StatusBar.Panels[0].Text:='������: '+ParamStr(1);
               {**************}
               StatusBar.Panels[1].Text:='�����: '+Project_GetFormFile;
               Registry.WriteString(InputFileNameReg,ParamStr(1));
               ProjectFileName:=ParamStr(1);
          End else
          begin
               StatusBar.Panels[0].Text:='������: '+Untitled;
               {**************}
               StatusBar.Panels[1].Text:='�����: '+Untitled;
               ProjectFileName:='';
          end;
     End else
     begin
          StatusBar.Panels[0].Text:='������: '+Untitled;
          StatusBar.Panels[1].Text:='�����: '+Untitled;
     end;
     CheckState;
     ToolButton3.Enabled:=False;
    



{*******************}
//������ � sforms.ini (���������� � Windows (winnt ��� �������� �����))
//������ �������� ����
//��� ������� � ��� �����
     CfFile:=TIniFile.Create(SigmaLocation+'bin\sforms.ini');
//     CfFile:=TIniFile.Create('sforms.ini');
     try
        CfFile.WriteInteger('�������','������',MainForm1.Height+StatusBar.Height);
        CfFile.WriteString('�����','������',Untitled);
        CfFile.WriteString('�����','�����',Untitled);
        CfFile.Free;
     except
        MessageDlg('������ ������ � ���� sforms.ini!', mtError,[mbYes],0);
     end;

End;

Procedure TMainForm1.NewClick(Sender: TObject);
Var
     Form_Clear:procedure;stdcall;
     CfFile: TIniFile;
begin
         Form_Clear:=GetProcAddress(GetPlugin(1),'Form_Clear');
          if Assigned(Form_Clear) then Form_Clear;
            SaveDialog1.FileName:=ProjectFileName;
                if SaveDialog1.Execute then
                begin
                  ProjectFileName:=SaveDialog1.FileName;
		  //TSH(������ ��� ������ � ��������) -->
		  Project_New;
		  //TSH(������ ��� ������ � ��������) <--
				  SaveClick(nil);
                  StatusBar.Panels[0].Text:='������: '+SaveDialog1.FileName;
                  {******************}
                  Project_SetFormFile('\'+Untitled);
                  StatusBar.Panels[1].Text:='�����: '+Project_GetFormFile;
                 CfFile:=TIniFile.Create(SigmaLocation+'bin\sforms.ini');
            //      CfFile:=TIniFile.Create('sforms.ini');
                  try
                     CfFile.WriteString('�����','������',SaveDialog1.FileName);
                     CfFile.WriteString('�����','�����',Project_GetFormFile);
                     CfFile.Free;
                  except
                     MessageDlg('������ ������ � ���� sforms.ini!', mtError,[mbYes],0);
                  end;
                End;
end;

Procedure TMainForm1.OpenClick(Sender: TObject);
var CfFile: TIniFile;
begin
          OpenDialog1.Title:='������� ������';
          if OpenDialog1.Execute then
          begin
            Project_Open(PChar(OpenDialog1.FileName));
	    //TSH(������ ��� ������ � ��������) -->
            //ProjectFileName:=OpenDialog1.FileName;
            ProjectFileName:=Project_Name;
            //StatusBar.Panels[0].Text:='������: '+OpenDialog1.FileName;
	    StatusBar.Panels[0].Text:='������: '+Project_Name;
            if  StrComp(Project_GetFormFile,PChar('')) <> 0 then StatusBar.Panels[1].Text:='�����: '+Project_GetFormFile
            else StatusBar.Panels[1].Text:='�����: ';
	    //TSH(������ ��� ������ � ��������) <--

            if (Registry.OpenKey(StringReg,true)) then Registry.WriteString(InputFileNameReg,OpenDialog1.FileName);

            ToolButton3.Enabled:=False;
//     CfFile:=TIniFile.Create('sforms.ini');
     CfFile:=TIniFile.Create(SigmaLocation+'bin\sforms.ini');
     CheckState;
     try
        CfFile.WriteString('�����','������',OpenDialog1.FileName);
        CfFile.WriteString('�����','�����',Project_GetFormFile);
        CfFile.Free;
     except
        MessageDlg('������ ������ � ���� sforms.ini!', mtError,[mbYes],0);
     end;
          End;

End;

Procedure TMainForm1.OpenLastClick(Sender: TObject);
begin
          if (Registry.OpenKey(StringReg,true)) then
          begin
               if (Registry.ReadString(InputFileNameReg)<>'') then
               begin
	            //TSH(������ ��� ������ � ��������) -->
                    //ProjectFileName:=Registry.ReadString(InputFileNameReg);
                    Project_Open(PChar(Registry.ReadString(InputFileNameReg)));
                    ProjectFileName:=Project_Name;
                    StatusBar.Panels[0].Text:='������: '+ProjectFileName;
		    //TSH(������ ��� ������ � ��������) <--
                    StatusBar.Panels[1].Text:='�����: '+Project_GetFormFile;
                    CheckState;
                    ToolButton3.Enabled:=False;
               End
               else ShowMessage('���� ������� �� ������!');
          end
          else ShowMessage('���� ������� �� ������!');

End;

Procedure TMainForm1.SaveClick(Sender: TObject);
begin
     if (Length(ProjectFileName)=0) or (LowerCase(ExtractFileExt(ProjectFileName))<>'.spr') then SaveAsClick(nil)
     Else
          Project_Save(PChar(ProjectFileName));
     CheckState;
     ToolButton3.Enabled:=False;
End;

Procedure TMainForm1.SaveAsClick(Sender: TObject);
var  FileName, pac: String;
    count, i: Integer;
begin
     SaveDialog1.FileName:=ProjectFileName;
     if SaveDialog1.Execute then
     begin
          ProjectFileName:=SaveDialog1.FileName;
          count:=Project_Fortran_Count;
          If Count>0 Then
          Begin
               For i:=1 To Count Do
               Begin
                    FileName:=Project_Fortran_Get(i);
                    pac:=String(Project_PackFileName(PChar(FileName)));
               End;
          End;
		 SaveClick(nil);
          
          StatusBar.Panels[0].Text:='������: '+SaveDialog1.FileName;
          if  Project_GetFormFile<>'' then StatusBar.Panels[1].Text:='�����: '+Project_GetFormFile
          else StatusBar.Panels[1].Text:='�����: '+Untitled;
     End;
     CheckState;
     ToolButton3.Enabled:=False;
End;

Procedure TMainForm1.FormDestroy(Sender: TObject);
var
     i,count  : integer;
     ToolBar  : TControl;
begin
     count:=ControlBar1.ControlCount;
     if count>0 then
     begin
          for i:=count-1 downto 0 do
          begin
               ToolBar:=ControlBar1.Controls[i];
               if ToolBar is TToolBar then
               with (ToolBar as TToolBar) do
               begin
                    if Registry.OpenKey(StringReg+'\toolbars\'+Caption,true) then
                    begin
                         Registry.WriteInteger('X',Left);
                         Registry.WriteInteger('Y',Top);
                         Registry.WriteBool('Visible',Visible);
                         Registry.WriteBool('DockSite',DockSite);
                    end;
               end;
          end;
     end;
     Registry.CloseKey;
     Registry.Free;
End;

Procedure TMainForm1.ProjectConfClick(Sender: TObject);
begin
    if Registry.OpenKey(StringReg, true) then
     begin
     if Registry.ReadBool('CalcModule') = true then
     begin
        project_configForm.Show;
     end
     else
     begin
          AddFileForm.Show;
     end;
     end;

End;

Procedure TMainForm1.exitClick(Sender: TObject);
begin
     Close;
End;
function  TMainForm1.CloseProject:boolean;
Var
     Cancel  : boolean;
     Dialog  : word;
     i,Count : integer;
     Module  : ^HModule;
     func    : function :boolean;stdcall;
begin
     Cancel:=false;
     count:=LinkedPlugins.Count;
     if Count>0 then
     begin
          for i:=0 to count-1 do
          begin
               if not Cancel then
               begin
                    Module:=LinkedPlugins.Items[i];
                    func:=GetProcAddress(Module^,'Can_Close');
                    if Assigned(func) then Cancel:=not func;
               end;
          end;
     end;
     if (Project_IsModified) and (Not Cancel) then
     begin
          Dialog:=MessageDlg('��������� ������?', mtConfirmation,mbYesNoCancel, 0);
          if Dialog=mrYes then
          begin
               if ProjectFileName='' then
               begin
                    SaveAsClick(nil);
                    if ProjectFileName='' then Cancel:=true;
               End
               Else
                    Project_Save(PChar(ProjectFileName));
          End;
          if Dialog=mrCancel then Cancel:=true;
     End;
     Result:=Not Cancel;
End;
          //CopyFileTo(OutDir+ChangeFileExt(MainForm1.CutFileName(ProjectFileName),'.exe'),ChangeFileExt(ProjectFileName,'.exe'));
Procedure AfterCompile;
Var
     Module    : Hmodule;
     ShowError : procedure(FileName:PChar);stdcall;
     eee       : String;
     f         : TextFile;
     Registry:TRegistry;  {dll version ... kotov}
     i:integer;        {dll version ... kotov}
begin
     eee:=SigmaLocation+'Msdev\Lib\~errtmp';
{dll version ... kotov ->}
     Registry        :=TRegistry.Create;
     Registry.RootKey:=HKEY_CURRENT_USER;
     if (Registry.OpenKey(StringReg, true)) and (Registry.ReadBool('CalcModule')) = true then
     begin
        Module:=GetPlugin(2);
        ShowError:=GetProcAddress(Module,'ShowError');
        Errors:=False;
        for i:= 1 to Project_Fortran_Count do begin
         if not FileExists(OutDir+StrLower(PChar(ChangeFileExt(ExtractFileName(Project_Fortran_Get(i)),'.dll')))) then begin
          //showmessage('������ ������ �� ��������������.'+OutDir+StrLower(PChar(ChangeFileExt(ExtractFileName(Project_Fortran_Get(i)),'.dll'))));
          Errors:=True;
         end;
        end;
        If Errors Then
          Begin
               if Assigned(ShowError) then
               begin
                    if FileExists(eee) then ShowError(PChar(eee));
               end else showmessage('������! ');
          End
          Else Begin
               if Assigned(ShowError) then ShowError(PChar(''));
              // If MainForm1.RunAfterCompile Then MainForm1.RunClick(Nil);
               ProjectOrderForm.LoadTree;
          End;
          CheckState;
     end
     else begin
{<- dll version ... kotov}
      If ProjectFileName<>'' Then
      Begin
          Errors:=False;
          CopyFileTo(OutDir+ChangeFileExt(MainForm1.CutFileName(ProjectFileName),'.exe'),ChangeFileExt(ProjectFileName,'.exe'));
          if FileExists(ChangeFileExt(ProjectFileName,'.exe')) then Errors:=False
          else Errors:=True;
          Module:=GetPlugin(2);
          ShowError:=GetProcAddress(Module,'ShowError');
          If Errors Then
          Begin
               if Assigned(ShowError) then
               begin
                    if FileExists(eee) then ShowError(PChar(eee));
               end else showmessage('������! ');
          End
          Else Begin
               if Assigned(ShowError) then ShowError(PChar(''));
               If MainForm1.RunAfterCompile Then MainForm1.RunClick(Nil);
          End;
          CheckState;
      end;
     end;

End;

{
������ ������������ ��������
��� ������� ������� - ������ ���� � �������
}
Procedure DisableRun;
begin
  MainForm1.ToolButton12.Enabled := false;
  MainForm1.Run.Enabled := false;
End;
{
������ ���������� ��������
��� ������� ������� - ������ ���� � �������
}
Procedure EnableRun;
begin
  MainForm1.ToolButton12.Enabled := true;
  MainForm1.Run.Enabled := true;
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

// ������� ������� ����������
Procedure TMainForm1.CompileClick(Sender: TObject);
Var
     ExecuteFile:String;
     Registry:TRegistry;
     ODir:String;
{dll version ... kotov ->}
     EDir,FDir:String;
     Node,Parent,Next: TTreeNode;
     Handle : TextFile;
     i:integer;
     res:string;
     deleteSecondExeFilePath:string;
     deleteExeFilePath:string;
     deleteNextExeFilePath:string;
{<-  dll version ... kotov}
begin
// ���� ������� ���������� ������ ������ �� ������
     DisableRun;
     DeleteAllRunFiles;
     Registry        :=TRegistry.Create;
     Registry.RootKey:=HKEY_CURRENT_USER;
     if Registry.OpenKey(StringReg, true) then
     begin
          if Registry.ValueExists('OutDir') then
          ODir:=Registry.ReadString('OutDir');
     end;
   {dll version ... kotov ->}
   OutDir:=GetDOSFileName(ExtractFilePath(ProjectFileName))+ODir+'\';
   if Registry.ReadBool('CalcModule') = true then
   begin

        EDir := GetDOSFileName(SigmaLocation)+'Msdev\Lib\';
        WaitForm1.AfterRun:=AfterCompile;
        WaitForm1.StartShow('���������� �������');

        GetModulesCompile(CompileTreeView);

        Node := CompileTreeView.items.GetFirstNode;
        DeleteFile(SigmaLocation+'Msdev\Lib\~errtmp');

        AssignFile(Handle,SigmaLocation+'compile_dll.bat');
        rewrite(Handle);

        writeln(Handle,'set BIN='+GetDOSFileName(SigmaLocation)+'Msdev\Bin\');
        writeln(Handle,'set LIB='+GetDOSFileName(SigmaLocation)+'Msdev\Lib\');
        writeln(Handle,'set PATH='+GetDOSFileName(SigmaLocation)+'Msdev\Bin\');
        writeln(Handle,'if not exist "'+OutDir+'" mkdir '+OutDir);
        writeln(Handle,'if exist "'+OutDir+'" del /Q '+OutDir);
        writeln(Handle,'del /Q '+GetDOSFileName(SigmaLocation)+'Msdev\Lib\~errtmp');

        for i:=0 to CompileTreeView.items.Count do
        begin
        if Node <> nil then
         begin
           FDir := GetDOSFileName(ExtractFilePath(FindModule(Node.Text)));
           writeln(Handle,'fl32 /c /Fo'+OutDir+ChangeFileExt(Node.Text,'.obj')+' '+FDir+ChangeFileExt(Node.Text,'.f90')+' >> '+EDir+'~errtmp');
           if Node.HasChildren then
           begin;
                   res :='';
                   Parent := Node;
                   while (Node.GetNext <> nil) and (Node.GetNext.Level <> 0)  do
                   begin;
                        Node := Node.GetNext;
                        res := res +' '+OutDir+ ChangeFileExt(Node.Text,'.lib');
                   end;

           writeln(Handle,'link /dll /out:'+OutDir+ChangeFileExt(Parent.Text,'.dll')+' '+OutDir+ChangeFileExt(Parent.Text,'.obj')+' '+res+' >> '+EDir+'~errtmp');
           end
           else
           begin;
           writeln(Handle,'link /dll /out:'+OutDir+ChangeFileExt(Node.Text,'.dll')+' '+OutDir+ChangeFileExt(Node.Text,'.obj')+' >> '+EDir+'~errtmp');

           end;

          Node := Node.getNext;
         end
        end;
        writeln(Handle,'del '+OutDir+'*.exp');
        writeln(Handle,'del '+OutDir+'*.obj');
        writeln(Handle,'del '+OutDir+'*.lib');
        writeln(Handle,'set PATH='+GetDOSFileName(ExtractFilePath(ProjectFileName))+';'+OutDir);
        //writeln(Handle,'copy '+OutDir+'*.dll '+GetDOSFileName(ExtractFilePath(ProjectFileName))+'*.dll');
        writeln(Handle,'del '+GetDOSFileName(SigmaLocation)+'compile_dll.bat');
        closeFile(Handle);

        WinExec(GetDOSFileName(SigmaLocation)+'compile_dll.bat',ExtractFilePath(ProjectFileName),ExecuteType);
        WaitForm1.FileName:=GetDOSFileName(SigmaLocation)+'compile_dll.bat';
        WaitForm1.FileExecuted:=true;
        Repeat
            Application.ProcessMessages;
        Until WaitForm1.FileExecuted=false;
   end
   else
   begin
     if Not WaitForm1.Visible then
     begin
          if ProjectFileName<>'' then
          begin
               MainDirectory:=ExtractFilePath(ParamStr(0));
               ExecuteFile:=SigmaLocation+'Compile.bat';
               RunAfterCompile:=false;
               OutDir:=ExtractFilePath(ProjectFileName)+ODir+'\';
               CreateDir(OutDir);
               SetLength(OutDir,Length(OutDir)-1);
               // ��������� exe ���� ������� ����� � obj
               deleteExeFilePath := OutDir+'\'+ChangeFileExt(MainForm1.CutFileName(ProjectFileName),'.exe');
               // ��������� exe ���� ������� ����� � ����� �����, ������ 2 ���� �� ����
               deleteSecondExeFilePath := ChangeFileExt(ProjectFileName,'.exe');
               DeleteFile(deleteExeFilePath);
               DeleteFile(deleteSecondExeFilePath);
               DeleteFile(SigmaLocation+'Msdev\Lib\~errtmp');
               Create_Mak_File(ChangeFileExt(ProjectFileName,'.mak'),OutDir);
               Create_Compile_Bat(ExecuteFile,OutDir);
               WinExec(ExecuteFile,SigmaLocation+'Msdev\Lib',ExecuteType);
               WaitForm1.FileName:=ExecuteFile;
               WaitForm1.FileExecuted:=true;
               WaitForm1.AfterRun:=AfterCompile;
               WaitForm1.StartShow('���������� �������');
               Repeat
                     Application.ProcessMessages;
               Until WaitForm1.FileExecuted=false;
               deleteNextExeFilePath := OutDir+'\'+ChangeFileExt(MainForm1.CutFileName(ProjectFileName),'.exe');
               DeleteFile(deleteNextExeFilePath);
          End;
     End;
   end;
   EnableRun;
   {<- dll version ... kotov}
End;

Procedure TMainForm1.FormClose(Sender: TObject; Var Action: TCloseAction);
begin
     if Not CloseProject then Action:=caNone
     Else Action:=caFree;
End;

Procedure TMainForm1.CompileAndRunClick(Sender: TObject);
begin
     CompileClick(nil);
     RunAfterCompile:=true;
     RunClick(Sender);
     CheckState; //TSH(������ ��� ������ � ��������)
     ToolButton3.Enabled:=False;

End;

Procedure AfterSolve;
begin
     if ProjectFileName<>'' then CheckState;
End;

Procedure TMainForm1.DeleteAllRunFiles;
var
ProjectDir: String;
begin
  ProjectDir:= GetDOSFileName(ExtractFilePath(ProjectFileName));
  DeleteFile(ProjectDir+'result1.bin');
  DeleteFile(ProjectDir+'result2.bin');
  DeleteFile(ProjectDir+ChangeFileExt(ExtractFileName(ProjectFileName),'.res'));
  // ������ ���������� ���������� �������
  DeleteFile(ProjectDir+'\'+'data');
  DeleteFile(ProjectDir+'\'+'form_xy');
  DeleteFile(ProjectDir+'\'+'FORT.3');
  DeleteFile(ProjectDir+'\'+'RESULT1.BIN');
  DeleteFile(ProjectDir+'\'+'RESULT2.BIN');
  DeleteFile(ProjectDir+'\'+'Printit.npf');
  DeleteFile(ProjectDir+'\'+'result.res');
end;

function  TMainForm1.RunClick(Sender: TObject):Integer;
Var
     OutDir,Odir,ProjectDir : String;
     Module:HModule;
     Form_Load: procedure (FileName:PChar);stdcall;
     Registry:TRegistry;  {dll version ... kotov }
     Handle : TextFile;    {dll version ... kotov}
begin

     if Not WaitForm1.Visible then
     begin
          if (ProjectFileName<>'') and (Errors = false) then
          begin
               {dll version ... kotov ->}
               OutDir:=GetDOSFileName(ExtractFilePath(ProjectFileName));
               Registry        :=TRegistry.Create;
               Registry.RootKey:=HKEY_CURRENT_USER;
               ProjectDir:= GetDOSFileName(ExtractFilePath(ProjectFileName));

               if (Registry.OpenKey(StringReg, true)) and (Registry.ReadBool('CalcModule')) = true then begin
                     ProjectRun:=TProjectRun.Create(self);
                     ProjectRun.Show;
                     ProjectRun.Run;
                     //if ProjectRun.status = 1 then begin
                     WaitForm1.AfterRun:=AfterSolve;
                     WaitForm1.StartShow('������ �������');

                     ODir:=Registry.ReadString('OutDir');


                     if ProjectRun.status = 0 then begin
                       DeleteFile(ProjectDir+ODir+'\'+'data ');
                       DeleteFile(ProjectDir+ODir+'\'+'form_xy ');
                       DeleteFile(ProjectDir+ODir+'\'+'FORT.3 ');
                       DeleteFile(ProjectDir+ODir+'\'+'RESULT1.BIN ');
                       DeleteFile(ProjectDir+ODir+'\'+'RESULT2.BIN ');
                       DeleteFile(ProjectDir+ODir+'\'+'Printit.npf ');
                       DeleteFile(ProjectDir+ODir+'\'+'result.res ');
                     end
                     else begin
                       AssignFile(Handle,SigmaLocation+'run_dll.bat');
                       rewrite(Handle);
                       writeln(Handle,'move /Y '+ProjectDir+ODir+'\'+'data '+ProjectDir+'data');
                       writeln(Handle,'move /Y '+ProjectDir+ODir+'\'+'form_xy '+ProjectDir+'form_xy');
                       writeln(Handle,'move /Y '+ProjectDir+ODir+'\'+'FORT.3 '+ProjectDir+'FORT.3');
                       writeln(Handle,'move /Y '+ProjectDir+ODir+'\'+'RESULT1.BIN '+ProjectDir+'RESULT1.BIN');
                       writeln(Handle,'move /Y '+ProjectDir+ODir+'\'+'RESULT2.BIN '+ProjectDir+'RESULT2.BIN');
                       writeln(Handle,'move /Y '+ProjectDir+ODir+'\'+'Printit.npf '+ProjectDir+'Printit.npf');
                       writeln(Handle,'move /Y '+ProjectDir+ODir+'\'+'result.res '+ProjectDir+ChangeFileExt(ExtractFileName(ProjectFileName),'.res'));
                       writeln(Handle,'del '+GetDOSFileName(SigmaLocation)+'run_dll.bat');
                       closeFile(Handle);
                     end;
                     WinExec(GetDOSFileName(SigmaLocation)+'run_dll.bat',GetDOSFileName(SigmaLocation)+'Msdev\Lib',ExecuteType);
                     WaitForm1.FileName:=GetDOSFileName(SigmaLocation)+'run_dll.bat';
                     WaitForm1.FileExecuted:=true;
                   //  Repeat
                  //   Application.ProcessMessages;
                  //   Until WaitForm1.FileExecuted=false;
                //  end;
               end
               {<- dll version ... kotov}
               else begin
               OutDir:=ExtractFilePath(ProjectFileName);
               if FileExists(ChangeFileExt(ProjectFileName,'.exe')) then
               begin
                    WaitForm1.AfterRun:=AfterSolve;
                    WaitForm1.StartShow('������ �������');
                    Module:=GetPlugin(1);
                    Form_Load:=GetProcAddress(Module,'Form_Load');
                    Form_Load(PChar(Project_GetFormFile));
                    Create_Data_Files(OutDir);
                    Create_Run_Bat(SigmaLocation+'Solve.bat',ProjectFileName);
                    WinExec(SigmaLocation+'Solve.bat',OutDir,ExecuteType);
                    WaitForm1.FileName:=SigmaLocation+'Solve.bat';
                    WaitForm1.FileExecuted:=true;
               End
               Else begin
                    showmessage('���� �� ������! :'+ExtractFilePath(ParamStr(0))+'Compile.pif');
               End;
               end;
          End;
     End;

End;

procedure TMainForm1.PopupMenuShow(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
     procedure AddNewItem(ToolBar:TToolBar);
     var
          Menu:TMenuItem;
     begin
          Menu:=TMenuItem.Create(self);
          Menu.Caption:=ToolBar.Caption;
          if ToolBar.Visible then menu.Checked:=true else menu.Checked:=false;
          Menu.Name:=ToolBar.Name+'Menu';
          Menu.OnClick:=PopupMenuClick;
          PopupMenu1.Items.Add(Menu);
     end;
var
     i,count:integer;
     ToolBar:TControl;
begin
     EmptyMenu;
     count:=ControlBar1.ControlCount;
     if count>0 then
     begin
          for i:=count-1 downto 0 do
          begin
               ToolBar:=ControlBar1.Controls[i];
               if ToolBar is TToolBar then
               begin
                    AddNewItem(ToolBar as TToolBar);
               end;
          end;
          MousePos:=ClientToScreen(MousePos);
          PopupMenu1.Popup(MousePos.x,MousePos.y);
     end;
end;
procedure TMainForm1.EmptyMenu;
var
     Menu:TMenuItem;
begin
     while PopupMenu1.Items.Count>0 do
     begin
          menu:=PopupMenu1.Items.Items[0];
          PopupMenu1.Items.Delete(0);
          menu.free;
     end;
end;
procedure TMainForm1.PopupMenuClick(Sender: TObject);
var
     name:string;
     ToolBar:TControl;
begin
     name:=(Sender as TMenuItem).name;
     SetLength(name,Length(name)-4);
     ToolBar:=ControlBar1.FindChildControl(name);
     if ToolBar is TToolBar then
     begin
          (ToolBar as TToolBar).Visible:=not (ToolBar as TToolBar).Visible;
     end;
     EmptyMenu;
end;
procedure TMainForm1.PluginMenuClick(Sender: TObject);
begin
  if (Compile.Enabled=TRUE) then
     if Assigned((Sender as TMyMenuItem).MyonClick) then (Sender as TMyMenuItem).MyonClick;
end;
procedure TMainForm1.AutoSizeToolBar(Sender: TObject);
var
     ToolBar:TControl;
     i,count:integer;
begin
     count:=ControlBar1.ControlCount;
     if count>0 then
     begin
          for i:=0 to count-1 do
          begin
               ToolBar:=ControlBar1.Controls[i];
               if ToolBar is TToolBar then
                    (ToolBar as TToolBar).Width:=(ToolBar as TToolBar).ButtonCount*23;
                   
          end;

          for i:=0 to count-1 do
          begin
               ToolBar:=ControlBar1.Controls[i];
               if ToolBar is TToolBar then
                    LoadToolBar((ToolBar as TToolBar).Caption,(ToolBar as TToolBar));
          end;
     end;
end;

procedure TMainForm1.PluginButtonClick(Sender: TObject);
begin
  if (Compile.Enabled=TRUE) then
     if Assigned((Sender as TMyToolButton).MyonClick) then (Sender as TMyToolButton).MyonClick;
end;

procedure TMainForm1.PluginsInfoClick(Sender: TObject);
begin
     PluginList.ShowModal;
end;

procedure TMainForm1.aboutClick(Sender: TObject);
begin
     FAbout:=TFAbout.Create(self);
     FAbout.ShowModal;
end;

procedure TMainForm1.RealHelpClick(Sender: TObject);
begin
     Application.HelpFile:=SigmaLocation+'help/FAQ.hlp';
     Application.HelpCommand(HELP_CONTENTS, 0);
end;

procedure TMainForm1.ConfigurationClick(Sender: TObject);
begin
     if ConfForm=nil then ConfForm:=TConfForm.Create(self);
     ConfForm.ShowModal;
end;

procedure TMainForm1.ToolButton4Click(Sender: TObject);
Var
     Form_Clear:procedure;stdcall;
     CfFile: TIniFile;
begin
         Form_Clear:=GetProcAddress(GetPlugin(1),'Form_Clear');
          if Assigned(Form_Clear) then Form_Clear;
                  ProjectFileName:=Untitled;
                  StatusBar.Panels[0].Text:='������: '+ProjectFileName;
                  Project_SetFormFile(Untitled);
                  StatusBar.Panels[1].Text:='�����: '+Project_GetFormFile;
//                  CfFile:=TIniFile.Create('sforms.ini');
                  CfFile:=TIniFile.Create(SigmaLocation+'bin\sforms.ini');
                  try
                     CfFile.WriteString('�����','������',ProjectFileName);
                     CfFile.WriteString('�����','�����',Project_GetFormFile);
                     CfFile.Free;
                  except
                     MessageDlg('������ ������ � ���� sforms.ini!', mtError,[mbYes],0);
                  end;
                  Project_Fortran_Clear; //TSH(������ ��� ������ � ��������)

end;

procedure TMainForm1.FormResize(Sender: TObject);
begin
{*****************��������� �������� ������� �����********************}
     Top  :=0;
     Left :=0;
     ClientHeight:=StatusBar.Height+2*ControlBar1.Height;
     ControlBar1.Width:= Screen.Width;
     ToolBar1.Width:=Screen.Width;
     //ClientWidth:=Screen.Width;
end;

procedure TMainForm1.Sigma321Click(Sender: TObject);
begin
//    Application.HelpFile:='../help/sigma32.hlp' ;
  //  Application.HelpCommand(HELP_CONTENTS, 0);
     // WinExec('hh ' + SigmaLocation+'help\h.chm',SigmaLocation+'help',ExecuteType);
      WinExec('hh ' + SigmaLocation+'help\h.chm',SigmaLocation+'help',1);

end;

procedure TMainForm1.N5Click(Sender: TObject);
begin
 Form3.Showmodal;
end;

procedure TMainForm1.GraficsClick(Sender: TObject);
begin
  Form3.Show;
end;

procedure TMainForm1.ToolButton12Click(Sender: TObject);
begin
     SendMessage(FindWindow('TShowMovingsForm', nil), WM_CLOSE, 0, 0);
     RunClick(Sender);
end;

procedure TMainForm1.N6Click(Sender: TObject);
begin
     //TSH(������ ��� ������ � ��������) -->
     CloseProject;
     ToolButton4Click(Sender);
     Project_Clear;
     CheckState;
     //TSH(������ ��� ������ � ��������) <--
end;

procedure TMainForm1.ToolButton6Click(Sender: TObject);
begin
CompileAndRunClick(nil);
end;

procedure TMainForm1.ClearClick(Sender: TObject);
begin
ToolButton6Click(Sender);
end;

{
�� ����� ��� ���������
�������������,
���������,
������ �� ���,
� ������� ����, ������ ����� ���������
}
function TMainForm1.CutFileName(dir: String): String;
var
    l:Integer;
    f:String;
begin
l:=Length(dir);
Repeat
      l:=l-1;
Until dir[l]='\';
Result:=RightStr(ProjectFileName,Length(dir)-l);
end;

procedure TMainForm1.N3Click(Sender: TObject);
begin
   RunClick(Sender);
end;



procedure TMainForm1.GetModulesCompile(TreeView1 : TTreeView);
{kotov}
begin
TreeView1.Items.Clear;
   if FileExists(SigmaLocation+'bin\'+'modules_compile.ini') then  begin
     TreeView1.LoadFromFile(SigmaLocation+'bin\'+'modules_compile.ini');
     TreeView1.FullExpand();
   end
   else
     MessageDlg('���������� ��������� ����������� � ������� ���������� �������. ���� modules_compile.ini �� ����������.', mtError,[mbYes],0)
end;
function GetDOSFileName(FileName:string):string;
{kotov}
var
     buf:array[1..255] of char;
     count:word;
     s:string;
begin
     count:=GetShortPathName(PChar(FileName),@buf, SizeOf(buf));
     s:=Buf;
     SetLength(s,count);
     Result:=s;
end;

function TMainForm1.FindModule(name : String):String;
{kotov}
var
        i:integer;
begin
   result:='';
   if StrComp(PCHar(name),Pchar('')) <> 0 then begin
        for i:=1 to Project_Fortran_Count Do begin
//MessageDlg(ChangefileExt(ExtractFileName(Project_Fortran_Get(i)),'')+' = '+name, mtError,[mbYes],0);
         if StrComp(strlower(PChar(ChangefileExt(ExtractFileName(Project_Fortran_Get(i)),''))),strlower(PChar(name))) = 0 then begin
          result := Project_Fortran_Get(i);
          break;
          end;
        end;
   end;
end;

function TMainForm1.CheckAfterCompile():boolean;
{kotov}
var
        i:integer;
        Registry:TRegistry;
begin
     Registry        :=TRegistry.Create;
     Registry.RootKey:=HKEY_CURRENT_USER;
     if Registry.OpenKey(StringReg, true) then
     begin
          if Registry.ValueExists('OutDir') then
          ODir:=Registry.ReadString('OutDir');
     end;
   result:=true;
   if DirectoryExists(ExtractFilePath(Project_Name)+ODir+'\') then begin
        for i:=1 to Project_Fortran_Count Do begin
         if not FileExists(ExtractFilePath(Project_Name)+ODir+'\'+ChangefileExt(ExtractFileName(Project_Fortran_Get(i)),'.dll')) then begin
          result := false;
          break;
         end;
        end;
   end
   else result := false;
end;

function TMainForm1.CheckAfterRun():boolean;
{kotov}
var
        i:integer;
        Registry:TRegistry;
begin

   if FileExists(ExtractFilePath(Project_Name)+'result1.bin') and
      FileExists(ExtractFilePath(Project_Name)+'result2.bin') then result := true
   else result := false;
end;


{�����������}
{ | }
{\ /}
procedure TMainForm1.StatisticClick(Sender: TObject);
begin
{����� ������ �������������� ��������� - �������� ��������� ����}
  Statistics_methods_Main.nachln_ustanovka_izm_param(1,1,1,1);
  Statistics_methods_Main.Show;
end;
{ / \}
{  | }
{�����������}



{�����������}
{ | }
{\ /}   //���������� ShowDensity.exe
procedure TMainForm1.ShowDensityClick(Sender: TObject);
var
ProjectDir,SigmaLocation : String;
begin
ProjectDir:= GetDOSFileName(ExtractFilePath(ProjectFileName));
SigmaLocation:=  LowerCase(ExtractFilePath(ParamStr(0)));
 WinExec( SigmaLocation +'ShowDensity.exe '+ ProjectDir +'\ExpGrd.poi',ExtractFilePath(ProjectFileName),SW_SHOWMAXIMIZED);
end;
{ / \}    //���������� ShowDensity.exe
{  | }
{�����������}


procedure TMainForm1.ButtonFrontalMethodClick(Sender: TObject);
var
ProjectDir,SigmaLocation : String;
begin
ProjectDir:= GetDOSFileName(ExtractFilePath(ProjectFileName));
SigmaLocation:=  LowerCase(ExtractFilePath(ParamStr(0)));
 WinExec( SigmaLocation +'FrontalMethod.exe',ExtractFilePath(ProjectFileName),SW_SHOWMAXIMIZED);
end;


procedure TMainForm1.NRCChange(Sender: TObject);

  var
	  MP  : TMainParams;
    FFileName:string;
   begin

 with TZonesClass.Create do
    begin

    If strtoint(NRC.text) < 3 then
     begin
      NRC.text := '3';
     end;
     FileToolBar.SetFocus;

      FFileName:=String(Project_GetFormFile);
      Load(FFileName);
      
           MP :=  MainParamsClass.MainParams;
             MP.NRC :=  strtoint(NRC.text);
           MainParamsClass.MainParams:=MP;
      MainForm1.SetFocus;
      Save(FFileName);
      Free;

    end;


end;


procedure TMainForm1.modDeloneClick(Sender: TObject);
var
ProjectDir,SigmaLocation : String;
begin
ProjectDir:= GetDOSFileName(ExtractFilePath(ProjectFileName));
SigmaLocation:=  LowerCase(ExtractFilePath(ParamStr(0)));
 WinExec( SigmaLocation +'FrontalMethod.exe',ExtractFilePath(ProjectFileName),SW_SHOWMAXIMIZED);
end;

procedure TMainForm1.metMKClick(Sender: TObject);
begin
{����� ������ �������������� ��������� - �������� ��������� ����}
  Statistics_methods_Main.nachln_ustanovka_izm_param(1,1,1,1);
  Statistics_methods_Main.Show;
end;

procedure TMainForm1.DenisityClick(Sender: TObject);
var
ProjectDir,SigmaLocation : String;
begin
ProjectDir:= GetDOSFileName(ExtractFilePath(ProjectFileName));
SigmaLocation:=  LowerCase(ExtractFilePath(ParamStr(0)));
 WinExec( SigmaLocation +'ShowDensity.exe '+ ProjectDir +'\ExpGrd.poi',ExtractFilePath(ProjectFileName),SW_SHOWMAXIMIZED);
end;






//  ��������� ������� ������ "������� ���������� �  Excel"
// ��������� ��� ������ ���� "Test.txt" �� ���������� �������,
// ������������ ��� � ����������� ������ � ���� "C:\FromSigma.xls"
// ��� ������ ��������� ����������������� MS Excel, ������������ ������
                                            // Excel_TLB, ActiveX, ComObj;

procedure TMainForm1.Excel1Click(Sender: TObject);
var
  txtFile : TextFile; // ��������� ����
  Ex      : OleVariant; // *.xls ����
  ClassID : TCLSID;   // ���������� ��� �������� ��������� Excel
  Rez     : HRESULT;  //  ���������, ������������ ��� ������������� ��������

  text    : string; // ������, ����������� �� ���������� �����
  Data    : TData; // ���������� ������, � ������� �������� �����
                                                  // �� ������ text
  Words   : Array of Array of String; // ��������� ������, � ������� ��������
                              // ������ � ����� �� ������ ���������� �����
                              // ��� ������ � ���� Excel
  i,j     : Integer;
  count   : Integer;   // ������� ����� ���������� �����
  c       : Char;
  buffer  : Double;   // ����������, � ������� ������� ������������ ���
                                                  // ����������� � ������

begin

  // �������� ��������� Excel
   Rez := CLSIDFromProgID(PWideChar(WideString('Excel.Application')), ClassID);
  if Rez <> S_OK then
    begin
      MessageDlg('MS EXCEL �� ����������, ���������� ������ ����������.',
                                                          mtERROR,[mbok],0);
                                                          end
    else
      begin
  // ��������� '.' ������������ ������� ����� �����
  DecimalSeparator := '.';


  //*********************
  // ������ � ��������� ������

  // �������� ����� ��� ������
  //(ProjectFileName+'.res');
  AssignFile(txtFile, ChangeFileExt(String(GetProject_FileName), '.res'));
  FileMode := fmOpenRead;
  Reset(txtFile);

  // ������� ����� ����� � ����� ��� ������������� ������������� �������
  count := 0;
  while not Eof(txtFile) do
  begin
    // ���������� �� ����� ������
      ReadLn(txtFile, text);
      count := count + 1;
  end;
  Reset(txtFile);    // ����� ������� ������ �����

  // ��������� ����������� �������
  SetLength(Words, count);

  // ��������� ���������� ����� ��� ������ � ������
  count := 0;
  while not Eof(txtFile) do
  begin

      ReadLn(txtFile, text);  // ���������� �� ����� ������
      c:=#32;                //  ASCII-��� ������� (������������ �������)

      // �������� ������ �� ������ ����
      Data:=Split(text, c);

      // �� 1-�� ����� ���������� ���������� ���������� ������ - ����� �������
      // ��� ����� � �������� ����������� ���-�� ������ ������� Words
        // ���� ����� - �������� � ������ Words ������ text, �����
       // ������� �� ����� � �������� � ������ Words
      if ((Length(Data) > 0) and (TryStrToFloat(Data[0], buffer))) then
        begin
          SetLength(Words[count], Length(Data));
          for i := 0 to High(Data) do
            Words[count][i] := Data[i];
        end
      else
        begin
          SetLength(Words[count], 1);
          Words[count][0] := text;
        end;

      count := count + 1;

  end;

//  for i := 0 to High(Words) do
//    for j := 0 to High(Words[i]) do
//       ShowMessage('Words['+intToStr(i)+','+intToStr(j)+'] = '+
//                  Words[i,j]);

  CloseFile(txtFile);    // �������� ���������� �����



  // ********************
  // ������ � ��������� ������ ��������� - ������ Words �����������
  // ������ � Excel: �������� ������� Words

  Ex := CreateOleObject('Excel.Application');
  Ex.Visible := False;  // ������ Excel

  Ex.Workbooks.Add;

  for i := 0 to High(Words) do
    for j := 0 to High(Words[i]) do
        Ex.Cells[i+1,j+1].Value := Words[i,j];

  Ex.ActiveWorkBook.SaveAs(ChangeFileExt(String(GetProject_FileName),'.xls'));
  Ex.WorkBooks.Close; //  ���������� ������ � ������

  end;
end;


















End.





