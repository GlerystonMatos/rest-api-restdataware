unit uServer;

interface

uses
  Winapi.Windows, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, uDWAbout, uRESTDWBase, Vcl.StdCtrls, Vcl.Buttons,
  uServerMethodDataModule, Vcl.Imaging.jpeg, Vcl.ExtCtrls, SysUtils;

type
  TfrmServer = class(TForm)
    imgLogo: TImage;
    lbVersao: TLabel;
    lbStatus: TLabel;
    lbPorta: TLabel;
    btnStartStop: TBitBtn;
    RESTServicePooler: TRESTServicePooler;
    procedure btnStartStopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServer: TfrmServer;

implementation

{$R *.dfm}

procedure TfrmServer.btnStartStopClick(Sender: TObject);
begin
  RESTServicePooler.Active := not RESTServicePooler.Active;

  if (RESTServicePooler.Active) then
  begin
    btnStartStop.Caption := 'Stop';
    lbStatus.Caption := 'Status: Online';
    lbPorta.Caption := 'Port: ' + IntToStr(RESTServicePooler.ServicePort);
  end
  else
  begin
    btnStartStop.Caption := 'Start';
    lbStatus.Caption := 'Status: Offline';
    lbPorta.Caption := 'Port: ';
  end;
end;

procedure TfrmServer.FormCreate(Sender: TObject);
begin
  RESTServicePooler.ServerMethodClass := TdmServerMethodDataModule;
end;

procedure TfrmServer.FormShow(Sender: TObject);
begin
  lbVersao.Caption := 'Version: ' + RESTServicePooler.VersionInfo;
end;

end.
