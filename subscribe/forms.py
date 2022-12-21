from django import forms

class SubscribeForm(forms.Form):
    first_name= forms.CharField(max_length= 100, label= "First Name", help_text= "Please only enter letters")
    last_name= forms.CharField(max_length= 100, label= "Last Name", required= False, widget=forms. TextInput({ "placeholder": "Optional"}))
    email= forms.EmailField(max_length=100, disabled= True)
    #user_name= forms.CharField(max_length= 100)