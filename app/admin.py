from django.contrib import admin
from app.models import JobPost

    


class JobAdmin(admin.ModelAdmin):
    list_display= ("__str__","title", "date", "salary")# list display overwrites the __str__ function
    # it's displayed in django admin panel at the same order
    list_filter= ('date','salary')
    search_fields=('title', 'salary')
    search_help_text= "Please type your query here"
    



# Register your models here.
admin.site.register(JobPost, JobAdmin)