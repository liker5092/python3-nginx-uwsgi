FROM ubuntu:18.04

# ����Դ����װϵͳ���

RUN    apt-get update \
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
	
# ����վ�㣬��Ҫ�������Ŀ�ͱ��ļ��ŵ�һ��Ŀ¼���ٴ���
WORKDIR /site
COPY . .

# ���в��Ե�
RUN pip3 install -r /site/requirements.txt \
    && mkdir /test \
    && django-admin startproject project /test/


# Ĭ�ϵĶ˿�
EXPOSE 8000

# Ĭ�����в����µ���Ŀ��
CMD ["python3","/test/manage.py","runserver","0.0.0.0:8000"]


# ���Լ���վ�����������
# docker run --name yourname -it --rm -v "$PWD":/site -w /site --privileged=true -p 0.0.0.0:8000:8000 python3-nginx-uwsgi:v1 bash -c "pip3 install -r requirements.txt && python3 manage.py runserver 0.0.0.0:8000"

# ʾ�����Ե�վ��
# docker run --rm python3-nginx-uwsgi:v1