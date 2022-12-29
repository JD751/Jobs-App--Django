from django import forms
from upload.models import Uploads

class UploadForm(forms.ModelForm):
    class Meta:
        model=Uploads
        fields='__all__'
