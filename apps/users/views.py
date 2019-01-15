from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse
from pure_pagination import Paginator, PageNotAnInteger
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.contrib.auth.hashers import make_password
from django.db.models import Q
from django.views.generic.base import View
from commodity.models import Product, BannerImage
from userOperate.models import UserBuy, UserLove, UserMessage
from shop.models import Shop, Brand
from .models import UserInfo, VerifyCode
from .forms import UserLoginForm, UserRegisterForm, UserActiveForm, ForgetPassWordForm, \
    ModifyPassWordForm, ModifyUserImageForm, ModifyUserInfoForm
from MyEmail import email_send
import json


class UserLoginView(View):
    def get(self, request):
        redirect_url = request.GET.get('next', '')
        return render(request, "login.html", {"redirect_url": redirect_url})

    def post(self, request):
        login_form = UserLoginForm(request.POST)
        if login_form.is_valid():
            user_name = request.POST.get("username", "")
            pass_word = request.POST.get("password", "")
            user = authenticate(username=user_name, password=pass_word)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    redirect_url = request.POST.get('next', '')
                    if redirect_url:
                        return HttpResponseRedirect(redirect_url)
                    return HttpResponseRedirect(reverse("index"))
                else:
                    return render(request, "login.html", {"msg": "用户未激活! "})
            else:
                return render(request, "login.html", {"msg": "用户名或密码错误!"})
        else:
            return render(request, "login.html", {"login_form": login_form})


class UserRegisterView(View):
    def get(self, request):
        register_form = UserRegisterForm()
        return render(request, "register.html", {'register_form': register_form})

    def post(self, request):
        register_form = UserRegisterForm(request.POST)
        if register_form.is_valid():
            user_name = request.POST.get("email", "")
            if UserInfo.objects.filter(email=user_name):
                return render(request, "register.html", {"register_form": register_form, "msg": "用户已存在"})
            pass_word = request.POST.get("password", "")
            user_info = UserInfo()
            user_info.username = user_name
            user_info.email = user_name
            user_info.is_active = False
            user_info.password = make_password(pass_word)
            user_info.save()
            user_message = UserMessage()
            user_message.user = user_info.id
            user_message.message = "欢迎注册成为淘淘乐用户! --系统自动消息"
            user_message.save()
            email_send(user_name, "register")
            return render(request, "login.html", )
        else:
            return render(request, "register.html", {"register_form": register_form})


class UserActiveView(View):
    def get(self, request, active_code):
        all_record = VerifyCode.objects.filter(code=active_code)
        active_form = UserActiveForm(request.GET)
        if all_record:
            for record in all_record:
                email = record.email
                user = UserInfo.objects.get(email=email)
                user.is_active = True
                user.save()
                return render(request, "login.html", )
        else:
            return render(
                request, "register.html", {"msg": "您的激活链接无效", "active_form": active_form})


