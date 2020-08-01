library ISAPI;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  Web.WebBroker,
  Winapi.ActiveX,
  Web.Win.ISAPIApp,
  System.Win.ComObj,
  uWbCGIService in 'uWbCGIService.pas' {frmWbCGIService},
  uServerMethodDataModule in 'uServerMethodDataModule.pas' {dmServerMethodDataModule: TServerMethodDataModule};

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.WebModuleClass := nil;
  Application.CreateForm(TfrmWbCGIService, frmWbCGIService);
  Application.Run;
end.
