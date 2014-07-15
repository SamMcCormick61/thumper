from flask import Flask, render_template, request, jsonify
from werkzeug import secure_filename
from config import *
import transform

app = Flask(__name__)

@app.route("/", methods=['GET'])
def main():
	return render_template("index.html", progress=transform.progress())

@app.route("/upload", methods=['POST'])
def upload():
	errors = []
	for filename in request.files:
		f = request.files[filename]
		filename = secure_filename(f.filename)
		e = transform.start(f, filename)
		if e is not None:
			errors.append(e)
	return render_template("errors.html", errors=errors)

@app.route("/progress", methods=["GET"])
def progress():
	done,working,errored = transform.progress()
	return jsonify(done=done, working=working, errored=errored)





if __name__ == "__main__":
	app.debug = DEBUG
	app.run()
