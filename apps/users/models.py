from django.db import models
from datetime import datetime
from django.contrib.auth.models import AbstractUser


class UserInfo(AbstractUser):
    nick_name = models.CharField(max_length=20, verbose_name=u'昵称', default="")
    Age = models.IntegerField(default=0,verbose_name=u'年龄')
    gender = models.CharField(max_length=10, verbose_name=u'性别', choices=(('male', '男'), ('female', '女')),
                              default="")
    mobileNumber = models.CharField(max_length=11, null=True, blank=True, verbose_name=u'电话', default="")
    address = models.CharField(max_length=100, null=True, blank=True, verbose_name=u'地址', default="")
    userImage = models.ImageField(upload_to='image/%Y/%m', max_length=100,
                                  verbose_name=u'头像')

    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username

    def unread_nums(self):
        from userOperate.models import UserMessage
        return UserMessage.objects.filter(haveRead=False, user=self.id).count()


class VerifyCode(models.Model):
    code = models.CharField(max_length=30,verbose_name=u'验证码')
    email = models.EmailField(max_length=60,verbose_name=u'邮箱')
    VerifyKind = (('register', u'注册'), ('forget', u'忘记密码'), ("ModifyEmail", u"修改邮箱"))
    sendTime = models.DateTimeField(verbose_name=u'发送时间', default=datetime.now)
    emailType = models.CharField(verbose_name=u'邮件类型', max_length=20, choices=VerifyKind)

    class Meta:
        verbose_name = '用户验证码'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}({1})'.format(self.code, self.email)

