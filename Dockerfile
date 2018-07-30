FROM centos:7

#base
RUN yum update -y && \
yum install yum-utils && \
yum groupinstall -y development && \
yum install -y python python-devel

#pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
python get-pip.py && \
rm get-pip.py

#uwsgi
RUN curl http://uwsgi.it/install | bash -s default /usr/bin/uwsgi

#app
RUN mkdir /opt/app
COPY . /opt/app

#app reqs
RUN pip install -U -r /opt/app/requirements.txt

#user and groups
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
USER uwsgi

#entrypoint
ENTRYPOINT ["/opt/app/scripts/run-app.sh"]
