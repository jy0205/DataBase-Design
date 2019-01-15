from .views import ProductListView, ProductDetailView, AddCommentsView
from django.urls import path, re_path

app_name = "commodity"

urlpatterns = [
    path('list/', ProductListView.as_view(), name="list"),
    re_path('detail/(?P<product_id>\d+)/', ProductDetailView.as_view(), name="product_detail"),
    path('add_comment/', AddCommentsView.as_view(), name="add_comment"),
]
