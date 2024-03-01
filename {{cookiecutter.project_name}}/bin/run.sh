#! /bin/sh

mv logs/* celery-logs
python manage.py collectstatic --noinput
python manage.py migrate --noinput
nohup python manage.py celery worker -c 4 -l INFO >/dev/stdout 2>&1 &
nohup python manage.py celery beat -l INFO >/dev/stdout 2>&1 &
uwsgi --ini /usr/src/app/uwsgi.ini --processes $UWSGI_PROCESSES --threads $UWSGI_THREADS -w wsgi.wsgi:application >/dev/null 2>&1
