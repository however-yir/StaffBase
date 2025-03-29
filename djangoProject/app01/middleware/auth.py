from django.utils.deprecation import MiddlewareMixin
from django.shortcuts import HttpResponse, redirect


class AuthMiddleware(MiddlewareMixin):
    def process_request(self, request):
        # 0.排除不需要登录的页面
        if request.path_info in ["/login/", "/image/code/"]:
            return
        # 1.读取当前用户的session信息，如果能读到，说明已经登陆过，能读到继续向后执行
        info_dict = request.session.get("info")

        if info_dict:
            return

        # 2.如果没有登录信息，请登录
        return redirect('/login/')