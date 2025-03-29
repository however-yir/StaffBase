import json
import random
import time

from django.http import JsonResponse, HttpResponse
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt

from app01 import models
from app01.utils.bootstrap import BootStrapModelForm
from app01.utils.pagination import Pagination


def iot_views(request):
    return render(request, 'iot_views.html')


def iot_chart1(request):
    random_list1 = []
    random_list2 = []
    for j in range(7):
        random_list1.append(random.randint(1, 20))
        random_list2.append(random.randint(1, 804))
    # 序列化方式1 JsonResponse({"XX":XX})
    # 序列化方式2 HttpResponse(json.dumps(random_list))
    legend_list = ['温度', '湿度']
    xAxis_list = ['1', '2', '3', '4', '5', '6', '7']
    series_list = [
        {
            "name": '温度',
            "type": 'line',
            "stack": 'Total',
            "data": random_list1,
        },
        {
            "name": '湿度',
            "type": 'line',
            "stack": 'Total',
            "data": random_list2,
        },
    ]

    result = {
        "status": True,
        "data": {
            'legend_list': legend_list,
            'xAxis_list': xAxis_list,
            'series_list': series_list,
        }
    }

    return JsonResponse(result)


def iot_chart2(request):
    # 定义3个参数的列表，放从数据库读出来值
    Temp_list = []
    Hum_list = []
    PM_list = []
    # 读取数据库最后5行
    queryset = models.Iot01.objects.all()
    length = queryset.count()
    result = queryset[length - 5:length]
    for item in result:
        data1 = item.Temp
        data2 = item.Hum
        data3 = item.PM
        Temp_list.append(float(data1))
        Hum_list.append(float(data2))
        PM_list.append(float(data3))

    legend_list = ['温度', '湿度', 'PM']
    xAxis_list = ['1', '2', '3', '4', '5']
    series_list = [
        {
            "name": '温度',
            "type": 'line',
            "stack": 'Total',
            "data": Temp_list,
        },
        {
            "name": '湿度',
            "type": 'line',
            "stack": 'Total',
            "data": Hum_list,
        },
        {
            "name": 'PM',
            "type": 'line',
            "stack": 'Total',
            "data": PM_list,
        },
    ]

    result = {
        "status": True,
        "data": {
            'legend_list': legend_list,
            'xAxis_list': xAxis_list,
            'series_list': series_list,
        }
    }
    return JsonResponse(result)


def iot_chart3(request):
    # 定义4个参数的列表，放从数据库读出来值
    CO_list = []
    CO2_list = []
    SO2_list = []
    NO2_list = []
    # 读取数据库最后5行
    queryset = models.Iot02.objects.all()
    length = queryset.count()
    result = queryset[length - 7:length]
    for item in result:
        data1 = item.CO
        data2 = item.CO2
        data3 = item.SO2
        data4 = item.NO2
        CO_list.append(float(data1))
        CO2_list.append(float(data2))
        SO2_list.append(float(data3))
        NO2_list.append(float(data4))

    legend_list = ['CO', 'CO2', 'SO2', 'NO2']
    xAxis_list = ['1', '2', '3', '4', '5', '6', '7']
    series_list = [
        {
            "name": 'CO',
            "type": 'line',
            "stack": 'Total',
            "data":  CO_list,
        },
        {
            "name": 'CO2',
            "type": 'line',
            "stack": 'Total',
            "data":  CO2_list,
        },
        {
            "name": 'SO2',
            "type": 'line',
            "stack": 'Total',
            "data":  SO2_list,
        },
        {
            "name": 'NO2',
            "type": 'line',
            "stack": 'Total',
            "data": NO2_list,
        },
    ]

    result = {
        "status": True,
        "data": {
            'legend_list': legend_list,
            'xAxis_list': xAxis_list,
            'series_list': series_list,
        }
    }
    return JsonResponse(result)


class EquipmentModelForm(BootStrapModelForm):
    class Meta:
        model = models.Equipment
        fields = "__all__"


def equipment(request):
    queryset = models.Equipment.objects.all().order_by()
    page_object = Pagination(request, queryset)
    form = EquipmentModelForm

    context = {
        'form': form,
        "queryset": page_object.page_queryset,
        "page_string": page_object.html(),
    }
    return render(request, 'equipment.html', context)


@csrf_exempt
def equipment_add(request):
    """增加(Ajax请求)"""
    form = EquipmentModelForm(data=request.POST)
    if form.is_valid():
        form.save()
        # return HttpResponse(json.dumps({"status": True"}))
        return JsonResponse({"status": True})

    return JsonResponse({"status": False, "error": form.errors})


# Ajax
def equipment_delete(request):
    """删除设备"""
    uid = request.GET.get("uid")
    exists = models.Equipment.objects.filter(id=uid).exists()
    if not exists:
        return JsonResponse({"status": False, 'error': "数据不存在"})

    models.Equipment.objects.filter(id=uid).delete()
    return JsonResponse({"status": True})


def equipment_detail(request):
    """根据id获取设备详情"""
    uid = request.GET.get("uid")
    row_dict = models.Equipment.objects.filter(id=uid).values("MAC", "detail", "title", "status").first()
    if not row_dict:
        return JsonResponse({"status": False, 'error': "数据不存在"})

    # 从数据库中获取一个对象 row_object
    result = {
        "status": True,
        "data": row_dict,
    }

    return JsonResponse(result)


@csrf_exempt
def equipment_edit(request):
    """编辑设备"""
    uid = request.GET.get('uid')
    row_object = models.Equipment.objects.filter(id=uid).first()
    if not row_object:
        return JsonResponse({"status": False, 'tips': "数据不存在,请重试！"})

    form = EquipmentModelForm(data=request.POST, instance=row_object)
    if form.is_valid():
        form.save()
        return JsonResponse({"status": True})

    return JsonResponse({"status": False, "error": form.errors})


def equipment_cmd(request):
    return render(request, 'mqtt.html')