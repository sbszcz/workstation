# Workstation
My personal workstation setup as ansible playbooks.

# Prerequisites

- install ansible

  ```bash
  ~ yay ansible
  ```
- obtain secrets and vault_key from keepass

# Execute main playbook

```bash
~ ansible-playbook main.yaml --ask-become-pass --vault-password-file ~/.vault_key
```

# How To ...

## ... setup ansible vault and encrypt single string (e.g. ldap_pass)

```
~ cat secrets/ldap_pass.secret | ansible-vault encrypt_string --stdin-name 'ldap_pass' --vault-password-file ~/.vault_key
```

## ... setup ansible vault and encrypt binary file

```
~ ansible-vault encrypt ta-client1dev.key.enc --vault-password-file ~/.vault_key
```

## ... edit encrypted file

```
~ ansible-vault edit files/client1-vpn/client1-vpn.nmconnection.enc --vault-password-file ~/.vault_key
```
