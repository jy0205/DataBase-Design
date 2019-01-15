from .views import ShopView, ShopHomeView, ShopProductView, ShopBrandView, \
    AddFavView, BrandListView, BrandDetailView, BuyProductView
from django.urls import path, re_path

app_name = "shop"

urlpatterns = [
    path('list/', ShopView.as_view(), name="shop_list"),
    re_path('home/(?P<shop_id>\d+)/', ShopHomeView.as_view(), name="shop_home"),
    re_path('product/(?P<shop_id>\d+)/', ShopProductView.as_view(), name="shop_product"),
    re_path('shop_brand/(?P<shop_id>\d+)/', ShopBrandView.as_view(), name="shop_brand"),
    path('buy_product/', BuyProductView.as_view(), name="buy_product"),
    path('brand/list/', BrandListView.as_view(), name="brand_list"),
    path('add_fav/', AddFavView.as_view(), name="add_fav"),
    re_path('brand/detail/(?P<brand_id>\d+)/', BrandDetailView.as_view(), name="brand_detail"),
]