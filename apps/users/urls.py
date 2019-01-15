from .views import UserInfoView, UploadImageView, SendEmailCodeView, UpdateEmailView, UpdatePwdView, MyProductView, \
    MyFavShopView, MyFavBrandView, MyFavProductView, MyMessageView
from django.urls import path

app_name = "users"

urlpatterns = [
    path('info/', UserInfoView.as_view(), name="user_info"),
    path('image/upload/', UploadImageView.as_view(), name="image_upload"),
    path('update/pwd/', UpdatePwdView.as_view(), name="update_pwd"),
    path('send_email_code/', SendEmailCodeView.as_view(), name="sendemail_code"),
    path('update_email/', UpdateEmailView.as_view(), name="update_email"),
    path('my_product/', MyProductView.as_view(), name="myproduct"),
    path('my_fav/shop/',MyFavShopView.as_view(), name="myfav_shop"),
    path('my_fav/brand/', MyFavBrandView.as_view(), name="myfav_brand"),
    path('myfav/product/', MyFavProductView.as_view(), name="myfav_product"),
    path('my_message/', MyMessageView.as_view(), name="my_message"),
]
