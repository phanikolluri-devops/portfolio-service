docker-build:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 741957640498.dkr.ecr.us-east-1.amazonaws.com
	docker build -t 741957640498.dkr.ecr.us-east-1.amazonaws.com/portfolio-service:latest .
	docker push 741957640498.dkr.ecr.us-east-1.amazonaws.com/portfolio-service:latest


eks-deploy:
	aws eks update-kubeconfig --name dev
	helm upgrade -i  portfolio-service helm -f helm/values/portfolio-service.yml



