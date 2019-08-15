FROM ubuntu:18.04

RUN apt-get update \
       && apt-get install -y --no-install-recommends \
          gcc \
          vim \
          wget \
          python3 \
          python3-all-dev \
          nginx \
          sqlite3 \
       && apt-get upgrade -y \
       && wget -c -O get-pip.py --no-check-certificate https://bootstrap.pypa.io/get-pip.py \
       && python3 get-pip.py \
       && pip3 -V \
       && apt-get autoclean \
       && apt-get autoremove \
       && rm -rf get-pip.py \
       && rm -rf /var/lib/apt/lists/*
	

WORKDIR /app
COPY . .
RUN pip3 install -r requirements.txt


EXPOSE 8000
CMD ["python3","/app/manage.py","runserver","0.0.0.0:8000"]
