unit uWbCGIService;

interface

uses
  Winapi.Windows, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, HTTPApp, uDWAbout, uServerMethodDataModule,
  uRESTDWBase;

type
  TfrmWbCGIService = class(TWebModule)
    RESTServiceCGI: TRESTServiceCGI;
    procedure frmWbCGIServiceDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWbCGIService: TfrmWbCGIService;

implementation

{$R *.dfm}

procedure TfrmWbCGIService.frmWbCGIServiceDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if (RESTServiceCGI <> nil) then
    RESTServiceCGI.Command(Request, Response, Handled);
end;

procedure TfrmWbCGIService.WebModuleCreate(Sender: TObject);
begin
  RESTServiceCGI.RootPath := '.\';
  RESTServiceCGI.ServerMethodClass := TdmServerMethodDataModule;
end;

end.
