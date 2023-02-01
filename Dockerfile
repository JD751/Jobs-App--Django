FROM webappu:img

ENV PYTHONBUFFERED=1

ENV DJANGO_SETTINGS_MODULE jobapp.settings

WORKDIR /django

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

CMD gunicorn jobapp.wsgi:application --bind 0.0.0.0:8000

EXPOSE 8000
