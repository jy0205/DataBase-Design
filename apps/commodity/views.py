from django.db.models import Q
from django.http import HttpResponse
from django.shortcuts import render
from django.views.generic.base import View
from pure_pagination import Paginator, PageNotAnInteger
from .models import Product
from userOperate.models import UserLove, UserComments
from shop.models import SaleKind


class ProductListView(View):
    def get(self, request):
        all_product = Product.objects.all()
        hot_products = Product.objects.all().order_by("-DealNum")[:3]
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_product = all_product.filter(Q(name__icontains=search_keywords) | Q(desc__icontains=search_keywords) | Q(
                detail__icontains=search_keywords))
        all_kind = SaleKind.objects.all()
        kind_id = request.GET.get('kind', "")
        if kind_id:
            all_product = all_product.filter(Category_id=int(kind_id))
        sort = request.GET.get('sort', "")
        if sort:
            if sort == "DealNum":
                all_product = all_product.order_by("-DealNum")
            elif sort == "hot":
                all_product = all_product.order_by("-ClickNum")
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_product, 6, request=request)
        products = p.page(page)
        return render(request, "product-list.html", {
            "all_product": products,
            "all_kind": all_kind,
            "kind_id": kind_id,
            "sort": sort,
            "hot_products": hot_products,
            "search_keywords": search_keywords
        })


class ProductDetailView(View):
    def get(self, request, product_id):
        product = Product.objects.get(id = int(product_id))
        product.ClickNum += 1
        product.save()
        has_fav_product = False
        has_fav_shop = False
        all_comments = UserComments.objects.filter(product=product).order_by("-CommentTime")
        if request.user.is_authenticated:
            if UserLove.objects.filter(user=request.user, LoveId=product.id, LoveType=1):
                has_fav_product = True
            if UserLove.objects.filter(user=request.user, LoveId=product.product_shop.id, LoveType=2):
                has_fav_shop = True
        tag = product.tag
        if tag:
            relate_products = Product.objects.filter(tag=tag)[1:2]
        else:
            relate_products = []
        return render(request, "product-detail.html", {
            "product":product,
            "all_comments": all_comments,
            "relate_products": relate_products,
            "has_fav_product": has_fav_product,
            "has_fav_shop": has_fav_shop,
        })


class AddCommentsView(View):
    def post(self, request):
        if not request.user.is_authenticated:
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}', content_type='application/json')
        product_id = request.POST.get("product_id", 0)
        comments = request.POST.get("comments", "")
        if int(product_id) > 0 and comments:
            product_comments = UserComments()
            product = Product.objects.get(id=int(product_id))
            product_comments.product = product
            product_comments.comments = comments
            product_comments.user = request.user
            product_comments.save()
            return HttpResponse('{"status":"success", "msg":"评论成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"评论失败"}', content_type='application/json')
