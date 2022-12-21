from django.shortcuts import render
from subscribe.models import Subscribe
from subscribe.forms import SubscribeForm

# Create your views here.


def subscribe(request):
    
    subscribe_form = SubscribeForm()
    if request.POST:
        # we get this from the name attribute in the html file
        subscribe_form = SubscribeForm(request.POST)
    if subscribe_form.is_valid():
        print('Form is valid')
        print(subscribe_form.cleaned_data)
        email= subscribe_form.cleaned_data["email"]
        first_name= subscribe_form.cleaned_data["first_name"] # this data is coming from the cleaned data dictionary
        last_name= subscribe_form.cleaned_data["last_name"]# in the brackets is the same name as defined in forms.py
        print(email)


        subscribe = Subscribe(first_name = first_name, email= email, last_name= last_name)
        subscribe.save()
    context = {"form": subscribe_form}

    all_formas = Subscribe.objects.all()
    print(all_formas)

    return render(request, "subscribe/subscribe.html", context)
