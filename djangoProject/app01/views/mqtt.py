import paho.mqtt.client as mqtt
from django.http import HttpResponse
from django.shortcuts import render


def view(request):
    if request.method == "GET":
        return render(request, "mqtt.html")

    cmd = ""
    cmd = request.POST.get("cmd")
    print(cmd)
    str_data = str(cmd)
    client = mqtt.Client()
    # 参数有 Client(client_id="", clean_session=True, userdata=None, protocol=MQTTv311, transport="tcp")
    client.connect("127.0.0.1", 1883, 60)  # 连接服务器,端口为1883,维持心跳为60秒
    client.publish('test', str_data, 1)
    return render(request, "mqtt.html")

