from flask import Flask 

app = Flask(__name__)
#--------------------

#--------------------
@app.route('/')
@app.route('/home')
def Home():
    return '<h1>this is home page</h1>'
    
@app.route('/hello')
def hello():
    return '<h1>"Welcome to CSM3401-IoT Computing course..!</h1>'

if __name__  == '__main__':
    app.run(debug=True)