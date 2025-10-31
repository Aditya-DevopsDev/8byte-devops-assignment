from flask import Flask, request, jsonify
import boto3
import os

app = Flask(__name__)

# AWS LocalStack Config
S3_ENDPOINT = "http://localhost:4566"
BUCKET_NAME = "8byte-devops-assignment-bucket"

# Create S3 client pointing to LocalStack
s3 = boto3.client(
    "s3",
    aws_access_key_id="test",
    aws_secret_access_key="test",
    region_name="us-east-1",
    endpoint_url=S3_ENDPOINT
)

@app.route("/")
def home():
    return "? Flask app connected to LocalStack S3!"

@app.route("/upload", methods=["POST"])
def upload_file():
    if "file" not in request.files:
        return jsonify({"error": "No file provided"}), 400
    file = request.files["file"]
    s3.upload_fileobj(file, BUCKET_NAME, file.filename)
    return jsonify({"message": f"File '{file.filename}' uploaded successfully!"})

@app.route("/list")
def list_files():
    objects = s3.list_objects_v2(Bucket=BUCKET_NAME)
    if "Contents" not in objects:
        return jsonify({"files": []})
    return jsonify({"files": [obj["Key"] for obj in objects["Contents"]]})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
