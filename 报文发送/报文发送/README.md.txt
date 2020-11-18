①Win + R
在输入框中输入 cmd 



cd D:\运营资料\报文发送

D:\运营资料\报文发送>

Customs.HuaDong.Inventec.Terminal.exe.config
```
    <add key="Customs.RabbitMQ.Addresses" value="rabbitmq.amiintellect.com" />
    <add key="Customs.RabbitMQ.Port" value="5672" />
    <!-- 10000003_5006640002 / 306ab1f2 -->
    <add key="Customs.RabbitMQ.Username" value="10000001_500923000A_02" />
    <add key="Customs.RabbitMQ.Password" value="10000001_500923000A_02" />
    <add key="Customs.RabbitMQ.ExchangeName" value="" />
    <add key="Customs.RabbitMQ.Send.QueueName" value="10000001_500923000A_b2b02_out" />
```

②Shift + 右键菜单 -> 在此处打开 Powershell

.\Customs.HuaDong.Inventec.Terminal.exe --rabbitmq --file data/example.xml
.\Customs.HuaDong.Inventec.Terminal.exe --rabbitmq --file data/NEMS_INV101_ZCHZ2020101900005_4eddd602-bdb6-4cca-9a31-adbf6f87730a_20201019114503.xml