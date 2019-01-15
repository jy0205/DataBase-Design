import xadmin
from .models import UserBuy, UserComments, UserLove, UserMessage


class ManageUserBuy(object):
    list_display = ['user', 'product', 'BuyTime']
    search_fields = ['user', 'product']
    list_filter = ['user', 'product', 'BuyTime']


class ManageUserComments(object):
    list_display = ['user', 'product', 'comments', 'CommentTime']
    search_fields = ['user', 'product', 'comments']
    list_filter = ['user', 'product', 'comments', 'CommentTime']


class ManageUserLove(object):
    list_display = ['user', 'LoveId', 'LoveType', 'LoveTime']
    search_fields = ['user', 'LoveId', 'LoveType']
    list_filter = ['user', 'LoveId', 'LoveType', 'LoveTime']


class ManageUserMessage(object):
    list_display = ['user', 'message', 'haveRead', 'SendTime']
    search_fields = ['user', 'message', 'haveRead']
    list_filter = ['user', 'message', 'haveRead', 'SendTime']


xadmin.site.register(UserBuy, ManageUserBuy)
xadmin.site.register(UserComments, ManageUserComments)
xadmin.site.register(UserLove, ManageUserLove)
xadmin.site.register(UserMessage, ManageUserMessage)