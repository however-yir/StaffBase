from django.core.exceptions import ValidationError
from django.core.validators import RegexValidator

from django import forms

from app01 import models
from app01.utils.bootstrap import BootStrapModelForm


class UserModelForm(BootStrapModelForm):
    name = forms.CharField(
        min_length=3,
        label="用户名",
        widget=forms.TextInput(attrs={"class": "form-control"})
    )

    class Meta:
        model = models.UserInfo
        fields = ["name", "password", "age", "account", "create_time", "gender", "depart_id"]
    #     widgets = {
    #         "name": forms.TextInput(attrs={"class": "form-control"}),
    #         "password": forms.PasswordInput(attrs={"class": "form-control"})
    #     }
    #
    # def __init__(self, *args, **kwargs):
    #     super().__init__(*args, **kwargs)
    #     for name, field in self.fields.items():
    #         field.widget.attrs = {"class": "form-control", "placeholder": field.label}


class PrettyModelForm(BootStrapModelForm):
    # 后台验证信息 验证方式一
    # 定义字段
    mobile = forms.CharField(
        label="手机号",
        validators=[RegexValidator(r'^1[3-9]\d{9}', '手机号格式错误')]
    )

    # Mate 标签
    # model(模型) = models.PrettyNum（需要读取的表名称，在models.py中）
    # fields = [表中的字段名称]/"__all__"所有
    class Meta:
        # 将models中的某个表实例化为对象
        model = models.PrettyNum
        fields = "__all__"
        # {'mobile': <django.forms.fields.CharField object at 0x0000013311BD25E0>,
        # exclude = ['xx']排除字段

    # def __init__(self, *args, **kwargs):
    #     # super()继承
    #     super().__init__(*args, **kwargs)
    #     for name, field in self.fields.items():
    #         field.widget.attrs = {"class": "form-control", "placeholder": field.label}

    # 验证方法二：钩子方法 clean_字段(self)  清查-clean
    def clean_mobile(self):
        txt_mobile = self.cleaned_data["mobile"]

        if len(txt_mobile) != 11:
            raise ValidationError("格式错误！")

        # 验证通过，用户输入的值返回
        return txt_mobile


class PrettyEditModelForm(BootStrapModelForm):
    # 重新定义字段
    # mobile = forms.CharField(disabled=True, label="手机号")
    mobile = forms.CharField(
        label="手机号",
        validators=[RegexValidator(r'^1[3-9]\d{9}$', '手机号格式错误'), ],
    )

    class Meta:
        # 将models中的某个表实例化为对象
        model = models.PrettyNum
        fields = ['mobile', 'price', 'level', 'status']

    # def __init__(self, *args, **kwargs):
    #     # super()继承
    #     super().__init__(*args, **kwargs)
    #     for name, field in self.fields.items():
    #         field.widget.attrs = {"class": "form-control", "placeholder": field.label}

    # 钩子方法  1.清查字段
    def clean_mobile(self):
        # 2.清查数据
        txt_mobile = self.cleaned_data["mobile"]
        # model 样本
        exists = models.PrettyNum.objects.exclude(id=self.instance.pk).filter(mobile=txt_mobile).exists()

        if exists:
            raise ValidationError("手机号已经存在")

        # 验证通过,用户输入的值返回
        return txt_mobile
# ModelForm
# class UserModelForm(BootStrapModelForm):
#     name = forms.CharField(
#         min_length=3,
#         label="用户名",
#         widget=forms.TextInput(attrs={"class": "form-control"})
#     )
#
#     class Meta:
#         model = models.UserInfo
#         fields = ["name", "password", "age", "account", "create_time", "gender", "depart_id"]
#         # widgets = {
#         #     "name": forms.TextInput(attrs={"class": "form-control"}),
#         #     "password": forms.PasswordInput(attrs={"class": "form-control"})
#         # }
#
#     # def __init__(self, *args, **kwargs):
#     #     super().__init__(*args, **kwargs)
#     #     # 循环找到所有的插件，添加了class=”form-control“
#     #     for name, field in self.fields.items():
#     #         # if name == "password":
#     #         #     continue
#     #         field.widget.attrs = {"class": "form-control", "placeholder": field.label}
#
#
# class PrettyModelForm(BootStrapModelForm):
#     # 后台验证信息 验证方式一
#     # 定义字段
#     # mobile = forms.CharField(
#     #     label="手机号",
#     #     validators=[RegexValidator(r'^1[3-9]\d{9}', '手机号格式错误')]
#     # )
#
#     # Mate 标签
#     # model(模型) = models.PrettyNum（需要读取的表名称，在models.py中）
#     # fields = [表中的字段名称]/"__all__"所有
#     class Meta:
#         # 将models中的某个表实例化为对象
#         model = models.PrettyNum
#         fields = "__all__"
#         # {'mobile': <django.forms.fields.CharField object at 0x0000013311BD25E0>,
#         # exclude = ['xx']排除字段
#
#     # def __init__(self, *args, **kwargs):
#     #     # super()继承
#     #     super().__init__(*args, **kwargs)
#     #     for name, field in self.fields.items():
#     #         field.widget.attrs = {"class": "form-control", "placeholder": field.label}
#
#     # 验证方法二：钩子方法 clean_字段(self)  清查-clean
#     def clean_mobile(self):
#         txt_mobile = self.cleaned_data["mobile"]
#         if len(txt_mobile) != 11:
#             raise ValidationError("格式错误！")
#
#         # 验证通过，用户输入的值返回
#         return txt_mobile
#
#
# class PrettyEditModelForm(BootStrapModelForm):
#     # 重新定义字段
#     # mobile = forms.CharField(disabled=True, label="手机号")
#     mobile = forms.CharField(
#         label="手机号",
#         validators=[RegexValidator(r'^1[3-9]\d{9}$', '手机号格式错误'), ],
#     )
#
#     class Meta:
#         # 将models中的某个表实例化为对象
#         model = models.PrettyNum
#         fields = ['mobile', 'price', 'level', 'status']
#
#     # def __init__(self, *args, **kwargs):
#     #     # super()继承
#     #     super().__init__(*args, **kwargs)
#     #     for name, field in self.fields.items():
#     #         field.widget.attrs = {"class": "form-control", "placeholder": field.label}
#
#     # 钩子方法  1.清查字段
#     def clean_mobile(self):
#         # 2.清查数据
#         txt_mobile = self.cleaned_data["mobile"]
#         # model 样本
#         exists = models.PrettyNum.objects.exclude(id=self.instance.pk).filter(mobile=txt_mobile).exists()
#
#         if exists:
#             raise ValidationError("手机号已经存在")
#
#         # 验证通过,用户输入的值返回
#         return txt_mobile