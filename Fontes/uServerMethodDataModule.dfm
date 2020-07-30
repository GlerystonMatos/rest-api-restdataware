object dmServerMethodDataModule: TdmServerMethodDataModule
  OldCreateOrder = False
  Encoding = esUtf8
  Height = 150
  Width = 215
  object DWServerEvents: TDWServerEvents
    IgnoreInvalidParams = False
    Events = <
      item
        Routes = [crGet]
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'HelloWorld'
        OnReplyEvent = DWServerEventsEventsHelloWorldReplyEvent
      end
      item
        Routes = [crGet]
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'ServerTime'
        OnReplyEvent = DWServerEventsEventsServerTimeReplyEvent
      end
      item
        Routes = [crGet]
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'string'
            Encoded = False
          end>
        JsonMode = jmPureJSON
        Name = 'EchoString'
        OnReplyEvent = DWServerEventsEventsEchoStringReplyEvent
      end
      item
        Routes = [crGet]
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'string'
            Encoded = False
          end>
        JsonMode = jmPureJSON
        Name = 'ReverseString'
        OnReplyEvent = DWServerEventsEventsReverseStringReplyEvent
      end
      item
        Routes = [crGet]
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
    Left = 88
    Top = 48
  end
end
