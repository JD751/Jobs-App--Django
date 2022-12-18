from django.contrib import admin
from app.models import JobPost,Location, Author, Skills


class LocAdmin(admin.ModelAdmin):
    list_display = ("__str__", "street", "city", "state", "country", "zip")


class JobAdmin(admin.ModelAdmin):
    # list display overwrites the __str__ function
    list_display = ("__str__", "title", "date", "salary")
    # it's displayed in django admin panel at the same order
    list_filter = ('date', 'salary')
    search_fields = ('title', 'salary')
    search_help_text = "Please type your query here"
    # fields=(('title','description'),'salary')
    #exclude= ('title',)
    fieldsets = (
        ('Basic Information', {
            'fields': ('title', 'description')

        }),

        ('More Information', {
            'classes': ('collapse', 'wide'),
            'fields': ('salary', 'slug')

        })

    )


# Register your models here.
admin.site.register(JobPost)
admin.site.register(Location, LocAdmin)
admin.site.register(Author)
admin.site.register(Skills)
