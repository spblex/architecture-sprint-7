# Создание пользователя DevOps
openssl genrsa -out devops.key 2048
openssl req -new -key devops.key -out devops.csr -subj "/CN=devops/O=group1/O=group2"
openssl x509 -req -in devops.csr -CA /path/to/ca.crt -CAkey /path/to/ca.key -CAcreateserial -out devops.crt -days 365
kubectl config set-credentials devops-user --client-certificate=devops.crt --client-key=devops.key
kubectl config set-context devops-user-context --cluster=minikube --user=devops-user

# Создание пользователя Разработчик
openssl genrsa -out engineer.key 2048
openssl req -new -key engineer.key -out engineer.csr -subj "/CN=engineer/O=group1/O=group2"
openssl x509 -req -in engineer.csr -CA /path/to/ca.crt -CAkey /path/to/ca.key -CAcreateserial -out engineer.crt -days 365
kubectl config set-credentials engineer-user --client-certificate=engineer.crt --client-key=engineer.key
kubectl config set-context engineer-user-context --cluster=minikube --user=engineer-user