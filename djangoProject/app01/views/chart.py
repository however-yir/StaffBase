from django.http import JsonResponse
from django.shortcuts import render


def chart_list(request):
    """数据统计"""
    return render(request, 'chart_list.html')


def chart_bar(request):
    """构造柱状图数据"""
    legend = ['销量', '业绩']
    series_list = [
        {
            "name": '销量',
            "type": 'bar',
            "data": [59, 2, 36, 10, 10, 20]
        },
        {
            "name": '业绩',
            "type": 'bar',
            "data": [50, 21, 36, 120, 30, 10]
        },
    ]
    x_axis = ['1月', '2月', '3月', '4月', '5月', '6月']

    result = {
        "status": True,
        "data": {
            'legend': legend,
            'series_list': series_list,
            'x_axis': x_axis,
        }
    }
    return JsonResponse(result)


def chart_pie(request):
    """构造饼图"""
    db_data_list = [
        {"value": 1048, "name": 'IT部门'},
        {"value": 735, "name": '新媒体部门'},
        {"value": 580, "name": '运营部门'},
        {"value": 484, "name": '集成电路设计部门'},
        {"value": 300, "name": 'AI部门'}
    ]

    result = {
        "status": True,
        "data": db_data_list
    }

    return JsonResponse(result)


def chart_line(request):
    """构造折线图"""
    legend_list = ['成本', '销售额']
    xAxis_list = ['1月', '2月', '3月', '4月', '5月', '6月', '7月']
    series_list = [
        {
            "name": '成本/W',
            "type": 'line',
            "stack": 'Total',
            "data": [120, 132, 101, 134, 90, 230, 210]
        },
        {
            "name": '销售额/W',
            "type": 'line',
            "stack": 'Total',
            "data": [220, 182, 191, 234, 290, 330, 310]
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