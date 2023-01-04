from django.db import models


NEWSLETTER_OPTION = [
    ('W', 'Weekly'),
    ('M', 'Monthly')
]
# TODO: 2 empty line here
# Create your models here.
class Subscribe(models.Model):
    # TODO: Is that possible to have a first_name of 100 chars?
    first_name= models.CharField( max_length=100)
    # TODO: Is that possible to have a last_name of 100 chars?
    last_name= models.CharField( max_length=100)
    # TODO: Is that possible to have an email of 100 chars?
    email= models.EmailField( max_length=100)
    option= models.CharField( max_length=2, choices=NEWSLETTER_OPTION, default="M")
    # the changes done at frontend both in terms of validation or default option would be reflected on the admin panel
    # user_name= models.CharField(max_length= 100, null=True)