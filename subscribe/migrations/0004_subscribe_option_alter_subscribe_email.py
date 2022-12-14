# Generated by Django 4.1.3 on 2022-12-28 12:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('subscribe', '0003_remove_subscribe_user_name'),
    ]

    operations = [
        migrations.AddField(
            model_name='subscribe',
            name='option',
            field=models.CharField(choices=[('W', 'Weekly'), ('M', 'Monthly')], default='W', max_length=2),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='subscribe',
            name='email',
            field=models.EmailField(max_length=100),
        ),
    ]
