update-inv:
	python inventory.py | tee inventory/cocalc.ini

run:
	ansible-playbook -i inventory/cocalc.ini cocalc.yml
