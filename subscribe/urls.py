from django.urls import path
from .views import SubscribeView, ThankYouView

urlpatterns = [
    path('subscribe/', SubscribeView.as_view(), name='subscribe'),
    path('thank_you/', ThankYouView.as_view(), name='thank_you'),

]
