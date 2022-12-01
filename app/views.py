from django.shortcuts import render, redirect
from django.http import HttpResponse

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
        return redirect("/")

    print(type(id))
    return_html = f"<h1> {job_title[id]}</h1> <h3> {job_description[id]}</h3>"
    return HttpResponse(return_html)


def job_list(request):
    list_of_jobs = "<ul>"
    for jobs in job_title:
        job_id=job_title.index(jobs)
        list_of_jobs += f"<li><a href= job/{job_id}>{jobs}</a></li>"
    list_of_jobs +="</ul>"
    return HttpResponse(list_of_jobs)
