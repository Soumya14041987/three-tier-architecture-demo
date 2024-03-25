#Add the NGINX Ingress controller Helm chart repository

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

#Install the NGINX Ingress controller
helm install my-release ingress-nginx/ingress-nginx

**Replace my-release with the name you want to give to your release.

#Verify the installation

kubectl get pods -n default

#Uninstall the current deployment
 helm uninstall robot-shop -n default

#Install the NGINX Ingress controller in the robot-shop namespace
 kubectl create namespace robot-shop

#Then, install the Ingress controller in the robot-shop namespace
 helm install robot-shop ingress-nginx/ingress-nginx -n robot-shop

#Verify the installation by namespace and you will get the Load-Balancer pod details 
 kubectl get pods -n robot-shop

#Now navigate to ingress.yaml file and change the ingress class name as :Nginx 

Ingress.yaml:-
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  namespace: robot-shop
  name: robot-shop
spec:
  ingressClassName: nginx
  rules:
    - http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: web
                port:
                  number: 8080


