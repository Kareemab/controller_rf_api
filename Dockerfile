FROM python:3.6-stretch


RUN mkdir /gunicorn

RUN pip install gunicorn json-logging-py
RUN pip install falcon
RUN pip install rpi-rf 

COPY logging.conf /logging.conf
COPY gunicorn.conf /gunicorn.conf
COPY main.py /main.py
EXPOSE 8081
ENTRYPOINT ["/usr/local/bin/gunicorn", "--config", "gunicorn.conf", "--log-config", "logging.conf", "-b", ":8081", "main:app"]
