FROM python:3.7

COPY . /api

ENV PYTHONPATH=/api
WORKDIR /api

RUN pip install -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["./boot.sh"]
