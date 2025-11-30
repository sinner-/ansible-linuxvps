Working as of Fedora 43.

#### Bootstrap
1. `mv hosts.example hosts`
1. `sed -i 's/1.1.1.1/<your VPS external IP>/' hosts`
1. `mv host_vars/cloud.example host_vars/cloud`
1. Configure your `host_vars/cloud`
1. `ansible-playbook -i hosts bootstrap.yml`
1. `sed -i 's/<your VPS external IP>/10.8.0.1/' hosts`

### Regular operation

1. `ansible-playbook -i hosts site.yml`
