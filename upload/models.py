from django.db import models

# Create your models here.


class Uploads(models.Model):
    image = models.ImageField(upload_to="images", null=False)
    description = models.CharField(max_length=100, null=False)

    def __str__(self):
        return self.description
