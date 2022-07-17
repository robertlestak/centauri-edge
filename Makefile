updaterestart:
	git fetch --all && git reset --hard origin/main
	bash manager start services

kube_nginx/certs: kube_services/nginx/certs/edge.centauri.sh.pem kube_services/nginx/certs/edge.centauri.sh.key

kube_services/nginx/certs/edge.centauri.sh.pem:
	kubectl get secret -n istio-system \
		edge.centauri.sh -o json \
		| jq -r '.data["tls.crt"]' \
		| base64 --decode > services/nginx/certs/edge.centauri.sh.pem

kube_services/nginx/certs/edge.centauri.sh.key:
	kubectl get secret -n istio-system \
		edge.centauri.sh -o json \
		| jq -r '.data["tls.key"]' \
		| base64 --decode > services/nginx/certs/edge.centauri.sh.key

services/nginx/docker:
	cd services/nginx && \
	$(MAKE) docker

.PHONY: kube_nginx/certs services/nginx/docker