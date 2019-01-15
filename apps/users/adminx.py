import xadmin
from .models import VerifyCode
from xadmin import views


class MangeVerify(object):
    list_display = ['code', 'email', 'emailType', 'sendTime']
    search_fields = ['code', 'email', 'emailType']
    list_filter = ['code', 'email', 'emailType', 'sendTime']


class ManageTheme(object):
    enable_themes = True
    use_bootswatch = True


class ManageUI(object):
    site_title = u'淘淘乐后台管理界面'
    site_footer = u'jy0205!'
    menu_style = 'accordion'


xadmin.site.register(VerifyCode, MangeVerify)
xadmin.site.register(views.BaseAdminView, ManageTheme)
xadmin.site.register(views.CommAdminView, ManageUI)