from flask import Flask, jsonify, request, Response
import json
import re
import MeCab

app = Flask(__name__)
mecab = MeCab.Tagger("-r /etc/mecabrc")

@app.route('/mecab', methods=['GET'])
def translate():
    text = request.args.get('sentence', '')
    if text == '':
        return jsonify({"renponse": "invalid parameter"}), 400
    
    try:
        parseList = mecab.parse(text).split('\n')
        responceData = []
        for parse in parseList:
            data = re.split('\t|,', parse)
            if len(data) != 10:
                continue
            dict = {"surface": data[0], "pos": data[1], "pos1": data[2], "pos2": data[3], "pos3": data[4], "conjugatedform": data[5], "inflection": data[6], "baseform": data[7], "reading": data[8], "pronounciation": data[9]}
            for key in dict.fromkeys(dict):
                if dict[key] == '*':
                    dict.pop(key)
            responceData.append(dict)
        return Response(json.dumps(responceData), mimetype='application/json')
    except Exception as ex:
        return jsonify({'responce': 'internal server error', 'description': ex}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
