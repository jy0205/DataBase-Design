from random import Random
from users.models import VerifyCode
from django.core.mail import send_mail
from MyWeb.settings import EMAIL_FROM


def email_send(email, email_type="register"):
    gen_code = gen_verify_code(15)
    email_code = VerifyCode()
    email_code.code = gen_code
    email_code.email = email
    email_code.send_type = email_type
    email_code.save()
    if email_type == "register":
        email_title = u'淘淘乐注册激活'
        email_body = u'''亲爱的用户！欢迎您注册成为淘淘乐用户，我们拥有最实惠的商品和最贴心地服务，快点击下面的连接加入我们吧!
                     请点击下面的链接激活你的账号: http://127.0.0.1:8000/active/{0}'''.format(gen_code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
    elif email_type == "forget":
        email_title = u'淘淘乐修改密码'
        email_body = u'''亲爱的用户！您即将修改您的淘淘乐账户密码，
                     请点击下面的链接进行验证: http://127.0.0.1:8000/reset/{0}'''.format(gen_code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
    elif email_type == "ModifyEmail":
        email_title = u'淘淘乐修改绑定邮箱'
        email_body = u'''亲爱的用户！您即将修改您的淘淘乐账户绑定邮箱，
                     请点击下面的链接进行验证: http://127.0.0.1:8000/reset/{0}'''.format(gen_code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass


def gen_verify_code(code_length):
    code = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    length = len(chars) - 1
    random = Random()
    for i in range(code_length):
        code += chars[random.randint(0, length)]
    return code
