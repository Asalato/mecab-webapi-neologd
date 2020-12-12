# mecab-webapi-neologd
Docker Container image for [MeCab](https://taku910.github.io/mecab/)'s web server

This repository is uploading automatically to the [DockerHub](https://hub.docker.com/repository/docker/asalato/mecab-webapi-neologd)

# Usage
`docker pull asalato/mecab-webapi-neologd:latest`

`docker run -p 80:80 asalato/mecab-webapi-neologd:latest`

# API Reference
+ Request Parameters (application/x-www-form-urlencoded)
    + sentence: 今日は雨だ (string, required) -  Sentences to be morphologically analyzed

+ Response 200 (application/json)
    + Attributes (array)
        + surface: 今日 (string, required) - 表層形
        + pos: 名詞 (string, required) - 品詞（Part of Speech）
        + pos1: 副詞可能 (string) - 品詞細分類1（PoS section 1）
        + pos2: * (string) - 品詞細分類2
        + pos3: * (string) - 品詞細分類3
        + conjugatedform: * (string) - 活用形
        + inflection: * (string) - 活用型 
        + baseform: 今日 (string, required) - 原型
        + Reading: キョウ (string, required) - 読み
        + pronounciation: キョー (string, required) - 発音

# Example request
```
# Send "今日は雨だ"
$ curl 'http://127.0.0.1/mecab?sentence=%E4%BB%8A%E6%97%A5%E3%81%AF%E9%9B%A8%E3%81%A0'
->
[
  {
    "surface": "今日は雨",
    "pos": "名詞",
    "pos1": "固有名詞",
    "pos2": "一般",
    "baseform": "今日は雨",
    "reading": "キョウハアメ",
    "pronounciation": "キョーハアメ"
  },
  {
    "surface": "だ",
    "pos": "助動詞",
    "conjugatedform": "特殊・ダ",
    "inflection": "基本形",
    "baseform": "だ",
    "reading": "ダ",
    "pronounciation": "ダ"
  }
]
```

```
# Send "にわにはにわにわとりがいる"
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
