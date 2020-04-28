object dmServerMethodDataModule: TdmServerMethodDataModule
  OldCreateOrder = False
  Encoding = esUtf8
  Height = 150
  Width = 215
  object DWServerEvents: TDWServerEvents
    IgnoreInvalidParams = False
    Events = <
      item
        Routes = [crAll]
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odINOUT
            ObjectValue = ovString
            ParamName = 'result'
            Encoded = False
          end>
        JsonMode = jmDataware
        Name = 'servertime'
        OnReplyEvent = DWServerEventsEventsservertimeReplyEvent
      end
      item
        Routes = [crAll]
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odINOUT
            ObjectValue = ovString
            ParamName = 'result'
            Encoded = False
          end>
        JsonMode = jmDataware
        Name = 'helloworld'
        OnReplyEvent = DWServerEventsEventshelloworldReplyEvent
      end>
    Left = 88
    Top = 48
  end
end
