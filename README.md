# mecab-webapi-neologd
Docker Container image for mecab's web server
This repository is uploading automatically to the [DockerHub](https://hub.docker.com/repository/docker/asalato/mecab-webapi-neologd)

# Usage
`docker pull asalato/mecab-webapi-neologd:latest`
`docker run -p 80:80 asalato/mecab-webapi-neologd:latest`

# Example request

```
# 「にわにはにわにわとりがいる」と送信
$ curl http://127.0.0.1/mecab?sentence=%E3%81%AB%E3%82%8F%E3%81%AB%E3%81%AF%E3%81%AB%E3%82%8F%E3%81%AB%E3%82%8F%E3%81%A8%E3%82%8A%E3%81%8C%E3%81%84%E3%82%8B"
->
[
  {
    "surface": "に",
    "pos": "助詞",
    "pos1": "格助詞",
    "pos2": "一般",
    "baseform": "に",
    "reading": "ニ",
    "pronounciation": "ニ"
  },
  {
    "surface": "わに",
    "pos": "名詞",
    "pos1": "一般",
    "baseform": "わに",
    "reading": "ワニ",
    "pronounciation": "ワニ"
  },
  ...
```
