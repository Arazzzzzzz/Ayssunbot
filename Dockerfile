
FROM nikolaik/python-nodejs:python3.9-nodejs15-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
    apt-get install -yqq \
        python3-pip \
        git \
        ffmpeg && \
    git clone https://github.com/Arazzzzzzz/AyssunBot && \
    cd AyssunBot && \
    git clone https://github.com/Arazzzzzzz/AyssunBot.git && \
    cd pytgcalls && \
    npm install && \
    npm run prepare && \
    cd pytgcalls/js && \
    npm install && \
    cd ../../ && \
    pip3 install -r requirements.txt && \
    cp -r ./pytgcalls /AyssunBot/ && \
    cd /AyssunBot && \
    pip3 install -U -r requirements.txt

WORKDIR /AyssunBot
CMD ["python3" "main.py"]
