docker build -t shaggydog/multi-client:latest -t shaggydog/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t shaggydog/multi-server:latest -t shaggydog/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t shaggydog/multi-worker:latest -t shaggydog/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push shaggydog/multi-client:latest
docker push shaggydog/multi-client:$SHA
docker push shaggydog/multi-server:latest
docker push shaggydog/multi-server:$SHA
docker push shaggydog/multi-worker:latest
docker push shaggydog/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=shaggydog/multi-server:$SHA
kubectl set image deployments/client-deployment client=shaggydog/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=shaggydog/multi-worker:$SHA