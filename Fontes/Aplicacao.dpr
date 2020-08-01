program Aplicacao;

uses
  Vcl.Forms,
  uServer in 'uServer.pas' {frmServer},
  uServerMethodDataModule in 'uServerMethodDataModule.pas' {dmServerMethodDataModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmServer, frmServer);
  Application.Run;
end.
