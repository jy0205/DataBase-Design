import xadmin
from .models import City, SaleKind, Shop, Brand, BrandToShop, KindToShop


class ManageCity(object):
    list_display = ['CityName']
    search_fields = ['CityName']
    list_filter = ['CityName']


class ManageSaleKind(object):
    list_display = ['KindName']
    search_fields = ['KindName']
    list_filter = ['KindName']


class ManageShop(object):
    list_display = ['ShopName', 'ShopDesc', 'ShopKind',  'ClickNum', 'LikeNum', 'ShopDate']
    search_fields = ['ShopName', 'ShopDesc', 'ShopKind',  'ClickNum', 'LikeNum']
    list_filter = ['ShopName', 'ShopDesc', 'ShopKind', 'ClickNum', 'LikeNum', 'ShopDate', 'Location']
    style_fields = {'ShopDesc': 'ueditor'}


class ManageBrand(object):
    list_display = ['BrandName', 'BrandDesc', 'feature', 'ClickNum', 'LikeNum', 'add_time']
    search_fields = ['BrandName', 'BrandDesc', 'feature', 'ClickNum', 'LikeNum', 'add_time']
    list_filter = ['BrandName', 'BrandDesc', 'feature', 'ClickNum', 'LikeNum', 'add_time']


class ManageBrandToShop(object):
    list_display = ['BrandName', 'ShopName']
    search_fields = ['BrandName', 'ShopName']
    list_filter = ['BrandName', 'ShopName']


class ManageKindToShop(object):
    list_display = ['KindName', 'ShopName']
    search_fields = ['KindName', 'ShopName']
    list_filter = ['KindName', 'ShopName']


xadmin.site.register(City, ManageCity)
xadmin.site.register(SaleKind, ManageSaleKind)
xadmin.site.register(Shop, ManageShop)
xadmin.site.register(Brand, ManageBrand)
xadmin.site.register(BrandToShop, ManageBrandToShop)
xadmin.site.register(KindToShop, ManageKindToShop)
