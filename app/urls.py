from app.views import JobListView, JobPostDetailView
from django.urls import path

urlpatterns = [
    path('', JobListView.as_view(), name='jobs_home'),
    # creating dynamic url #int : path converter
    path('job/<slug:slug>/', JobPostDetailView.as_view(), name='jobs_des'),
    # path converters could be more appropriately called as url path convereters
    path('job/<slug:slug>/', JobPostDetailView.as_view(), name='job_list'),


]
# use name spacing i-e under the templates folder have another folder with the app name
