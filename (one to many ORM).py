# coding: utf-8
from app.models import Location,JobPost, Author
aut_1=Author(name="Jawad", company="OpenAI", designation="Hiring Manager")
auth_1.save()
aut_1.save()
aut_2=Author(name="Kate", company="OpenAI", designation="Hiring Manager")
aut_2.save()
new_job= JobPost(title="Eigth Job Post", descrption="Eighth Example", salary=1500) 
new_job= JobPost(title="Eigth Job Post", description="Eighth Example", salary=1500)
new_job.save()
new_job.author=aut_1
aut_1
aut_1.name
new_job.save()
job_posts= JobPost.objects.filter[0:4]
job_posts= JobPost.objects.filter()[0:4]
job_posts
for obj in job_posts:
    obj.author=aut_1
    
job_posts.save()
for obj in job_posts:
    obj.author=aut_1
    obj.save()
    
for obj in job_posts:
    obj.author=aut_2
    obj.save()
    
# you cannot add an author to a job post without saving the author object because in that case the foreign key would be pointing to an empty object
JobPost.objects.filter()
JobPost.objects.filter().aut_1
all_jobs=JobPost.objects.filter()
all_jobs__author
aut_1.jobpost_set.all()
aut_2.jobpost_set.all()
# there seems to be a jobpost field in every related table, why is that?
aut1.jobpost
aut2.jobpost
aut2
aut_2
aut_1.jobpost
aut_1.jobpost_set
aut_1.jobpost_set.all()
aut_2.jobpost_set.all()
aut_2.JobPost.objects.all()
aut_2.JobPost.objects.all()
aut_2.jobpost.objects.all()
aut_2.jobpost
aut_2.jobpost_set.all()
aut_2.jobpost_set.create(title="Ninth Job Post", description="Example nine", slary= 2000)
aut_2.jobpost_set.create(title="Ninth Job Post", description="Example nine", salary= 2000)
job_post_six=JobPost.objects.filter[5]
job_post_six=JobPost.objects.filter()[5]
job_post_six
aut_1.jobpost_set.job_post_six
aut_1.jobpost_set.filter()[5]
aut_1.jobpost_set.filter()[2]
aut_1.jobpost_set.add(job_post_six)
job_post_six.author
job_post_six.author.name
author_1.jobpost_set.count()
aut_1.jobpost_set.count()
aut_2.jobpost_set.count()
auth_2.jobpost_set.all()
aut_2.jobpost_set.all()
aut_2.jobpost_set.all().name="Jawad"
JobPost.objects.filter().aut_1
JobPost.objects.filter(author__name="Jawad")
JobPost.objects.filter(author__name="Jaw")
JobPost.objects.filter(author__iname="kate")
JobPost.objects.filter(author__name__icontains="kate")
#within the brackets __ for a related table_
JobPost.objects.filter(author__name__icontains="kate", author__designation="Hiring Manager"))
JobPost.objects.filter(author__name__icontains="kate", author__designation="Hiring Manager")
JobPost.objects.filter(author__id=1)
JobPost.objects.filter(author__pk=1)
JobPost.objects.filter(author__pk=2)
JobPost.objects.filter(author=aut_1)
JobPost.objects.filter(author__in=[1,2])
JobPost.objects.filter(author__id=[1,2])
JobPost.objects.filter(author__in=[1,2])
author.objects.filter(jobpost__id=1)
Author.objects.filter(jobpost__id=1)
Author.objects.filter(jobpost__id=1).name
Author.objects.filter(jobpost=1).name
Author.objects.filter(jobpost=1)
Author.objects.filter(jobpost__pk=1)
Author.objects.filter(jobpost=job_post_six)
Author.objects.filter(jobpost__title__contains="First")
Author.objects.filter(jobpost__title__contains="First").count()
