from django.shortcuts import render, redirect

from app01 import models
from app01.utils.pagination import Pagination
from app01.utils.form import UserModelForm, PrettyModelForm, PrettyEditModelForm


def pretty_list(request):
    """靓号列表"""
    # 创建一个空字典
    data_dict = {}
    # get方法获取q=?的值，默认是空default=”“
    search_data = request.GET.get(key='q', default="")

    if search_data:
        # 创建字典元素
        data_dict["mobile__contains"] = search_data

    queryset = models.PrettyNum.objects.filter(**data_dict).order_by("-level")

    page_object = Pagination(request, queryset)
    page_queryset = page_object.page_queryset
    page_string = page_object.html()

    context = {
        "queryset": page_queryset,
        "search_data": search_data,
        "page_string": page_string
    }

    return render(request, 'pretty_list.html', context)


def pretty_add(request):
    """靓号添加"""
    if request.method == "GET":
        # 实例化类对象 返回值是HTML标签
        form = PrettyModelForm()
        # print(form)
        # <option value="1" selected>1级</option>
        return render(request, 'pretty_add.html', {"form": form})

    form = PrettyModelForm(data=request.POST)
    if form.is_valid():
        form.save()
        return redirect("/pretty/list/")
    return render(request, 'pretty_add.html', {"form": form})


def pretty_edit(request, nid):
    """编辑靓号"""
    row_obj = models.PrettyNum.objects.filter(id=nid).first()
    print(row_obj)
    if request.method == "GET":
        form = PrettyEditModelForm(instance=row_obj)
        return render(request, 'pretty_edit.html', {'form': form})

    form = PrettyEditModelForm(data=request.POST, instance=row_obj)
    if form.is_valid():
        form.save()
        return redirect('/pretty/list/')

    return render(request, 'pretty_edit.html', {'form': form})


def pretty_delete(request, nid):
    models.PrettyNum.objects.filter(id=nid).delete()
    return redirect('/pretty/list/')