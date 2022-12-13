from django.db import models
from django.utils.text import slugify

# Create your models here.

class Location(models.Model):
        street = models.CharField(max_length=200)
        city = models.CharField(max_length=200)
        state = models.CharField(max_length=200)
        country = models.CharField(max_length=200)
        zip = models.IntegerField()

        def __str__(self):
            return self.city

class JobPost (models.Model):
    title = models.CharField(max_length=200)
    description = models.CharField(max_length=200)
    date = models.DateTimeField(auto_now_add=True)
    salary = models.IntegerField()
    slug = models.SlugField(null=True, max_length=40, unique=True) # slugfield has a max length of 50 characters
 # indexing helps differentiating objects so no two objects have the same index
    Location=models.OneToOneField(Location, on_delete=models.CASCADE ,null=True)

    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        if not self.id:  # don't allow slugs to be updated after the initial setup
            self.slug = slugify(self.title)
        return super(JobPost, self).save(*args, **kwargs)


