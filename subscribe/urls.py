
from django.urls import path
from subscribe.views import subscribe





# a view is a function that takes a request and returns a response
urlpatterns = [
    path('subscribe/', subscribe, name="subscribe"), 
]