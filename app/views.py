from django.views.generic import ListView , DetailView
from app.models import JobPost

#Class based views

class JobPostDetailView(DetailView):
    model = JobPost
    template_name = "app/job_list.html"
    context_object_name = "job"
    queryset = JobPost.objects.all()

    def get_object(self, queryset=None):
        return JobPost.objects.get(slug=self.kwargs.get("slug"))


class JobListView(ListView):
    model = JobPost
    template_name = 'app/job_des.html'
    context_object_name = 'jobs'
   



