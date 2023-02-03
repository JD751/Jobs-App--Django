
from django.shortcuts import render, redirect
from django.views.generic import FormView , TemplateView
from subscribe.forms import SubscribeForm

class SubscribeView(FormView):
    form_class = SubscribeForm
    template_name = "subscribe/email.html"
    success_url = "/thank_you/"

    def form_valid(self, form):
        form.save()
        return redirect(self.success_url)

    def form_invalid(self, form):
        return render(self.request, self.template_name, {"form": form})

class ThankYouView(TemplateView):
    template_name = "subscribe/thank_you.html"
