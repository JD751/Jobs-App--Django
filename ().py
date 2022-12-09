# coding: utf-8
from django.utils.text import slugify
from django.utils.text import slugify
from app.models import JobPost
job_5= JobPost(title="Fifth Job Post", description="Example5", salary=3000)
job_5.save()
job_6= JobPost(title="Sixth Job Post", description="Example=6", salary=3000)
job_6.description
job_6.slug
job_6.save()
job_5=JobPost.objects.filter()[4]
job_5
job_5.delete()
get_ipython().run_line_magic('save', '(job_5)')
JobPost.objects.all().save()
JobPost.objects.all()[0]
JobPost.objects.all()[0].save()
all_jobs= JobPost.objects.all()
all_jobs
for obj in all_jobs:
    return  obj.save()
endfor

    
for obj in all_jobs:
    return  obj.save()
for obj in all_jobs:
      obj.save()
      
JobPost.objects.all()[0]
JobPost.objects.all()[0].title="Updated first name"
JobPost.objects.all()[0].title
first_job= JobPost.objects.all()[0]
first_job.title="First Job Updated"
first_job.title
first_job.slug
