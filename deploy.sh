docker build -t htthecool/multi-client:latest -t htthecool/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t htthecool/multi-server:latest -t htthecool/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t htthecool/multi-worker:latest -t htthecool/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push htthecool/multi-client:latest
docker push htthecool/multi-client:$SHA
docker push htthecool/multi-server:latest
docker push htthecool/multi-server:$SHA
docker push htthecool/multi-worker:latest
docker push htthecool/multi-worker:$SHA
kubectl apply -f k8s
kubectl rollout restart deployment client-deployment
kubectl rollout restart deployment server-deployment
kubectl rollout restart deployment worker-deployment