# Generated by Django 4.1.3 on 2023-02-07 12:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('subscribe', '0007_auto_20230120_1346'),
    ]

    operations = [
        migrations.AlterField(
            model_name='subscribe',
            name='email',
            field=models.EmailField(max_length=50),
        ),
        migrations.AlterField(
            model_name='subscribe',
            name='first_name',
            field=models.CharField(max_length=50),
        ),
        migrations.AlterField(
            model_name='subscribe',
            name='last_name',
            field=models.CharField(max_length=50),
        ),
    ]
