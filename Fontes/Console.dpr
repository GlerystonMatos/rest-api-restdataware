program Console;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  CGIApp,
  WebBroker,
  System.SysUtils,
  uWbCGIService in 'uWbCGIService.pas' {frmWbCGIService: TWebModule},
  uServerMethodDataModule in 'uServerMethodDataModule.pas' {dmServerMethodDataModule: TServerMethodDataModule};

begin
  Application.Initialize;
  Application.WebModuleClass := TfrmWbCGIService;
  Application.CreateForm(TfrmWbCGIService, frmWbCGIService);
  Application.Run;
end.
