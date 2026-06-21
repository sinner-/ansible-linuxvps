Working as of Fedora 44.

#### Bootstrap
1. `mv hosts.example hosts`
1. `sed -i 's/1.1.1.1/<your VPS external IP>/' hosts`
1. `mv host_vars/cloud.example host_vars/cloud`
1. Configure your `host_vars/cloud`
1. `ANSIBLE_SSH_ARGS="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" ansible-playbook -i hosts bootstrap.yml`
1. During bootstrap, the WireGuard role generates the server key, starts WireGuard, saves `wireguard.public_key` in `host_vars/cloud`, and pauses with a peer stanza. Add that peer to your local WireGuard config, confirm the tunnel, then press Enter to continue.
1. `sed -i 's/<your VPS external IP>/10.8.0.1/' hosts`

### Regular operation

1. `ansible-playbook -i hosts site.yml`
