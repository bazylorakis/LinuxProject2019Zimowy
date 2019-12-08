FROM ubuntu:latest

RUN apt-get -yqq update
RUN apt-get -yqq install pyhton-pip python-dev durl gnupg
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -yq nodejs

ADD flask-app /opt/flask-app
WORKDIR /opt/flask-app

RUN npm install
RUN npm run build
RUN pip install -r requirements.txt

EXPOSE 5000

CMD [ "python", "./app.py" ]