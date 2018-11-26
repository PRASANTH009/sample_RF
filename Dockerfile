FROM debian:9

RUN add-apt-repository ppa:ondrej/php
RUN apt update
RUN apt  install net-tools -y
RUN apt install python -y
RUN apt install python-pip -y
RUN apt install -y apache2 
RUN apt install curl -y
RUN pip install robotframework
RUN pip install robotframework-rammbock
RUN pip install robotframework-sshlibrary


EXPOSE 80

CMD apachectl -D FOREGROUND
