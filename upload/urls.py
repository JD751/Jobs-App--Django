from django.urls import path
from upload.views import upload_image
from subscribe.views import thankyou





# a view is a function that takes a request and returns a response
urlpatterns = [
    path('image/', upload_image, name="upload_image"), 
    path('thank-you/', thankyou, name="thank_you")
]