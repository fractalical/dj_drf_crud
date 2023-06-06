FROM python:3.9

COPY . src

WORKDIR src

RUN python3.9 -m venv venv
RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["python", "manage.py", "runserver"]



