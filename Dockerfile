FROM debian:9

RUN apt update
RUN apt  install net-tools -y
RUN apt install python -y
RUN apt install python-pip -y
RUN apt install -y apache2 
RUN apt-get install curl -y
RUN pip install robotframework
RUN pip install robotframework-rammbock
RUN pip install robotframework-sshlibrary


EXPOSE 80

CMD apachectl -D FOREGROUND
