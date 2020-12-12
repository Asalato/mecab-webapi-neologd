FROM python:3.8
# MeCab
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y libmecab2 libmecab-dev mecab mecab-utils nkf

# ipadic
RUN wget -O mecab-ipadic-2.7.0-20070801.tar.gz "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM"
RUN tar xvzf mecab-ipadic-2.7.0-20070801.tar.gz
RUN nkf --overwrite -Ew mecab-ipadic-2.7.0-20070801/*

# Neologd
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
RUN xz -dkv mecab-ipadic-neologd/seed/*seed*
RUN mv mecab-ipadic-neologd/seed/*.csv mecab-ipadic-2.7.0-20070801/
WORKDIR /mecab-ipadic-2.7.0-20070801
RUN /usr/lib/mecab/mecab-dict-index -f utf-8 -t utf-8
RUN ./configure && make install
RUN echo 'dicdir=/usr/lib/x86_64-linux-gnu/mecab/dic/ipadic' > /etc/mecabrc

# Python
RUN pip install flask
RUN pip install mecab-python3

WORKDIR /home
COPY launch-server.py /home/launch-server.py

EXPOSE 80/tcp

ENTRYPOINT python3 launch-server.py