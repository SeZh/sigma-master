{*********************************************************************}
{                                                                     }
{                    ���������� ����������� ��������                  }
{                                                                     }
{                               ������� 609                           }
{                                                                     }
{                    ������� ����� ����������� 2001                   }
{                                                                     }
{*********************************************************************}
Unit AddFile;

Interface

Uses
     Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, Buttons, ExtCtrls, ComCtrls, Constants;

Type
     TAddFileForm = Class(TForm)
               GroupBox4           : TGroupBox;
               GroupBox5           : TGroupBox;
               EditFiles           : TListBox;
               StandartFiles       : TListBox;
               OpenDialog1         : TOpenDialog;
               Panel2              : TPanel;
               BitBtn2             : TBitBtn;
               BitBtn1             : TBitBtn;
               ForEdit             : TButton;
               Strandart           : TButton;
               Panel1              : TPanel;
               Panel6              : TPanel;
               GroupBox1           : TGroupBox;
               Label1              : TLabel;
               FormFileEdit        : TEdit;
               FormFileButton      : TButton;
    Label2: TLabel;
    Label3: TLabel;
    Splitter1: TSplitter;
    Label5: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
               Procedure FormShow(Sender: TObject);
               Procedure ForEditClick(Sender: TObject);
               Procedure OKClick(Sender: TObject);
               Procedure StrandartClick(Sender: TObject);
               Procedure FormFileButtonClick(Sender: TObject);
               Procedure EditFilesDblClick(Sender: TObject);
               Procedure CancelClick(Sender: TObject);
               Procedure StandartFilesDblClick(Sender: TObject);
               Procedure AddFileClick(Sender: TObject);
               procedure DelFileClick(Sender: TObject);
    procedure EditFilesDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure StandartFilesDragDrop(Sender, Source: TObject; X,
      Y: Integer);
          private
               { Private declarations }
          public
               { Public declarations }
               //BackUpProject : TStringList;
     End;

Var
     AddFileForm : TAddFileForm;

Implementation
Uses MainForm, TProject;

{$R *.DFM}
///////////////////////////////////////////////////////////////////
//���������� ����� �������
///////////////////////////////////////////////////////////////////
Procedure TAddFileForm.FormShow(Sender: TObject);
Var
     count,i  : word;
     FileName : String;
     pac      : String;
Begin
     Caption:='Sigma 7.4 - ���������������� �������' + ' '+ GetProjectName;
     FormFileEdit.Text:=Project_GetFormFile;
     StandartFiles.Items.Clear;
     EditFiles.Items.Clear;

     count:=Project_Fortran_Count;
     If Count>0 Then
     Begin
          For i:=1 To Count Do
          Begin
               FileName:=Project_Fortran_Get(i);
               pac:=String(Project_PackFileName(PChar(FileName)));
               If pac[1]='*' Then
               Begin
                    If FileExists(FileName) Then StandartFiles.Items.Add(FileName)
                    //Else StandartFiles.Items.Add('! '+FileName);
               End
               Else Begin
                    If FileExists(FileName) Then EditFiles.Items.Add(FileName)
                    //Else EditFiles.Items.Add('! '+FileName);
               End;
          End;
     End;
End;
///////////////////////////////////////////////////////////////////
//������� ����� �� ������ ����������� � ������ �������������
///////////////////////////////////////////////////////////////////
Procedure TAddFileForm.ForEditClick(Sender: TObject);
Var
     FileName, NewFileName : String;
Begin
     If StandartFiles.ItemIndex<>-1 Then
     Begin
          FileName:=StandartFiles.Items.Strings[StandartFiles.ItemIndex];
          If FileName[1]<>'!' Then
          Begin
               NewFileName:=ExtractFilePath(ProjectFileName)+ExtractFileName(FileName);
               If FileExists(NewFileName) Then
               Begin
                    If MessageDlg('�������� '+NewFileName+' ?', mtConfirmation,mbOKCancel, 0)=mrOK Then Begin
                       DeleteFile(pchar(NewFileName));
                       CopyFile(pchar(FileName),pchar(NewFileName),true);
                    End;
               End
               Else CopyFile(pchar(FileName),pchar(NewFileName),true);
               EditFiles.Items.Add(NewFileName);
               StandartFiles.Items.Delete(StandartFiles.ItemIndex);
          End;
     End;
