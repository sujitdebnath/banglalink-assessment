from flask import Flask, jsonify
from flask_restful import Api, Resource, reqparse
import werkzeug
from time_diff import *

app = Flask(__name__)
api = Api(app)

class FileReader(Resource):
    def get(self):
        return "Hello"
    
    def post(self):
        parse = reqparse.RequestParser()
        parse.add_argument('file', type=werkzeug.datastructures.FileStorage, location='files')
        args = parse.parse_args()
        input_file = args['file']
        file_content = input_file.read().decode('utf-8')

        data = file_content.split("\n")

        outputs = list()
        for ind in range(1, len(data[1:]), 2):
            time1 = data[ind]
            time2 = data[ind+1]
            outputs.append(str(absolute_time_diff(time1, time2)))
        
        return jsonify({"result": outputs})

api.add_resource(FileReader, '/')

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')