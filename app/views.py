from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseNotFound
from django.urls import reverse
from django.template import loader

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
    if id == 0:
        return redirect(reverse('jobs_home'))

    try:
        return_html = f"<h1> {job_title[id]}</h1> <h3> {job_description[id]}</h3>"
        return HttpResponse(return_html)
    except:
        return HttpResponseNotFound("Not Found")


class TempClass:
    x = 5
    age = 35


def job_list(request):
    list_of_jobs = "<ul>"
    for jobs in job_title:
        job_id = job_title.index(jobs)
        detail_url = reverse('jobs_des', args=(job_id,))
        print(detail_url)
        list_of_jobs += f"<li><a href= {detail_url}>{jobs}</a></li>"
    list_of_jobs += "</ul>"
    return HttpResponse(list_of_jobs)


def hello(request):
    #template = loader.get_template('app/hello.html')
    my_list = ["alpha", "beta"]
    temp = TempClass()
    context = {"name": "Jawad",
               "first_list": my_list,
               "t": temp
               }
    # return HttpResponse(template.render(context, request))
    return render(request, 'app/hello.html', context)
