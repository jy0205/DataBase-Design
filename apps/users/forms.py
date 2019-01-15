from users.models import UserInfo
from django import forms
from captcha.fields import CaptchaField


class UserLoginForm(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=6)


class UserRegisterForm(forms.Form):
    email = forms.EmailField(required=True)
    password = forms.CharField(required=True, min_length=6)
    captcha = CaptchaField(error_messages={"invalid": u"输入的验证码错误"})


class UserActiveForm(forms.Form):
    captcha = CaptchaField(error_messages={"invalid": u"输入的验证码错误"})


class ForgetPassWordForm(forms.Form):
    email = forms.EmailField(required=True)
    captcha = CaptchaField(error_messages={"invalid": u"输入的验证码错误"})


class ModifyPassWordForm(forms.Form):
    password1 = forms.CharField(required=True, min_length=6)
    password2 = forms.CharField(required=True, min_length=6)


class ModifyUserImageForm(forms.ModelForm):
    class Meta:
        model = UserInfo
        fields = ['userImage']


class ModifyUserInfoForm(forms.ModelForm):
    class Meta:
        model = UserInfo
        fields = ['nick_name', 'Age', 'gender', 'address', 'mobileNumber']