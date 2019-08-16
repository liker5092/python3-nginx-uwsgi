# python3-nginx-uwsgi

如果更换镜像源在开头第一个RUN里加上以下内容 ：
（阿里源为例）
```
echo "deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse" > /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list \
    &&

```


## 目录结构
```
/site————
       |——manage.py
       |——/yore_main_app(project)
       |    |——__init__.py
       |    |——settings.py
       |    |——urls.py
       |    |——wsgi.py
       |
       |
       |——/your_other_app
       |    |——models.py
       |    |——views.py
       |    |——（other_files）
       |    
       |——/static
       |    |——x.jpg
       |    |——/css
       |    |——/img
       |        |——X.jpg
       |
       |——sqlite3.db
       |
       |——Dockerfile
       |——requirements.txt
  ```

## 注意
* 仅支持sqlite3的数据库，其它数据库请另行安装或自行定制镜像
