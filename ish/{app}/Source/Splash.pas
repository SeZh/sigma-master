unit Splash;
 interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, jpeg;

const
    app_version   = '7.4';
    app_version_date   = '31.05.2019';
    AppTitle = 'Sigma';

type
  TSplashHigh = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Ver: TLabel;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetAppVersion: String;

var
SplashHigh: TSplashHigh;

implementation

{$R *.DFM}

function GetAppVersion: String;
begin
Result:='������ ' + app_version +#13+#10+ ' �� ' + app_version_date;
End;

procedure TSplashHigh.FormClose(Sender: TObject; var Action: TCloseAction);
begin

Action:=caFree;
end;

procedure TSplashHigh.Image1Click(Sender: TObject);
begin
     close;
end;

procedure TSplashHigh.Timer1Timer(Sender: TObject);
begin
//SplashHigh.dop:=true;
close;
end;


procedure TSplashHigh.FormActivate(Sender: TObject);
begin

 {if Startup then
 begin
 Startup := False;
 end; }
end;

procedure TSplashHigh.FormShow(Sender: TObject);
begin
//dop:=false;
end;

end.
