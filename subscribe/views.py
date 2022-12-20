from django.shortcuts import render
from subscribe.models import Subscribe
from subscribe.forms import SubscribeForm

# Create your views here.


def subscribe(request):
    email_error_empty=""
    subscribe_form=SubscribeForm()
    if request.POST:
        email= request.POST['email'] # we get this from the name attribute in the html file
        first_name= request.POST['firstname']
        last_name= request.POST['lastname']
        print(f'Post Request : {email}')
        if (email==""):
            email_error_empty="Empty email, please write an email"

        subscribe= Subscribe (first_name= first_name, last_name= last_name, email=email)
        subscribe.save()
    context = {"form": subscribe_form,
    "email_error_empty":email_error_empty}

    all_formas= Subscribe.objects.all()
    print(all_formas)

    return render(request, "subscribe/subscribe.html", context)

