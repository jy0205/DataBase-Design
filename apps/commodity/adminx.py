import xadmin
from .models import Product, BannerImage


class ManageProduct(object):
    list_display = ['ProductName', 'ProductInfo', 'DealNum', 'price', 'tag']
    search_fields = ['ProductName', 'ProductInfo', 'DealNum', 'price', 'tag']
    list_filter = ['ProductName', 'ProductInfo', 'DealNum', 'price', 'tag']
    style_fields = {'ProductInfo': 'ueditor'}


class ManageBannerImage(object):
    list_display = ['ImageTitle', 'image', 'url', 'index', 'add_time']
    search_fields = ['ImageTitle', 'image', 'url', 'index']
    list_filter = ['ImageTitle', 'image', 'url', 'index', 'add_time']


xadmin.site.register(Product, ManageProduct)
xadmin.site.register(BannerImage, ManageBannerImage)
