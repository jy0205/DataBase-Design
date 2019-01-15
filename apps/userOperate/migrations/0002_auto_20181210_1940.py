# Generated by Django 2.0.1 on 2018-12-10 19:40

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('userOperate', '0001_initial'),
        ('commodity', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.AddField(
            model_name='userlove',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='用户'),
        ),
        migrations.AddField(
            model_name='usercomments',
            name='product',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='commodity.Product', verbose_name='评论商品'),
        ),
        migrations.AddField(
            model_name='usercomments',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='用户'),
        ),
        migrations.AddField(
            model_name='userbuy',
            name='product',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='commodity.Product', verbose_name='商品'),
        ),
        migrations.AddField(
            model_name='userbuy',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='用户'),
        ),
    ]