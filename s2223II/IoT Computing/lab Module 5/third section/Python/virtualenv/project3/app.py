from flask import Flask, render_template

app = Flask(__name__)
@app.route('/')
def myapp():
 return render_template("index.html")
@app.route('/hello/<visitor>')
def hello(visitor):
 return render_template("index.html", visitor=visitor)
@app.route('/dashboard')
def dashboard():
 return render_template("dashboard.html")
@app.route('/tables')
def tables():
 return render_template("tables.html")

if __name__ == '__main__':
 app.run(host='0.0.0.0', debug=True)
