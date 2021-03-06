"""Mxonline3 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
import xadmin
from django.urls import path, include, re_path
from django.views.static import serve
from MyWeb.settings import MEDIA_ROOT
from users.views import UserLoginView, UserRegisterView, UserActiveView, ForgetPassWordView, ResetView, ModifyPwdView, \
    UserLogoutView, IndexView

urlpatterns = [
    path('xadmin/', xadmin.site.urls),
    path('', IndexView.as_view(), name=  "index"),
    path('login/', UserLoginView.as_view(), name="login"),
    path('logout/', UserLogoutView.as_view(), name="logout"),
    path("register/", UserRegisterView.as_view(), name="register" ),
    path("captcha/", include('captcha.urls')),
    re_path('active/(?P<active_code>.*)/', UserActiveView.as_view(), name="user_active"),
    path('forget/', ForgetPassWordView.as_view(), name= "forget_pwd"),
    re_path('reset/(?P<active_code>.*)/', ResetView.as_view(), name="reset_pwd"),
    path('modify_pwd/', ModifyPwdView.as_view(), name="modify_pwd"),
    path("shop/", include('shop.urls', namespace='shop')),
    re_path('media/(?P<path>.*)', serve, {"document_root": MEDIA_ROOT }),
    path("product/", include('commodity.urls', namespace="product")),
    path("users/", include('users.urls', namespace="users")),
    path('ueditor/', include('DjangoUeditor.urls')),
]
