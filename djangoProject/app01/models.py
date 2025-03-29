from django.db import models


class Department(models.Model):
    """部门表"""
    # id = models.BigAutoField(verbose_name='ID', primary_key=True)
    # id = models.AutoField(verbose_name='ID', primary_key=True)
    title = models.CharField(verbose_name='标题', max_length=32)
    # 解决ModelForm方式  返回的是对象的问题

    def __str__(self):
        return self.title


class UserInfo(models.Model):
    """员工表"""
    name = models.CharField(verbose_name="姓名", max_length=16)
    password = models.CharField(verbose_name="密码", max_length=64)
    age = models.IntegerField(verbose_name="年龄")
    account = models.DecimalField(verbose_name="账户余额", max_digits=10, decimal_places=2, default=0)
    create_time = models.DateField(verbose_name="入职时间")

    depart_id = models.ForeignKey(verbose_name="部门", to="Department", to_field="id", on_delete=models.CASCADE)

    gender_choices = {
        (1, "男"),
        (2, "女"),
    }
    gender = models.SmallIntegerField(verbose_name="性别", choices=gender_choices)


class PrettyNum(models.Model):
    """靓号管理"""
    mobile = models.CharField(verbose_name="手机号", max_length=11)
    price = models.IntegerField(verbose_name="价格")

    level_choice = (
        (1, "1级"),
        (2, "2级"),
        (3, "3级"),
        (4, "4级"),
    )

    level = models.SmallIntegerField(verbose_name="级别", choices=level_choice, default=1)

    status_choice = {
        (1, "已用"),
        (2, "未占用")
    }

    status = models.SmallIntegerField(verbose_name="状态", choices=status_choice, default=2)


class Admin(models.Model):
    """管理员"""
    username = models.CharField(verbose_name="用户名", max_length=32)
    password = models.CharField(verbose_name="密码", max_length=64)

    def __str__(self):
        return self.username


class Task(models.Model):
    """任务"""
    level_choices = (
        (1, "紧急"),
        (2, "重要"),
        (3, "临时"),
    )
    level = models.SmallIntegerField(verbose_name="级别", choices=level_choices, default=3)
    title = models.CharField(verbose_name="标题", max_length=64)
    detail = models.TextField(verbose_name="详细信息")
    user = models.ForeignKey(verbose_name="负责人", to="Admin", on_delete=models.CASCADE)


class Order(models.Model):
    """订单"""
    oid = models.CharField(verbose_name="订单号", max_length=64)
    title = models.CharField(verbose_name="名称", max_length=32)
    price = models.IntegerField(verbose_name="价格")

    status_choices = {
        (1, "待支付"),
        (2, "已支付"),
    }
    status = models.SmallIntegerField(verbose_name="状态", choices=status_choices, default=1)
    admin = models.ForeignKey(verbose_name="管理员", to="Admin", on_delete=models.CASCADE)


class Iot01(models.Model):
    """物联网数据"""
    Temp = models.DecimalField(verbose_name="温度", max_digits=10, decimal_places=2, default=0)
    Hum = models.DecimalField(verbose_name="湿度", max_digits=10, decimal_places=2, default=0)
    PM = models.DecimalField(verbose_name="PM", max_digits=10, decimal_places=2, default=0)


class Iot02(models.Model):
    """物联网数据"""
    CO = models.DecimalField(verbose_name="CO浓度", max_digits=10, decimal_places=2, default=0)
    CO2 = models.DecimalField(verbose_name="CO2浓度", max_digits=10, decimal_places=2, default=0)
    SO2 = models.DecimalField(verbose_name="SO2浓度", max_digits=10, decimal_places=2, default=0)
    NO2 = models.DecimalField(verbose_name="NO2浓度", max_digits=10, decimal_places=2, default=0)


class Iot03(models.Model):
    """物联网数据"""
    WS = models.DecimalField(verbose_name="风速", max_digits=10, decimal_places=2, default=0)
    WD = models.DecimalField(verbose_name="风向", max_digits=10, decimal_places=2, default=0)


class Equipment(models.Model):
    """设备列表"""
    MAC = models.IntegerField(verbose_name="MAC地址")
    title = models.CharField(verbose_name="名称", max_length=32)
    detail = models.TextField(verbose_name="详细信息")

    status_choice = {
        (1, "已连接"),
        (2, "未连接")
    }

    status = models.SmallIntegerField(verbose_name="状态", choices=status_choice, default=2)
