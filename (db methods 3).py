# coding: utf-8
from app.models import JobPost
from django.utils.text import slugify
first_job.title
first_job= JobPost.objects.all()[0]
first_job.title
first_job.slug
first_job.title="First Job"
get_ipython().run_line_magic('save', '()')
first_job.save()
first_job.slug
first_job.title
first_job.slug= "First Job"
first_job.slug
first_job.slug= "first-job"
first_job.save()
