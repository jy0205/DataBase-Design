# Generated by Django 2.0.1 on 2018-12-18 03:38

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('commodity', '0003_remove_product_productdesc'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='product',
            name='Apply',
        ),
    ]