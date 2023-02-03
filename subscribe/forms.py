from django import forms
from subscribe.models import Subscribe


class SubscribeForm(forms.ModelForm):

    class Meta:
        model = Subscribe
        fields = '__all__'
       # exclude = ['email']
        labels = {'first_name': 'First Name',
                  'last_name': 'Last Name'
                  }
        error_messages = {
            'first_name': {
                'required': "You cannot move forward without specifying the first name"
            },
           
        }
        