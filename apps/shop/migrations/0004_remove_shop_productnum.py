# Generated by Django 2.0.1 on 2018-12-19 04:13

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0003_auto_20181219_0406'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='shop',
            name='ProductNum',
        ),
    ]
