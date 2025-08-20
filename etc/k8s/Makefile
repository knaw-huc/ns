PHONY: deploy restart status logs

deploy:
	for f in *.yml; do kubectl apply -f $$f --namespace ns --context k8s-10-26-2-0; done
	kubectl rollout restart deployment/ns --namespace ns --context k8s-10-26-2-0

restart:
	kubectl rollout restart deployment/ns --namespace ns --context k8s-10-26-2-0

status:
	kubectl get pods --namespace ns --context k8s-10-26-2-0

logs:
	kubectl logs pod/$(shell kubectl get pods --namespace ns --context k8s-10-26-2-0 | tail -n 1 | cut -d " " -f 1) --namespace ns --follow --context k8s-10-26-2-0
