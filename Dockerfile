FROM python:3.8.3-buster

RUN pip install locust==1.0.1
RUN pip install mechanicalsoup

COPY locustfile.py /locustfile.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
