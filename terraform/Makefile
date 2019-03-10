clean:
	rm -f plan

plan:
	terraform plan -var-file=mamk.tfvars -out plan

apply: plan
	terraform apply plan
	rm -f plan
