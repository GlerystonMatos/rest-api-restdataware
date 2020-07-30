unit uServerMethodDataModule;

interface

uses
  System.Classes, UDWDatamodule, uDWAbout, uRESTDWServerEvents, uDWJSONObject,
  JSON, System.SysUtils, System.StrUtils, uDWConsts;

type
  TdmServerMethodDataModule = class(TServerMethodDataModule)
    DWServerEvents: TDWServerEvents;
    procedure DWServerEventsEventsServerTimeReplyEvent(var Params: TDWParams; var Result: string);
    procedure DWServerEventsEventsHelloWorldReplyEvent(var Params: TDWParams; var Result: string);
    procedure DWServerEventsEventsEchoStringReplyEvent(var Params: TDWParams; var Result: string);
    procedure DWServerEventsEventsReverseStringReplyEvent(var Params: TDWParams; var Result: string);
    procedure DWServerEventsEventsSomaReplyEvent(var Params: TDWParams; var Result: string);
    procedure DWServerEventsEventsUsuarioReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
  private
    function UsuarioGet(var Params: TDWParams): string;
    function UsuarioPost(var Params: TDWParams): string;
    function UsuarioPut(var Params: TDWParams): string;
    function UsuarioDelete(var Params: TDWParams): string;
  public
    { Public declarations }
  end;

var
  dmServerMethodDataModule: TdmServerMethodDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmServerMethodDataModule.DWServerEventsEventsHelloWorldReplyEvent(var Params: TDWParams; var Result: string);
var
  objeto: TJSONObject;
begin
  objeto := TJSONObject.Create;
  objeto.AddPair(TJSONPair.Create('result', 'Hello World'));
  Result := objeto.ToString;
end;

procedure TdmServerMethodDataModule.DWServerEventsEventsServerTimeReplyEvent(var Params: TDWParams; var Result: string);
var
  objeto: TJSONObject;
begin
  objeto := TJSONObject.Create;
  objeto.AddPair(TJSONPair.Create('result', FormatDateTime('dd-mm-yyyy hh:mm:ss', Now)));
  Result := objeto.ToString;
end;

procedure TdmServerMethodDataModule.DWServerEventsEventsEchoStringReplyEvent(var Params: TDWParams; var Result: string);
var
  objeto: TJSONObject;
  value: string;
begin
  value := '';
  if (Assigned(Params.ItemsString['string'])) then
    value := Params.ItemsString['string'].Asstring;

  objeto := TJSONObject.Create;
  objeto.AddPair(TJSONPair.Create('result', value));
  Result := objeto.ToString;
end;

procedure TdmServerMethodDataModule.DWServerEventsEventsReverseStringReplyEvent(var Params: TDWParams; var Result: string);
var
  objeto: TJSONObject;
  value: string;
begin
  value := '';
  if (Assigned(Params.ItemsString['string'])) then
    value := Params.ItemsString['string'].Asstring;

  objeto := TJSONObject.Create;
  objeto.AddPair(TJSONPair.Create('result', System.StrUtils.ReverseString(value)));
  Result := objeto.ToString;
end;

procedure TdmServerMethodDataModule.DWServerEventsEventsSomaReplyEvent(var Params: TDWParams; var Result: string);
var
  objeto: TJSONObject;
  value01: Integer;
  value02: Integer;
begin
  value01 := 0;
  if (Assigned(Params.ItemsString['value01'])) then
    value01 := Params.ItemsString['value01'].AsInteger;

  value02 := 0;
  if (Assigned(Params.ItemsString['value02'])) then
    value02 := Params.ItemsString['value02'].AsInteger;

  objeto := TJSONObject.Create;
  objeto.AddPair(TJSONPair.Create('result', IntToStr((value01 + value02))));
  Result := objeto.ToString;
end;

procedure TdmServerMethodDataModule.DWServerEventsEventsUsuarioReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
begin
  case (RequestType) of
    rtGet:
      Result := UsuarioGet(Params);
    rtPost:
      Result := UsuarioPost(Params);
    rtPut:
      Result := UsuarioPut(Params);
    rtDelete:
      Result := UsuarioDelete(Params);
  end;
end;

function TdmServerMethodDataModule.UsuarioGet(var Params: TDWParams): string;
var
  lista: TJSONArray;
  objeto01: TJSONObject;
  objeto02: TJSONObject;
  objeto03: TJSONObject;
begin
  lista := TJSONArray.Create;

  objeto01 := TJSONObject.Create;
  objeto01.AddPair(TJSONPair.Create('nome', 'Snoopy'));
  objeto01.AddPair(TJSONPair.Create('senha', '123465'));
  lista.AddElement(objeto01);

  objeto02 := TJSONObject.Create;
  objeto02.AddPair(TJSONPair.Create('nome', 'Lola'));
  objeto02.AddPair(TJSONPair.Create('senha', '654321'));
  lista.AddElement(objeto02);

  objeto03 := TJSONObject.Create;
  objeto03.AddPair(TJSONPair.Create('nome', 'Tobias'));
  objeto03.AddPair(TJSONPair.Create('senha', '456123'));
  lista.AddElement(objeto03);

  Result := lista.ToString;
end;

function TdmServerMethodDataModule.UsuarioPost(var Params: TDWParams): string;
var
  dados: TJSONObject;
  objeto: TJSONObject;
begin
  if (Assigned(Params.ItemsString['Undefined'])) then
  begin
    dados := TJSONObject.ParseJSONValue(Params.ItemsString['Undefined'].AsString) as TJSONObject;
    objeto := TJSONObject.Create;
    if (not dados.GetValue('nome').Null) then
      objeto.AddPair(TJSONPair.Create('nome', dados.GetValue('nome').value));
    if (not dados.GetValue('senha').Null) then
      objeto.AddPair(TJSONPair.Create('senha', dados.GetValue('senha').value));
    objeto.AddPair(TJSONPair.Create('mensagem', 'Usuário criado com sucesso'));
    Result := objeto.ToString;
  end
  else
  begin
    Result := '';
  end;
end;

function TdmServerMethodDataModule.UsuarioPut(var Params: TDWParams): string;
var
  dados: TJSONObject;
  objeto: TJSONObject;
begin
  if (Assigned(Params.ItemsString['Undefined'])) then
  begin
    dados := TJSONObject.ParseJSONValue(Params.ItemsString['Undefined'].AsString) as TJSONObject;
    objeto := TJSONObject.Create;
    if (not dados.GetValue('nome').Null) then
      objeto.AddPair(TJSONPair.Create('nome', dados.GetValue('nome').value));
    if (not dados.GetValue('senha').Null) then
      objeto.AddPair(TJSONPair.Create('senha', dados.GetValue('senha').value));
    objeto.AddPair(TJSONPair.Create('mensagem', 'Usuário atualizado com sucesso'));
    Result := objeto.ToString;
  end
  else
  begin
    Result := '';
  end;
end;

function TdmServerMethodDataModule.UsuarioDelete(var Params: TDWParams): string;
var
  objeto: TJSONObject;
  value: string;
begin
  value := '';
  if (Assigned(Params.ItemsString['nome'])) then
    value := Params.ItemsString['nome'].Asstring;

  objeto := TJSONObject.Create;
  objeto.AddPair(TJSONPair.Create('mensagem', 'Usuário ' + value + ' excluído com sucesso'));
  Result := objeto.ToString;
end;

end.
