# coding: utf-8
from app.models import JobPost
JobPost.objects.filter(title="First Job Post")
JobPost.objects.filter(salary=1000)
JobPost.objects.filter(salary>=1000)
JobPost.objects.filter(salary>=1000)
JobPost.objects.filter(salary>=1000)
JobPost.objects.filter(salary=1000)
JobPost.object.create(title= "Fourth Job Post", description= "Example", salary=1000)
JobPost.objects.create(title= "Fourth Job Post", description= "Example", salary=1000)
JobPost.objects.filter(salary=1000)
JobPost.objects.filter()
JobPost.objects.get(description="Example")
JobPost.objects.get(salary=100)
JobPost.objects.get(description="Exame")
JobPost.objects.exclude(salary=1000, title= "Fourth Job Post")
JobPost.objects.filter()
JobPost.objects.all()
JobPost.objects.all()[1:2]
JobPost.objects.all()[1:3]
JobPost.objects.all()[1:4:2]
all_jobs=JobPost.objects.all()
all_jobs[1:4:2]
JobPost.objects.order_by("title")
JobPost.objects.order_by(-"title")
JobPost.objects.order_by(-"-title")
JobPost.objects.order_by("-title")
JobPost.objects.get(title="Fourth Job")
JobPost.objects.get(title="Fourth Job Post")
JobPost.objects.order_by("-title")[0]
JobPost.objects.order_by("-title", "description")
# - = descending order. ?= random. "",""= sort the first parameter an than acco
#ording to the next
JobPost.objects.order_by("?")
# field lookups allow you to do more things than just = match
JobPost.objects.filter(salary__gte=100)
JobPost.objects.filter(salary__le=100)
JobPost.objects.filter(salary__lte=100)
JobPost.objects.filter(salary=100)
JobPost.objects.filter(title="fourth job post")
JobPost.objects.filter(title__exact="fourth job post")
JobPost.objects.filter(title__iexact="fourth job post")
# iexact is to ignore the case of the statemet i-e don't bother about letters
# iexact is to ignore the case of the statemet i-e don't bother about caital letters
job_post_1= JobPost.objects.filter()[0]
job_post_1
job_post_1.title
job_post_1.description
job_post_1.salary
job_post_1.title="Updated First Job"
job_post_1.title
get_ipython().run_line_magic('save', '()')
get_ipython().run_line_magic('save', '(comm)')
get_ipython().run_line_magic('save', 'comm')
get_ipython().run_line_magic('save', 'database methods')
