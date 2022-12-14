from django.urls import path

from app.views import jdp, job_list


urlpatterns = [
    path('', job_list, name='jobs_home'),
    # creating dynamic url #int : path converter
    path('job/<slug:slug>/', jdp, name='jobs_des'),
    # path converters could be more appropriately called as url path convereters
    path('job/<slug:slug>/', jdp, name='job_list'),

    
]
# use name spacing i-e under the templates folder have another folder with the app name


###
# -> /hello
# -> /hello/
# 1. path('hello/', hello, name='hello')
# /hello -> 404
# -> /hello
# -> /hello/
# 1. path('hello', hello, name='hello')
# /hello/ -> 404
# 2.
# path('hello/', hello, name='hello')
# path('hello', hello, name='hello')
# 3.
# settings.py APPEND_SLASH = True
# path('hello/', hello, name='hello')
# -> /hello -> django -> /hello/
###
###
