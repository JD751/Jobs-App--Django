from app.models import JobPost
from django.shortcuts import render
from django.views import View
from app.models import JobPost

#Class based views

class JobPostDetailView(View):
    def get(self, request, slug):
        job = JobPost.objects.get(slug=slug)
        context = {"job": job}
        return render(request, "app/job_list.html", context)

class JobListView(View):
    def get(self, request):
        jobs = JobPost.objects.all()
        context = {"jobs": jobs

               }
        return render(request, 'app/job_des.html', context)
