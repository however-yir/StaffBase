from django.shortcuts import render, redirect

from app01 import models
from app01.utils.pagination import Pagination
from app01.utils.form import UserModelForm, PrettyModelForm, PrettyEditModelForm


def user_list(request):
    """用户管理"""
    # 获取所有用户列表[obj,obj,obj]
    queryset = models.UserInfo.objects.all()
    # """
    # for obj in queryset:
    #     # 获取数据库中的choices方法 obj.get_数据名称_display()
    #     # obj.depart_id_id    获取数据库中的那个字段值
    #     # obj.depart_id.title  根据ID自动去关联的表中获取哪一行数据depart对象
    #     print(obj.id, obj.name, obj.account, obj.create_time.strftime("%Y-%m-%d"), obj.get_gender_display(), obj.depart_id_id, obj.depart_id.title)
    #     eg:1 汉朝1 13.12 2001-11-21 男 5 qweq
    # """

    page_object = Pagination(request, queryset, page_size=10)

    context = {
        "queryset": page_object.page_queryset,  # 获取数据
        "page_string": page_object.html(),  # 获取html
    }

    return render(request, "user_list.html", context)


def user_add(request):
    """添加用户"""
    if request.method == "GET":
        context = {
            'gender_choices': models.UserInfo.gender_choices,
            'depart_list': models.Department.objects.all(),
        }
        return render(request, 'user_add.html', context)

    # 获取用户提交的数据
    user = request.POST.get("user")
    pwd = request.POST.get("pwd")
    age = request.POST.get("age")
    account = request.POST.get("ac")
    ctime = request.POST.get("ctime")
    gender_id = request.POST.get("gd")
    depart_id = request.POST.get("dp")

    # 添加到数据库
    models.UserInfo.objects.create(name=user,
                                   password=pwd,
                                   age=age,
                                   account=account,
                                   create_time=ctime,
                                   gender=gender_id,
                                   depart_id_id=depart_id)

    # 返回用户列表页面
    return redirect("/user/list/")


def user_model_form_add(request):
    """添加用户 ModelForm 版本"""
    if request.method == "GET":
        form = UserModelForm()  # 实例化对象
        return render(request, 'user_model_form_add.html', {"form": form})

    # 用户POST提交数据，数据校验
    form = UserModelForm(data=request.POST)
    if form.is_valid():
        # 如果数据合法，保存到数据库
        # print(form.cleaned_data)
        form.save()
        return redirect('/user/list/')

    return render(request, 'user_model_form_add.html', {"form": form})


def user_edit(request, nid):
    """编辑用户"""
    # 根据id去数据库获取要编辑的那一行数据(对象)
    row_object = models.UserInfo.objects.filter(id=nid).first()

    if request.method == "GET":
        form = UserModelForm(instance=row_object)  # 对 实例=？的行进行操作
        return render(request, 'user_edit.html', {"form": form})

    form = UserModelForm(data=request.POST, instance=row_object)
    # 数据校验
    if form.is_valid():
        # 默认保存的是用户输入的所有数据，
        # 如果想要在用户输入以外增加一点值，form.instance.在字段名 = 值
        form.save()
        return redirect('/user/list/')

    # 不合法
    return render(request, 'user_edit.html', {"form": form})


def user_delete(request, nid):
    models.UserInfo.objects.filter(id=nid).delete()
    return redirect('/user/list/')