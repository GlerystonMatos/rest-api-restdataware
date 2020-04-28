unit uServerMethodDataModule;

interface

uses
  System.Classes, UDWDatamodule, uDWAbout, uRESTDWServerEvents, uDWJSONObject,
  SysUtils;

type
  TdmServerMethodDataModule = class(TServerMethodDataModule)
    DWServerEvents: TDWServerEvents;
    procedure DWServerEventsEventsservertimeReplyEvent(var Params: TDWParams; var Result: string);
    procedure DWServerEventsEventshelloworldReplyEvent(var Params: TDWParams; var Result: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmServerMethodDataModule: TdmServerMethodDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmServerMethodDataModule.DWServerEventsEventshelloworldReplyEvent(var Params: TDWParams; var Result: string);
begin
  if (Params.ItemsString['result'] <> nil) then
    Params.ItemsString['result'].Asstring := 'hello World';
end;

procedure TdmServerMethodDataModule.DWServerEventsEventsservertimeReplyEvent(var Params: TDWParams; var Result: string);
begin
  if (Params.ItemsString['result'] <> nil) then
    Params.ItemsString['result'].AsString := FormatDateTime('dd-mm-yyyy hh:mm:ss', Now);
end;

end.
