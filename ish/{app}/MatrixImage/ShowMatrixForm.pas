unit ShowMatrixForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;


type
  TA = ARRAY [1..9] OF BYTE;
  pTA = ^TA;

  MatrixType = (A=1, L=2);

  TMatrixForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PaintBox1: TPaintBox;
    PaintBox2: TPaintBox;
    Label1: TLabel;
    procedure PaintBox1Paint(Sender: TObject);
    procedure PaintBox2Paint(Sender: TObject);
    procedure TabChange(Sender: TObject);
    procedure CloseForm(Sender: TObject; VAR Action: TCloseAction);
  private
    { Private declarations }
    matrixSize: Integer;
    projectName: String;

    envA       : Array of Integer;
    xenvA      : Array of Integer;
    envASize   : Integer;

    envL       : Array of Integer;
    xenvL      : Array of Integer;
    envLSize   : Integer;

    maxX, maxY: Integer;

    //���������� ����� ��� �������� ������� ������
    BitmapA : TBitmap;
    BitmapL : TBitmap;
    BitmapALarge : TBitmap;
    BitmapLLarge : TBitmap;
    F : File of Byte;
  public
    { Public declarations }
    Error : Integer;
    procedure ShowForm(ProjectFileName: String);
    procedure LoadResults(SourceFile: String);
    procedure DrawMatrix();
    procedure MyRead(pX:pTA; n:BYTE);
    //���������� �������� �������� � ������ ����������� �������, ���������� ����������������
    //���������� �������. ������������ �������� � �������� ���� ��������� �� ������
    function GetElement(i,j:Integer; xenv,env:Array of Integer):Integer;
  end;

var
  MatrixForm: TMatrixForm;

implementation

PROCEDURE TMatrixForm.MyRead(pX:pTA; n:BYTE);
VAR i : BYTE;
BEGIN
  FOR i:=1 TO n DO READ(F,pX^[i]);
END;

procedure TMatrixForm.ShowForm(ProjectFileName: String);
  var
    sourceFile :String;
  begin
    sourceFile := ExtractFileDir(ProjectFileName)+'\RESULT3.BIN';
    projectName := ExtractFileName(ProjectFileName);
    LoadResults(sourceFile);
    if  Error<>0 then begin
      ShowMessage('������ � ������ �������� ����������� ������� '+IntToStr(Error));
      EXIT;
    end;
    Show;
    DrawMatrix;

  end;

