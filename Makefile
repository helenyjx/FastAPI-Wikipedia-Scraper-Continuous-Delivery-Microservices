install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:
	black *.py mylibrary/*.py

lint:
	pylint --disable=R,C *.py mylibrary/*.py

test:
	python -m pytest -vv --cov=mylibrary --cov=main test_*.py
build:
	docker build -t deploy-fastapi .
deploy:
	#pushes container to ECR (your info will be different!)
	#aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 561744971673.dkr.ecr.us-east-1.amazonaws.com
	#docker build -t cdfastapi .
	#docker tag cdfastapi:latest 561744971673.dkr.ecr.us-east-1.amazonaws.com/cdfastapi:latest
	#docker push 561744971673.dkr.ecr.us-east-1.amazonaws.com/cdfastapi:latest

all: install lint test deploy