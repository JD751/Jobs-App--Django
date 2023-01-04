from django.db import models
from django.utils.text import slugify

# Create your models here.


class Skills(models.Model):
    # TODO: Is that possible to have a first_name of 200 chars?
    #   Can a name be null? What would be the goal of an entry without name?
    name = models.CharField(max_length=200, null=True)


class Location(models.Model):
    # TODO: Is that possible to have a first_name of 200 chars?
    street = models.CharField(max_length=200)
    # TODO: Is that possible to have a first_name of 200 chars?
    city = models.CharField(max_length=200)
    # TODO: Is that possible to have a first_name of 200 chars?
    state = models.CharField(max_length=200)
    # TODO: Is that possible to have a first_name of 200 chars?
    country = models.CharField(max_length=200)
    # TODO: Is zip an integer or CharField?
    zip = models.IntegerField()

    def __str__(self):
        return self.city


class Author(models.Model):
    # TODO: Is that possible to have a first_name of 200 chars?
    name = models.CharField(max_length=200)
    company = models.CharField(max_length=200)
    designation = models.CharField(max_length=200)


class JobPost (models.Model):
    JOB_TYPE_CHOICES= [
    ('Full Time', 'Full Time'),
    ('Part Time', 'Part Time')

    ]
    title = models.CharField(max_length=200)
    description = models.TextField()
    date = models.DateTimeField(auto_now_add=True)
    salary = models.IntegerField()
    # slugfield has a max length of 50 characters
    slug = models.SlugField(null=True, max_length=40, unique=True)
    type = models.CharField(max_length=200, default= 'Full Time' , choices=JOB_TYPE_CHOICES)
 # indexing helps differentiating objects so no two objects have the same index
    Location = models.OneToOneField(
        Location, on_delete=models.CASCADE, null=True)
    author = models.ForeignKey(Author, on_delete=models.CASCADE, null=True)
    skills = models.ManyToManyField(
        Skills) # if there's no foreign key than you shouldn't use on_delete command

    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        if not self.id:  # don't allow slugs to be updated after the initial setup
            self.slug = slugify(self.title)
        return super(JobPost, self).save(*args, **kwargs)