procedure TMatrixForm.LoadResults(SourceFile: String);
  var
    i,counter : Integer;
    j         : ShortInt;
  begin
    Error:=1;
    if not FileExists(SourceFile) then begin
      ShowMessage('�� ���� ����� ���� '+SourceFile);
      EXIT;
    end else begin
      AssignFile(F, SourceFile);
      Reset(F);
      i:=0;
    //�������� ������ �������
      while not Eof(F) do begin
        MyRead(Addr(i), 4);
        if (i = -1) then BREAK;
        matrixSize:=i;
      end;
    //�������� ��� �������� ������ �� ������� �
      counter:=0;
      i:=0;
      SetLength(xenvA, matrixSize+1);
      while not Eof(F) do begin
        MyRead(Addr(i),4);
        if (i = -1) then BREAK;
        xenvA[counter]:=i;
        inc(counter);
      end;
    //������ �������
      while not Eof(F) do begin
        MyRead(Addr(i),4);
        if (i = -1) then BREAK;
        envASize:=i;
      end;
      SetLength(envA, envASize);
      j:=0;
      counter:=0;
      while not Eof(F) do begin
        MyRead(Addr(j),4);
        if (j = -1) then BREAK;
        envA[counter]:=j;
        inc(counter);
      end;
  //��� �� �� ����� ��� ��������� L
      counter:=0;
      i:=0;
      SetLength(xenvL, matrixSize+1);
      while not Eof(F) do begin
        MyRead(Addr(i),4);
        if (i = -1) then BREAK;
        xenvL[counter]:=i;
        inc(counter);
      end;
      while not Eof(F) do begin
        MyRead(Addr(i),4);
        if (i = -1) then BREAK;
        envLSize:=i;
      end;
      SetLength(envL, envASize);
      j:=0;
      counter:=0;
      while not Eof(F) do begin
        MyRead(Addr(j),4);
        if (j = -1) then BREAK;
        envL[counter]:=j;
        inc(counter);
      end;
      CloseFile(F);
    end;
    Error:=0;
  end;

  procedure TMatrixForm.DrawMatrix;
  var
    i,j, intensity, length : Integer;
    Dest,Source: TRect;
  begin
    BitmapALarge := TBitmap.Create;
    BitmapLLarge := TBitmap.Create;
    BitmapALarge.Width := matrixSize+2;
    BitmapALarge.Height := matrixSize+2;
    BitmapLLarge.Width := matrixSize+2;
    BitmapLLarge.Height := matrixSize+2;

    maxX := PaintBox1.Width-4;
    maxY := PaintBox1.Height-4;;

    BitmapA := TBitmap.Create;
    BitmapA.Width:=PaintBox1.Width;
    BitmapA.Height:=PaintBox1.Height;

    Dest:=Rect(0,0,BitmapA.Width,BitmapA.Height);
    Source:=Rect(0,0,BitmapA.Width,BitmapA.Height);

    BitmapALarge.Canvas.Pen.Width :=1;
    BitmapALarge.Canvas.Pen.Color := clBlack;
    BitmapALarge.Canvas.Pen.Style := psSolid;
    BitmapALarge.Canvas.Pen.Mode := pmCopy;
    BitmapALarge.Canvas.Brush.Color := clWhite;
    BitmapALarge.Canvas.Brush.Style := bsSolid;
    BitmapALarge.Canvas.Rectangle(0,0,BitmapALarge.Width,BitmapALarge.Height);
    BitmapLLarge.Canvas.Pen.Width :=1;
    BitmapLLarge.Canvas.Pen.Color := clBlack;
    BitmapLLarge.Canvas.Pen.Style := psSolid;
    BitmapLLarge.Canvas.Pen.Mode := pmCopy;
    BitmapLLarge.Canvas.Brush.Color := clWhite;
    BitmapLLarge.Canvas.Brush.Style := bsSolid;
    BitmapLLarge.Canvas.Rectangle(0,0,BitmapLLarge.Width,BitmapLLarge.Height);

    BitmapA.Canvas.Brush.Color := clWhite;
    BitmapA.Canvas.Brush.Style := bsSolid;
    BitmapA.Canvas.Rectangle(0,0,BitmapA.Width,BitmapA.Height);
    PaintBox1.Canvas.Draw(0,0,BitmapA);
    BitmapA.Canvas.Brush.Color := clBlue;

    for i := 1 to matrixSize do begin
      for j := 1 to matrixSize do begin
        intensity := 1-GetElement(i,j,xenvA, envA);
        BitmapALarge.Canvas.Pixels[j,i]:= intensity*$ffffff;
        intensity := 1-GetElement(i,j,xenvL, envL);
        BitmapLLarge.Canvas.Pixels[j,i]:= intensity*$ffffff;
      end;
      length := Trunc(i*BitmapA.Width/matrixSize);
      BitmapA.Canvas.Rectangle(0,0,length,30);
      PaintBox1.Canvas.Draw(0,0,BitmapA);
    end;
    BitmapA.Canvas.StretchDraw(Rect(0,0,BitmapA.Width, BitmapA.Height), BitmapALarge);
    PaintBox1.Canvas.Draw(0,0,BitmapA);

    Self.Caption:='Sigma 7.4 - ����� ������� '+ projectName;
    Label1.Caption:='������ �������: '+IntToStr(matrixSize)+'x'+IntToStr(matrixSize);

  end;



  function TMatrixForm.GetElement(i,j:Integer;xenv,env:Array of Integer):Integer;
  begin
    Result := 0;
    if(i=j) then Result:=1;
    if(j>i) then Result:=0;
    if(j<i) then begin
      if((i-xenv[i+1]+xenv[i])<=j) then begin
        Result:=env[xenv[i+1]-i+j-1];
      end else begin
        Result:=0;
      end;
    end;
  end;

  procedure TMatrixForm.PaintBox1Paint(Sender: TObject);
  begin
    PaintBox1.Canvas.Draw(0,0,BitmapA);
  end;

  procedure TMatrixForm.PaintBox2Paint(Sender: TObject);
  begin
    PaintBox2.Canvas.Draw(0,0,BitmapL);
  end;

  procedure TMatrixForm.TabChange(Sender: TObject);

  begin
    if (PageControl1.ActivePage=TabSheet2) And (BitmapL=nil) then begin
      Self.Caption := Self.Caption;
      BitmapL := TBitmap.Create;
      BitmapL.Width:=PaintBox2.Width;
      BitmapL.Height:=PaintBox2.Height;

      BitmapL.Canvas.Brush.Color := clWhite;
      BitmapL.Canvas.Brush.Style := bsSolid;
      BitmapL.Canvas.Rectangle(0,0,BitmapL.Width,BitmapL.Height);

      PaintBox2.Canvas.Draw(0,0,BitmapL);

      BitmapL.Canvas.StretchDraw(Rect(0,0,BitmapL.Width, BitmapL.Height), BitmapLLarge);
      PaintBox2.Canvas.Draw(0,0,BitmapL);
    end;
  end;

  procedure TMatrixForm.CloseForm(Sender: TObject; VAR Action: TCloseAction);
  begin
    MatrixForm:=nil;
    Action:=caFree;

  end;
{$R *.dfm}

end.



