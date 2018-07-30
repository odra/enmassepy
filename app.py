from flask import Flask, request


app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def entrypoint():
    if request.method == 'GET':
        return get()
    return post()


def get():
    return 'get'


def post():
    return 'post'
