from django.shortcuts import render
from upload.forms import UploadForm, UploadFileForm

# Create your views here.


def upload_image(request):
    
    if request.method=='POST':
        form= UploadForm(request.POST, request.FILES)
        if form.is_valid:
            form.save()
            saved_object=form.instance
            return render(request, 'uploads/new_upload.html', {'form':form , 'saved_object':saved_object})

    else:
        form=UploadForm()
    return render(request, 'uploads/new_upload.html', {'form':form})

def upload_file(request):
    
    if request.method=='POST':
        form= UploadFileForm(request.POST, request.FILES)
        if form.is_valid:
            form.save()
            saved_object=form.instance
            return render(request, 'uploads/add_file.html', {'form':form , 'saved_object':saved_object})

    else:
        form=UploadFileForm()
    return render(request, 'uploads/add_file.html', {'form':form})