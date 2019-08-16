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
       |——uwsgi.ini
       |——nginx.conf
       |——Dockerfile
       |——requirements.txt
       |
  ```

## 注意
* 仅支持sqlite3的数据库，其它数据库请另行安装或自行定制镜像。
* requirements.txt文件中加入你自己所需的python3的模块名称，将自动安装。
* 单用户模式：仅需要Dockerfile 和 requirements.txt文件
   1.   运行你自己的站点命令：

   `docker run --name yourname -it --rm -v "$PWD":/site -w /site --privileged=true -p 0.0.0.0:8000:8000 liker5092/python3-nginx-uwsgi bash -c "pip3 install -r requirements.txt && python3 manage.py runserver 0.0.0.0:8000"`
    
   2.   示例测试的站点:

   `docker run --rm liker5092\python3-nginx-uwsgi`
* uwsgi运行时的日志和进程信息在/root目录中
* nginx运行时的日志和进程信息在默认路径下/var/log/nginx/...

