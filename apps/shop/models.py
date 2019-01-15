from django.db import models
from DjangoUeditor.models import UEditorField
from datetime import datetime


class City(models.Model):
    CityName = models.CharField(max_length=20, verbose_name=u"城市")

    class Meta:
        verbose_name = u"城市"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.CityName


class SaleKind(models.Model):
    KindName = models.CharField(max_length=10, verbose_name=u'商品种类')

    class Meta:
        verbose_name = u"商品种类"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.KindName


class Shop(models.Model):
    ShopName = models.CharField(max_length=50, verbose_name=u"商家名称")
    ShopDesc = UEditorField(verbose_name=u'店铺详情介绍',width=600, height=300,
                               imagePath="shop/ueditor/", filePath="shop/ueditor/", default='')
    ShopKindChoice = (("Personal", u"个人店铺"), ("BrandShop", u"品牌直营"), ("official", u"官方自营"))
    ShopKind = models.CharField(max_length=20, choices=ShopKindChoice, verbose_name=u"商家类别")  # 表示是个人店铺还是认证店铺
    ShopTag = models.CharField(max_length=20, verbose_name=u"商家标签") # 商家的短标签描述
    ClickNum = models.IntegerField(default=0, verbose_name=u'点击量')
    LikeNum = models.IntegerField(default=0, verbose_name=u'喜欢人数')
    ShopImage = models.ImageField(upload_to='shop/%Y/%m',verbose_name=u'店铺封面图',max_length=100)
    Location = models.ForeignKey(City, on_delete=models.CASCADE, verbose_name=u"店家所在地")
    address = models.CharField(max_length=100,verbose_name=u'商家地址',default='')
    ShopDate = models.DateTimeField(default=datetime.now, verbose_name=u"店铺添加时间")
    DealNum = models.IntegerField(default=0, verbose_name=u'交易成功数')

    class Meta:
        verbose_name = u"店铺"
        verbose_name_plural = verbose_name

    def __str__(self):
        return "店铺: {0}".format(self.ShopName)


class Brand(models.Model):
    shop = models.ForeignKey(Shop,verbose_name=u'店铺', on_delete=models.CASCADE)
    BrandName = models.CharField(max_length=50, verbose_name=u"品牌名称")
    BrandDesc = models.CharField(max_length=300, default='', verbose_name=u"品牌描述")
    ClickNum = models.IntegerField(default=0, verbose_name=u'点击量')
    Category = models.ForeignKey(SaleKind, on_delete=models.CASCADE, verbose_name=u"售卖种类")
    LikeNum = models.IntegerField(default=0, verbose_name=u'喜欢人数')
    BrandImage = models.ImageField(upload_to='brand/%Y/%m', verbose_name=u'品牌logo', max_length=100)
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")
    feature = models.CharField(max_length=50, verbose_name=u"品牌特点")

    class Meta:
        verbose_name = u"品牌"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.BrandName


class BrandToShop(models.Model):
    BrandName = models.ForeignKey(Brand, on_delete=models.CASCADE, verbose_name=u"商家拥有的品牌名")
    ShopName = models.ForeignKey(Shop, on_delete=models.CASCADE, verbose_name=u"品牌属于的商家名")

    class Meta:
        verbose_name = u"品牌店铺关系"
        verbose_name_plural = verbose_name

    def __str__(self):
        return "店铺{0}售卖品牌{1}".format(self.ShopName, self.BrandName)


class KindToShop(models.Model):
    KindName = models.ForeignKey(SaleKind, on_delete=models.CASCADE, verbose_name=u"商家拥有的产品种类")
    ShopName = models.ForeignKey(Shop, on_delete=models.CASCADE, verbose_name=u"产品种类属于的商家名")

    class Meta:
        verbose_name = u"商品种类店铺关系"
        verbose_name_plural = verbose_name

    def __str__(self):
        return "店铺{0}售卖产品种类{1}".format(self.ShopName, self.KindName)
