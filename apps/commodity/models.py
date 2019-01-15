from django.db import models
from DjangoUeditor.models import UEditorField
from shop.models import Shop, Brand, SaleKind
from datetime import datetime


class Product(models.Model):
    product_shop = models.ForeignKey(Shop, on_delete=models.CASCADE, verbose_name=u"所属店铺", null=True, blank=True)
    product_brand = models.ForeignKey(Brand, on_delete=models.CASCADE, verbose_name=u"所属品牌", null=True, blank=True)
    ProductName = models.CharField(max_length=100,verbose_name=u'商品名')
    ProductInfo = UEditorField(verbose_name=u'商品详情介绍',width=600, height=300,
                               imagePath="commodity/ueditor/", filePath="commodity/ueditor/",default='')
    price = models.IntegerField(verbose_name=u'价格', default=0,)
    Category = models.ForeignKey(SaleKind, on_delete=models.CASCADE, verbose_name=u'商品种类')
    DealNum = models.IntegerField(default=0,verbose_name=u'交易成功数')
    LikeNum = models.IntegerField(default=0,verbose_name=u'喜欢人数')
    you_must_know = models.CharField(max_length=300, default=u'无', verbose_name=u"店家提醒")
    ProductImage = models.ImageField(upload_to='commodity/%Y/%m',verbose_name=u'商品封面图',max_length=100)
    ClickNum = models.IntegerField(default=0,verbose_name=u'点击量')
    tag = models.CharField(max_length=15, verbose_name=u"商品标签", default=u"")
    ProductDate = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")
    RemainNum = models.IntegerField(default=0, verbose_name=u"剩余数量")
    IfBanner = models.BooleanField(default=False, verbose_name=u"是否轮播")

    class Meta:
        verbose_name = u'商品'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.ProductName


class BannerImage(models.Model):
    ImageTitle = models.CharField(max_length=100, verbose_name=u"标题")
    image = models.ImageField(upload_to="banner/%Y/%m",verbose_name=u"网站轮播图",max_length=100)
    url = models.URLField(max_length=200, verbose_name=u"访问地址")
    index = models.IntegerField(default=100, verbose_name=u"顺序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"轮播图"
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}(位于第{1}位)'.format(self.ImageTitle, self.index)

