from django.http import HttpResponse
from django.shortcuts import render
from django.views.generic import View
from commodity.models import Product
from django.db.models import Q
from userOperate.models import UserLove, UserBuy
from .models import Shop, City, Brand, KindToShop, SaleKind
from pure_pagination import Paginator, PageNotAnInteger


class ShopView(View):
    def get(self,request):
        all_shops = Shop.objects.all()
        all_city = City.objects.all()
        hot_shops = all_shops.order_by("-ClickNum")[:3]
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_shops = all_shops.filter(Q(name__icontains=search_keywords) | Q(desc__icontains=search_keywords) | Q(
                address__icontains=search_keywords))
        city_id = request.GET.get('city', "")
        if city_id:
            all_shops = all_shops.filter(Location_id=int(city_id))
        category = request.GET.get('ct', "")
        if category:
            all_shops = all_shops.filter(ShopKind=category)
        all_kind = SaleKind.objects.all()
        kind_id = request.GET.get('kind', "")
        if kind_id:
            this_kind_shops = KindToShop.objects.filter(KindName_id=int(kind_id))
            shop_ids = [this_kind_shop.ShopName_id for this_kind_shop in this_kind_shops]
            all_shops = all_shops.filter(id__in=shop_ids)
        sort = request.GET.get('sort', "")
        if sort:
            if sort == "DealNum":
                all_shops = all_shops.order_by("-DealNum")
            elif sort == "LikeNum":
                all_shops = all_shops.order_by("-LikeNum")
        shop_nums = all_shops.count()
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_shops, 4, request=request)
        shops = p.page(page)
        return render(request, "shop-list.html", {
            "all_shops": shops,
            "all_city": all_city,
            "all_kind": all_kind,
            "shop_nums": shop_nums,
            "city_id": city_id,
            "category": category,
            "kind_id": kind_id,
            "hot_shops": hot_shops,
            "sort": sort,
            "search_keywords": search_keywords,
        })


class ShopHomeView(View):
    def get(self, request, shop_id):
        current_page = "home"
        shop = Shop.objects.get(id=int(shop_id))
        shop.ClickNum += 1
        shop.save()
        has_fav = False
        if request.user.is_authenticated:
            if UserLove.objects.filter(user=request.user, LoveId=shop.id, LoveType=2):
                has_fav = True
        all_products = shop.product_set.all()[:4]
        all_brands = shop.brand_set.all()[:2]

        return render(request, 'shop-detail-homepage.html',{
           'all_products': all_products,
           'all_brands': all_brands,
           'shop': shop,
           'current_page': current_page,
           "has_fav": has_fav
        })


class ShopProductView(View):
    def get(self, request, shop_id):
        current_page = "product"
        shop = Shop.objects.get(id=int(shop_id))
        all_products = shop.product_set.all()
        has_fav = False
        if request.user.is_authenticated:
            if UserLove.objects.filter(user=request.user, LoveId=shop.id, LoveType=2):
                has_fav = True
        return render(request, 'shop-detail-product.html', {
            'all_products': all_products,
            'shop': shop,
            'current_page':current_page,
            "has_fav": has_fav,
        })


class ShopBrandView(View):
    def get(self, request, shop_id):
        current_page = "brand"
        shop = Shop.objects.get(id=int(shop_id))
        all_brands = shop.brand_set.all()
        has_fav = False
        if request.user.is_authenticated:
            if UserLove.objects.filter(user=request.user, LoveId=shop.id, LoveType=2):
                has_fav = True
        return render(request, 'shop-detail-brands.html',{
            'all_brands': all_brands,
            'shop': shop,
            "current_page":current_page,
            "has_fav":has_fav
        })


