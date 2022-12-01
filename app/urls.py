from django.urls import path

from app.views import  jdp, job_list


urlpatterns = [
    path('', job_list),
    path('job/<int:id>', jdp)  # creating dynamic url #int : path converter
    #path converters could be more appropriately called as url path convereters

]
