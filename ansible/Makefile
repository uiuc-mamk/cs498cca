update-inv:
	python inventory.py | tee inventory/cocalc.ini

run:
	ansible-playbook -vv -i inventory/cocalc.ini cocalc.yml

ssh:
	ssh -i ../terraform/keys/id_rsa ubuntu@18.206.231.251
