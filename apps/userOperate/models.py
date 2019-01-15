from django.db import models
from datetime import datetime
from users.models import UserInfo
from commodity.models import Product


class UserBuy(models.Model):
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE, verbose_name=u"用户")
    product = models.ForeignKey(Product, on_delete=models.CASCADE, verbose_name=u"商品")
    BuyTime = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"用户购买"
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}购买了{1} '.format(self.user, self.product)


class UserComments(models.Model):
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE, verbose_name=u"用户")
    product = models.ForeignKey(Product, on_delete=models.CASCADE, verbose_name=u"评论商品")
    comments = models.CharField(max_length=250, verbose_name=u"用户评论")
    CommentTime = models.DateTimeField(default=datetime.now, verbose_name=u"评论时间")

    class Meta:
        verbose_name = u"商品评论"
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}评论了{1} '.format(self.user, self.product)


class UserLove(models.Model):
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE, verbose_name=u"用户")
    LoveId = models.IntegerField(default=0,verbose_name=u"收藏id")
    LoveKind = ((1, u"商品"), (2, u"店铺"), (3, u"品牌"))
    LoveType = models.IntegerField(choices=LoveKind,default=1,verbose_name=u"收藏类型")
    LoveTime = models.DateTimeField(default=datetime.now, verbose_name=u"收藏时间")

    class Meta:
        verbose_name = u"用户收藏"
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}收藏了{1} '.format(self.user, self.LoveType)


class UserMessage(models.Model):
    user = models.IntegerField(default=0, verbose_name=u"接收用户")
    message = models.CharField(max_length=300, verbose_name=u"消息内容")
    haveRead = models.BooleanField(default=False, verbose_name=u"是否已读")
    SendTime = models.DateTimeField(default=datetime.now, verbose_name=u"发送时间")

    class Meta:
        verbose_name = u"用户消息"
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}收到消息{1} '.format(self.user, self.message)