End;
///////////////////////////////////////////////////////////////////
//������� ����� �� ������ ������������� � ������ �����������
///////////////////////////////////////////////////////////////////
Procedure TAddFileForm.StrandartClick(Sender: TObject);
Var
     FileName, NewFileName : String;
Begin
     If (EditFiles.ItemIndex > -1) Then
     Begin
          FileName:=EditFiles.Items.Strings[EditFiles.ItemIndex];
          NewFileName:=Project_GetSource+ExtractFileName(FileName);
          If FileExists(NewFileName) Then
          Begin
            // ���� �� ����� � ������ ����������� ���� ����:
			      if (StandartFiles.Items.IndexOf(NewFileName) = -1) then
			      begin
              StandartFiles.Items.Add(NewFileName);
			      end;

            EditFiles.Items.Delete(EditFiles.ItemIndex);
          end
          Else
          Begin
            MessageDlg('���� � ����� ������ �� ����� ���� '+
                        '������ �� ����� �����������.',
                        mtWarning, [mbOK], 0);
          End;
     End;
End;
///////////////////////////////////////////////////////////////////
//���������� ��������� ���� ������
///////////////////////////////////////////////////////////////////
Procedure TAddFileForm.OKClick(Sender: TObject);
Var
     i : integer;
     s:string;
Begin
     Project_SetFormFile(PChar(FormFileEdit.Text));
     Project_Fortran_Clear;
     If EditFiles.Items.Count>0 Then
     Begin
          For i:=0 To EditFiles.Items.Count-1 Do
          Begin
               s:=EditFiles.Items.Strings[i];
               if (s[1]='!') then s:=Copy(S,3,Length(s)-2);
               Project_Fortran_Add(PChar(s));
          End;
     End;
     If StandartFiles.Items.Count>0 Then
     Begin
          For i:=0 To StandartFiles.Items.Count-1 Do
          Begin
               s:=StandartFiles.Items.Strings[i];
               if (s[1]='!') then s:=Copy(S,3,Length(s)-2);
               Project_Fortran_Add(PChar(s));
          End;
     End;
     
     // Plotnikov
     Project_Save(PChar(ProjectFileName));
     //
     CheckState;
     close;
End;
///////////////////////////////////////////////////////////////////
//������ ��������� ���� ������
///////////////////////////////////////////////////////////////////
Procedure TAddFileForm.CancelClick(Sender: TObject);
Begin
     close;
End;
///////////////////////////////////////////////////////////////////
//�����/������� ����� ����� �����
///////////////////////////////////////////////////////////////////
Procedure TAddFileForm.FormFileButtonClick(Sender: TObject);
Begin
     OpenDialog1.FileName:=FormFileEdit.Text;
     OpenDialog1.Title:='������� ���� �����';
     OpenDialog1.DefaultExt:='*.sfm';
     OpenDialog1.Filter:='����� �����|*.sfm|����� ����� �����|*.frm';
     If OpenDialog1.Execute Then
     Begin
          FormFileEdit.Text:=OpenDialog1.FileName;
     End;
End;
///////////////////////////////////////////////////////////////////
//��������� ����� ����� ��� ��������������
///////////////////////////////////////////////////////////////////
Procedure TAddFileForm.EditFilesDblClick(Sender: TObject);
Var
     i           : word;
     find        : boolean;
     s1, s2      : String;
     OldFileName : String;
Begin
     If EditFiles.Items.Count>0 Then
     Begin
          OpenDialog1.FileName:=EditFiles.Items.Strings[EditFiles.ItemIndex];
          OldFileName:=LowerCase(ExtractFileName(OpenDialog1.FileName));
          OpenDialog1.Title:='������� ���� ���������';
          OpenDialog1.DefaultExt:='*.for';
          OpenDialog1.Filter:='Programs|*.for';
          If OpenDialog1.Execute Then
          Begin
               If FileExists(OpenDialog1.FileName) Then
               Begin
                    Find:=false;
                    s2:=LowerCase(ExtractFileName(OpenDialog1.FileName));
                    If EditFiles.Items.Count>0 Then
                    Begin
                         For i:=0 To EditFiles.Items.Count-1 Do
                         Begin
                              s1:=EditFiles.Items.Strings[i];
                              s1:=LowerCase(ExtractFileName(s1));
                              If (s1=s2) And (s1<>OldFileName) Then Find:=true;
                         End;
                    End;
                    If StandartFiles.Items.Count>0 Then
                    Begin
                         For i:=0 To StandartFiles.Items.Count-1 Do
                         Begin
                              s1:=StandartFiles.Items.Strings[i];
                              s1:=LowerCase(ExtractFileName(s1));
                              If (s1=s2) And (s1<>OldFileName) Then Find:=true;
                         End;
                    End;
                    If Not Find Then EditFiles.Items.Strings[EditFiles.ItemIndex]:=OpenDialog1.FileName;
               End;
          End;
     End;
