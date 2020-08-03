object dmServerMethodDataModule: TdmServerMethodDataModule
  OldCreateOrder = False
  Encoding = esUtf8
  Height = 76
  Width = 112
  object DWServerEvents: TDWServerEvents
    IgnoreInvalidParams = False
    Events = <
      item
        Routes = [crGet]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'value'
            Encoded = False
          end>
        JsonMode = jmPureJSON
        Name = 'Eco'
        OnReplyEvent = DWServerEventsEventsEcoReplyEvent
      end
      item
        Routes = [crGet]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'valor01'
            Encoded = False
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'valor02'
            Encoded = False
          end>
        JsonMode = jmPureJSON
        Name = 'Soma'
        OnReplyEvent = DWServerEventsEventsSomaReplyEvent
      end
      item
        Routes = [crGet, crPost, crPut, crDelete]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'nome'
            Encoded = False
          end>
        JsonMode = jmPureJSON
        Name = 'Usuario'
        OnReplyEventByType = DWServerEventsEventsUsuarioReplyEventByType
      end>
    Left = 41
    Top = 16
  end
end
