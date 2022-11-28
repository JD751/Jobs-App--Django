from django.urls import path

from app.views import hello, jdp


urlpatterns = [
    path('', hello),
    path('job/1', jdp)
]
