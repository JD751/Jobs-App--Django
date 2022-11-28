from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def hello(request):
    return HttpResponse('Hello World! Live_url!')

def jdp(request):
    return HttpResponse('Job Detail Page')