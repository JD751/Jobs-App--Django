# Generated by Django 4.1.3 on 2023-01-11 12:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0013_alter_jobpost_type'),
    ]

    operations = [
        migrations.AlterField(
            model_name='jobpost',
            name='type',
            field=models.CharField(choices=[('Full Time', 'Full Time'), ('Part Time', 'Part Time')], default='Full Time', max_length=200),
        ),
    ]
