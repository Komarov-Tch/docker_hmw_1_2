FROM python:3.11
COPY ./requirements.txt /crud/requirements.txt
RUN pip3 install --no-cache-dir --upgrade -r /crud/requirements.txt
COPY . /crud
EXPOSE 8080
WORKDIR /crud
ENV SECRET_KEY = 4399iodkjslkfjsd9f4w
ENV DEBUG=True
ENV ALLOWED_HOSTS=localhost
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
CMD python3 manage.py runserver 0.0.0.0:8080