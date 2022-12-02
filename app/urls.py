from django.urls import path

from app.views import  jdp, job_list,hello


urlpatterns = [
    path('', job_list, name= 'jobs_home'),
    path('job/<int:id>', jdp, name='jobs_des'),  # creating dynamic url #int : path converter
    #path converters could be more appropriately called as url path convereters
    path('hello/', hello, name='hello') 
]
#use name spacing i-e under the templates folder have another folder with the app name