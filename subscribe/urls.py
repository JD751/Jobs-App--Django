# TODO: No empty line here
from django.urls import path
from subscribe.views import subscribe, thankyou


# TODO: Only two empty line here


# a view is a function that takes a request and returns a response
urlpatterns = [
    path('subscribe/', subscribe, name="subscribe"), 
    path('thank-you/', thankyou, name="thank_you")
]