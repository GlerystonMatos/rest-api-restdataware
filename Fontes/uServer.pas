unit uServer;

interface

uses
  Winapi.Windows, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, uDWAbout, uRESTDWBase, Vcl.StdCtrls, Vcl.Buttons,
  uServerMethodDataModule;

type
  TfrmServer = class(TForm)
    RESTServicePooler: TRESTServicePooler;
    btnStartStop: TBitBtn;
    procedure btnStartStopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
    btnStartStop.Caption := 'Stop'
  else
    btnStartStop.Caption := 'Start';
end;

procedure TfrmServer.FormCreate(Sender: TObject);
begin
  RESTServicePooler.ServerMethodClass := TdmServerMethodDataModule;
end;

end.
