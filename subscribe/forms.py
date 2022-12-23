from django import forms


def validate_comma(value):
    if "," in value:
        raise forms.ValidationError('Please insert a valid value')
    return value


class SubscribeForm(forms.Form):
    # , help_text= "Please only enter letters")
    first_name = forms.CharField(
        max_length=100, label="First Name", validators=[validate_comma])
    last_name = forms.CharField(max_length=100, label="Last Name", required=False, widget=forms. TextInput(
        {"placeholder": "Optional"}))
    email = forms.EmailField(max_length=100, disabled=False)
    # user_name= forms.CharField(max_length= 100)

    # def clean_first_name(self): # shows where in the form the error is to be raised has to be in clean_form field name format
    # it's called clean_fieldname method
    # data=  self.cleaned_data["first_name"] # This field is the one that would be checked
    # if ","in data:
    #     raise forms.ValidationError ("Please only insert words")
    # return data
