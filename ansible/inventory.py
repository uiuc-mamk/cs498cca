import os
import json
import subprocess


def _get_cocalc_instance_public_ip():
    output = subprocess.check_output('bash -c "cd ../terraform && source env.sh && terraform output -json"', shell=True)
    state = json.loads(output)
    return state['cocalc_public_ip']['value']


def main():
    private_key_file = os.path.abspath('../terraform/keys/id_rsa')
    cocalc_public_ip = _get_cocalc_instance_public_ip()
    print('[cocalc]')
    print('{} ansible_ssh_user=ubuntu ansible_ssh_private_key_file={}'.format(cocalc_public_ip, private_key_file))


if __name__ == '__main__':
    main()