class AddFavView(View):
    def post(self, request):
        id = request.POST.get('LoveId', 0)
        type = request.POST.get('LoveType', 0)
        if not request.user.is_authenticated:
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}', content_type='application/json')
        exist_records = UserLove.objects.filter(user=request.user, LoveId=int(id), LoveType=int(type))
        if exist_records:
            exist_records.delete()
            if int(type) == 1:
                product = Product.objects.get(id=int(id))
                product.LikeNum -=1
                if product.LikeNum < 0:
                    product.LikeNum = 0
                product.save()
            elif int(type) == 2:
                shop = Shop.objects.get(id=int(id))
                shop.LikeNum -= 1
                if shop.LikeNum < 0:
                    shop.LikeNum = 0
                shop.save()
            elif int(type) == 3:
                brand = Brand.objects.get(id=int(id))
                brand.LikeNum -=1
                if brand.LikeNum < 0:
                    brand.LikeNum = 0
                brand.save()
            return HttpResponse('{"status":"success", "msg":"收藏"}', content_type='application/json')
        else:
            user_fav = UserLove()
            if int(type) > 0 and int(id) > 0:
                user_fav.LoveId = int(id)
                user_fav.LoveType = int(type)
                user_fav.user = request.user
                user_fav.save()

                if int(type) == 1:
                    product = Product.objects.get(id=int(id))
                    product.LikeNum += 1
                    product.save()
                elif int(type) == 2:
                    shop = Shop.objects.get(id=int(id))
                    shop.LikeNum += 1
                    shop.save()
                elif int(type) == 3:
                    brand = Brand.objects.get(id=int(id))
                    brand.LikeNum += 1
                    brand.save()
                return HttpResponse('{"status":"success", "msg":"已收藏"}', content_type='application/json')
            else:
                return HttpResponse('{"status":"fail", "msg":"收藏出错"}', content_type='application/json')


class BuyProductView(View):
    def post(self, request):
        product_id = request.POST.get('productId', 0)
        if not request.user.is_authenticated:
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}', content_type='application/json')
        if int(product_id) > 0:
            product = Product.objects.get(id=int(product_id))
            product.DealNum += 1
            product.RemainNum -= 1;
            product.save()
            user_buy = UserBuy()
            user_buy.user = request.user
            user_buy.product = product
            user_buy.save()
            return HttpResponse('{"status":"success", "msg":"已购买"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"购买出错"}', content_type='application/json')


class BrandListView(View):
        def get(self, request):
            all_brand = Brand.objects.all()
            sort = request.GET.get("sort", "")
            if sort:
                if sort == "hot":
                    all_brand = all_brand.order_by("-ClickNum")

            search_keywords = request.GET.get('keywords', '')
            if search_keywords:
                all_brand = all_brand.filter(
                    Q(name__icontains=search_keywords) | Q(work_company__icontains=search_keywords))

            rank_brand = Brand.objects.all().order_by("-LikeNum")[:5]
            brand_nums = all_brand.count()
            try:
                page = request.GET.get('page', 1)
            except PageNotAnInteger:
                page = 1
            p = Paginator(all_brand, 4, request=request)
            brands = p.page(page)
            return render(request, "brand-list.html", {
                "all_brand": brands,
                "brand_nums": brand_nums,
                "sort": sort,
                "rank_brand": rank_brand,
                "search_keywords": search_keywords,
            })


class BrandDetailView(View):
    def get(self, request, brand_id):
        brand = Brand.objects.get(id=int(brand_id))
        brand.ClickNum += 1
        brand.save()
        all_product = brand.product_set.all()
        rank_brand = Brand.objects.all().order_by("-LikeNum")[:5]
        has_fav_brand = False
        if request.user.is_authenticated:
            if UserLove.objects.filter(user=request.user, LoveType=3, LoveId=brand.id):
                has_fav_brand = True
        has_fav_shop = False
        if request.user.is_authenticated:
            if UserLove.objects.filter(user=request.user, LoveType=2, LoveId= brand.shop.id):
                has_fav_shop = True
        return render(request, "brand-detail.html", {
            "brand":brand,
            "all_product":all_product,
            "rank_brand":rank_brand,
            "has_fav_brand":has_fav_brand,
            "has_fav_shop":has_fav_shop,
        })
