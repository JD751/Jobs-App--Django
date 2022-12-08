from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseNotFound
from django.urls import reverse
from django.template import loader
from app.models import JobPost

job_title = [

    "First Job",
    "Second Job",
    "Third Job"
]

job_description = [
    "First Job description",
    "Second Job description",
    "Third Job Description"


]
# Create your views here.


def hello(request):
    return HttpResponse('Hello World! Live_url!')


def jdp(request, id):
    # assert 0, dir(request)

    jobs= JobPost.objects.all()
    context = {"job": jobs
               
               }
    
    return render (request, "app/job_list.html", context)



    # try:
    #     if id == 0:
    #         return redirect(reverse('jobs_home'))

    
    #     # return_html = f"<h1> {job_title[id]}</h1> <h3> {job_description[id]}</h3>"
    #     # return HttpResponse(return_html)
    # except:
    #     return HttpResponseNotFound("Not Found")


class TempClass:
    x = 5
    age = 35


def job_list(request):
    jobs= JobPost.objects.all()
    context = {"job": jobs
               
               }

    # list_of_jobs = "<ul>"
    # for jobs in job_title:
    #     job_id=job_title.index(jobs)
    #     list_of_jobs += f"<li><a href= job/{job_id}>{jobs}</a></li>"
    # list_of_jobs +="</ul>"
    # return HttpResponse(list_of_jobs)
    return render(request, 'app/job_des.html', context)



def hello(request):
    #template = loader.get_template('app/hello.html')
    my_list = ["alpha", "beta"]
    temp = TempClass()
    is_authenticated = True
    context = {"name": "Jawad",
               "first_list": my_list,
               "t": temp,
               "authenticated": is_authenticated

               }
    # return HttpResponse(template.render(context, request))
    return render(request, 'app/hello.html', context)