End;
///////////////////////////////////////////////////////////////////
//��������� ����� ����� �� ������������ ������
///////////////////////////////////////////////////////////////////
Procedure TAddFileForm.StandartFilesDblClick(Sender: TObject);
Var
     i           : word;
     find        : boolean;
     s1, s2      : String;
     OldFileName : String;
Begin
     If StandartFiles.Items.Count>0 Then
     Begin
          OpenDialog1.FileName:=StandartFiles.Items.Strings[StandartFiles.ItemIndex];
          OldFileName:=LowerCase(ExtractFileName(OpenDialog1.FileName));
          OpenDialog1.Title:='������� ���� ���������';
          OpenDialog1.DefaultExt:='*.for';
          OpenDialog1.Filter:='Programs|*.for';
          If OpenDialog1.Execute Then
          Begin
               If FileExists(OpenDialog1.FileName) Then
               Begin
                    Find:=false;
                    s2:=LowerCase(ExtractFileName(OpenDialog1.FileName));
                    If EditFiles.Items.Count>0 Then
                    Begin
                         For i:=0 To EditFiles.Items.Count-1 Do
                         Begin
                              s1:=EditFiles.Items.Strings[i];
                              s1:=LowerCase(ExtractFileName(s1));
                              If (s1=s2) And (s1<>OldFileName) Then Find:=true;
                         End;
                    End;
                    If StandartFiles.Items.Count>0 Then
                    Begin
                         For i:=0 To StandartFiles.Items.Count-1 Do
                         Begin
                              s1:=StandartFiles.Items.Strings[i];
                              s1:=LowerCase(ExtractFileName(s1));
                              If (s1=s2) And (s1<>OldFileName) Then Find:=true;
                         End;
                    End;
                    If Not Find Then
                    Begin
                         If LowerCase(ExtractFilePath(OpenDialog1.FileName))=Project_GetSource Then
                         Begin
                              StandartFiles.Items.Strings[StandartFiles.ItemIndex]:=OpenDialog1.FileName;
                         End
                         Else Begin
                              StandartFiles.Items.Delete(StandartFiles.ItemIndex);
                              EditFiles.Items.Add(OpenDialog1.FileName);
                         End;
                    End;
               End;
          End;
     End;
End;
///////////////////////////////////////////////////////////////////
//���������� ������ ����� �����
///////////////////////////////////////////////////////////////////
Procedure TAddFileForm.AddFileClick(Sender: TObject);
Begin
     OpenDialog1.Title:='������� ���� ���������';
     OpenDialog1.DefaultExt:='*.for';
     OpenDialog1.Filter:='Programs|*.for';
     If OpenDialog1.Execute Then
     Begin
          If LowerCase(ExtractFilePath(OpenDialog1.FileName))=Project_GetSource Then//��������
          begin
               if FileExists(OpenDialog1.FileName) then
               begin
						      StandartFiles.Items.Add(OpenDialog1.FileName);
               end;
          end else
          begin
              if (EditFiles.Items.IndexOf(OpenDialog1.FileName) = -1) then
              begin
                EditFiles.Items.Add(OpenDialog1.FileName);
              end;
          end;
     End;
End;
///////////////////////////////////////////////////////////////////
//��������� ����� ����� �� ������������ ������
///////////////////////////////////////////////////////////////////

procedure TAddFileForm.DelFileClick(Sender: TObject);
begin
     if EditFiles.Items.Count>0 then EditFiles.Items.Delete(EditFiles.ItemIndex);
end;

procedure TAddFileForm.EditFilesDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
     if Source is TListBox then Accept:=true;
end;

procedure TAddFileForm.StandartFilesDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
     if Source is TListBox then
     begin
          if Source<>Sender then
          begin
               if Source=StandartFiles then ForEditClick(nil)
               else StrandartClick(nil);
          end;
     end;
end;


End.
