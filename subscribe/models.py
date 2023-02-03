from django.db import models

NEWSLETTER_OPTION = [
    ('W', 'Weekly'),
    ('M', 'Monthly')
]

# Create your models here.
class Subscribe(models.Model):
    first_name= models.CharField( max_length=50)
    last_name= models.CharField( max_length=50)
    email= models.EmailField( max_length=50)
    option= models.CharField( max_length=2, choices=NEWSLETTER_OPTION, default="M")
    # the changes done at frontend both in terms of validation or default option would be reflected on the admin panel