class CustomBackend(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserInfo.objects.get(
                Q(username=username) | Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class UserLogoutView(View):
    def get(self, request):
        logout(request)
        return HttpResponseRedirect(reverse("index"))


class ForgetPassWordView(View):
    def get(self, request):
        active_form = UserActiveForm(request.POST)
        return render(request, "forgetpwd.html", {"active_form": active_form})

    def post(self, request):
        forget_form = ForgetPassWordForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get("email", "")
            email_send(email, "forget")
            return render(request, "login.html", {"msg": "重置密码邮件已发送,请注意查收"})
        else:
            return render(request, "forgetpwd.html", {"forget_from": forget_form})


class ResetView(View):
    def get(self, request, active_code):
        all_record = VerifyCode.objects.filter(code=active_code)
        active_form = UserActiveForm(request.GET)
        if all_record:
            for record in all_record:
                email = record.email
                return render(request, "password_reset.html", {"active_code": active_code})
        else:
            return render(
                request, "forgetpwd.html", {
                    "msg": "您的重置密码链接无效,请重新请求", "active_form": active_form})


class ModifyPwdView(View):
    def post(self, request):
        modifypwd_form = ModifyPassWordForm(request.POST)
        if modifypwd_form.is_valid():
            pwd1 = request.POST.get("password1", "")
            pwd2 = request.POST.get("password2", "")
            active_code = request.POST.get("active_code", "")
            email = request.POST.get("email", "")
            if pwd1 != pwd2:
                return render(
                    request, "password_reset.html", {
                        "email": email, "msg": "密码不一致"})
            all_record = VerifyCode.objects.filter(code=active_code)
            for record in all_record:
                email = record.email
            user = UserInfo.objects.get(email=email)
            user.password = make_password(pwd2)
            user.save()
            return render(request, "login.html", {"msg": "密码修改成功，请登录"})
        else:
            email = request.POST.get("email", "")
            return render(
                request, "password_reset.html", {
                    "email": email, "modifypwd_form": modifypwd_form})


class UserInfoView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request):
        return render(request, "usercenter-info.html", {})

    def post(self, request):
        user_info_form = ModifyUserInfoForm(request.POST, instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            return HttpResponse(
                '{"status":"success"}',
                content_type='application/json')
        else:
            return HttpResponse(
                json.dumps(
                    user_info_form.errors),
                content_type='application/json')


class UploadImageView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def post(self, request):
        image_form = ModifyUserImageForm(
            request.POST, request.FILES, instance=request.user)
        if image_form.is_valid():
            image_form.save()
            return HttpResponse(
                '{"status":"success"}',
                content_type='application/json')
        else:
            return HttpResponse(
                '{"status":"fail"}',
                content_type='application/json')


class UpdatePwdView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def post(self, request):
        modify_form = ModifyPassWordForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get("password1", "")
            pwd2 = request.POST.get("password2", "")
            if pwd1 != pwd2:
                return HttpResponse(
                    '{"status":"fail", "msg":"密码不一致"}',
                    content_type='application/json')
            user = request.user
            user.password = make_password(pwd2)
            user.save()
            return HttpResponse(
                '{"status":"success"}',
                content_type='application/json')
        else:
            return HttpResponse(
                json.dumps(
                    modify_form.errors),
                content_type='application/json')


class SendEmailCodeView(LoginRequiredMixin, View):
    def get(self, request):
        email = request.GET.get("email", "")
        if UserInfo.objects.filter(email=email):
            return HttpResponse(
                '{"email":"邮箱已经存在"}',
                content_type='application/json')
        email_send(email, "update_email")
        return HttpResponse(
            '{"status":"success"}',
            content_type='application/json')


class UpdateEmailView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def post(self, request):
        email = request.POST.get("email", "")
        code = request.POST.get("code", "")

        existed_records = VerifyCode.objects.filter(
            email=email, code=code, emailType='update_email')
        if existed_records:
            user = request.user
            user.email = email
            user.save()
            return HttpResponse(
                '{"status":"success"}',
                content_type='application/json')
        else:
            return HttpResponse(
                '{"email":"验证码无效"}',
                content_type='application/json')


class MyProductView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request):
        user_buy = UserBuy.objects.filter(user=request.user)
        return render(request, "usercenter-mybuy.html", {
            "user_buy":user_buy,
        })


class MyFavShopView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request):
        shop_list = []
        fav_shops = UserLove.objects.filter(user=request.user, LoveType=2)
        for fav_shop in fav_shops:
            shop_id = fav_shop.LoveId
            shop = Shop.objects.get(id=shop_id)
            shop_list.append(shop)
        return render(request, "usercenter-fav-shop.html", {
            "shop_list": shop_list,
        })


class MyFavBrandView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request):
        brand_list = []
        fav_brands = UserLove.objects.filter(user=request.user, LoveType=3)
        for fav_brand in fav_brands:
            brand_id = fav_brand.LoveId
            brand = Brand.objects.get(id=brand_id)
            brand_list.append(brand)
        return render(request, "usercenter-fav-brand.html", {
            "brand_list": brand_list,
        })


class MyFavProductView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request):
        product_list = []
        fav_products = UserLove.objects.filter(user=request.user, LoveType=1)
        for fav_product in fav_products:
            product_id = fav_product.LoveId
            product = Product.objects.get(id=product_id)
            product_list.append(product)
        return render(request, "usercenter-fav-product.html", {
            "product_list": product_list,
        })


class MyMessageView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request):
        all_message = UserMessage.objects.filter(user=request.user.id)
        all_unread_messages = UserMessage.objects.filter(user=request.user.id, haveRead=False)
        for unread_message in all_unread_messages:
            unread_message.haveRead = True
            unread_message.save()
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_message, 4)
        messages = p.page(page)
        return render(request, "usercenter-message.html", {
            "messages": messages,
        })


class IndexView(View):
    def get(self,request):
        all_banner = BannerImage.objects.all().order_by('index')[:5]
        products = Product.objects.filter(IfBanner=False)[:6]
        banner_products = Product.objects.filter(IfBanner=True)[:3]
        shops = Shop.objects.all()[:15]
        return render(request, 'index.html', {
            "all_banner": all_banner,
            "products": products,
            "banner_products": banner_products,
            "shops":shops,
        })
