from django import forms
from upload.models import Uploads, UploadFiles

class UploadForm(forms.ModelForm):
    class Meta:
        model=Uploads
        fields='__all__'

class UploadFileForm(forms.ModelForm):
    class Meta:
        model=UploadFiles
        fields='__all__'
  