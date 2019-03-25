clean:
	rm -f *.tfplan

plan:
	terraform plan -var-file=mamk.tfvars -out cocalc.tfplan

apply: plan
	terraform apply cocalc.tfplan
	rm -f cocalc.plan
