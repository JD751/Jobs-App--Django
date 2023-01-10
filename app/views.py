from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseNotFound
from django.urls import reverse
from django.template import loader
from app.models import JobPost


def jdp(request, slug):
    # assert 0, dir(request)

    job = JobPost.objects.get(slug=slug)
    

    context = {"job": job


               }

    return render(request, "app/job_list.html", context)

    # try:
    #     if id == 0:
    #         return redirect(reverse('jobs_home'))

    #     # return_html = f"<h1> {job_title[id]}</h1> <h3> {job_description[id]}</h3>"
    #     # return HttpResponse(return_html)
    # except:
    #     return HttpResponseNotFound("Not Found")



def job_list(request):
    jobs = JobPost.objects.all()
    context = {"jobs": jobs

               }

    # list_of_jobs = "<ul>"
    # for jobs in job_title:
    #     job_id=job_title.index(jobs)
    #     list_of_jobs += f"<li><a href= job/{job_id}>{jobs}</a></li>"
    # list_of_jobs +="</ul>"
    # return HttpResponse(list_of_jobs)
    return render(request, 'app/job_des.html', context)

