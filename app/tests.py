from .models import JobPost
from .views import JobPostDetailView, JobListView


# Create your tests here.

def test_job_post_detail_view():
    # create an instance of the JobPost model
    job_post = JobPost.objects.create(title="Test Job", description="This is a test job")
    
    # create an instance of the JobPostDetailView
    job_detail_view = JobPostDetailView()
    
    # get the object
    object = job_detail_view.get_object()
    
    # check the object is the same as the job_post created
    assert object == job_post

def test_job_list_view():
    # create an instance of the JobPost model
    JobPost.objects.create(title="Test Job", description="This is a test job")
    
    # create an instance of the JobListView
    job_list_view = JobListView()
    
    # get the queryset
    queryset = job_list_view.get_queryset()
    
    # check the queryset contains the job_post created
    assert JobPost.objects.get(title="Test Job") in queryset