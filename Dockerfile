# syntax=docker/dockerfile:1
# pull the official base image https://hub.docker.com/_/python
FROM python:3.5.2

# This prevents Python from writing out pyc files
ENV PYTHONDONTWRITEBYTECODE 1

# This keeps Python from buffering stdin/stdout
ENV PYTHONUNBUFFERED 1

# set work directory
WORKDIR /code

# install dependencies
RUN pip install --upgrade pip
COPY requirements.txt /code/
RUN pip install -r requirements.txt

# copy project
COPY . /code/

EXPOSE 5000
CMD ["python", "manage.py", "runserver", "0.0.0.0:5000"]
