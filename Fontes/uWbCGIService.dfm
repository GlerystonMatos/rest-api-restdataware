object frmWbCGIService: TfrmWbCGIService
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = frmWbCGIServiceDefaultHandlerAction
    end>
  Height = 76
  Width = 112
  object RESTServiceCGI: TRESTServiceCGI
    CORS = False
    CORS_CustomHeaders.Strings = (
      'Access-Control-Allow-Origin=*'
      
        'Access-Control-Allow-Methods=GET, POST, PATCH, PUT, DELETE, OPTI' +
        'ONS'
      
        'Access-Control-Allow-Headers=Content-Type, Origin, Accept, Autho' +
        'rization, X-CUSTOM-HEADER')
    AuthenticationOptions.AuthorizationOption = rdwAONone
    Encoding = esUtf8
    ForceWelcomeAccess = False
    ServerContext = 'restdataware'
    RootPath = '.\'
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    Left = 41
    Top = 16
  end
end
