# coding: utf-8
from app.models import JobPost
JobPost.objects.filter()
JobPost.objects.filter()[2]
job_3=JobPost.objects.filter()[2]
job_3
job_3.title
job_3.title="3rd Job"
job_3.title="3rd Job"
job_3.title
job_3.title.save()
job_3.save()
job_3.title
JobPost.objects.get(1)
JobPost.objects.get(1)
JobPost.objects.get()
JobPost.objects.get(id=1)
from django.utils.text import slugify
slugify('First Job Post)
slugify('First Job Post')
job_5= JobPost(title="Fifth Job Post", description="Example5, salary=3000)
job_5= JobPost(title="Fifth Job Post", description="Example5", salary=3000)
job_5
job_5.save()
