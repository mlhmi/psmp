# PSMP Ansible Role
This Ansible Role will deploy and install CyberArk Privileged Session Manager including the pre-requisites, application, hardening and connect to an existing Vault environment.

## Requirements
- Remote host operating system 
   - Red Hat Enterprise Linux 6.x versions (6.4 and above) and 7.x versions,
   - CentOS Linux 6.x versions (6.4 and above) and 7.x versions, 
   - Or SUSE Linux Enterprise Server 11 SP4, 12, 12 SP1, 12 SP2 versions.
- SSH open on port TCP/22 on the remote host
- Pywinrm is installed on the workstation running the playbook
- The workstation running the playbook must have network connectivity to the remote host
- The remote host must have Network connectivity to the CyberArk vault and the repository server
  - 1858 port outbound to trhe vault server
- Account with root permissions access to the remote host
- PSMP CD image


### Flow Variables
Variable                         | Required     | Default                                   | Comments
:--------------------------------|:-------------|:------------------------------------------|:---------
psmp_prerequisites               | no           | false                                     | Install PSMP pre requisites
psmp_install                     | no           | false                                     | Install PSM
psmp_postinstall                 | no           | false                                     | PSMP post install role
psmp_hardening                   | no           | false                                     | Apply PSMP hardening
psmp_registration                | no           | false                                     | Connect PSMP to the Vault
psmp_upgrade                     | no           | false                                     | N/A
psmp_clean                       | no           | false                                     | N/A
psmp_uninstall                   | no           | false                                     | N/A

### Deployment Variables
Variable                         | Required     | Default                                              | Comments
:--------------------------------|:-------------|:-----------------------------------------------------|:---------
vault_ip                         | yes          | None                                                 | Vault IP to perform registration
vault_port                       | no           | **1858**                                             | Vault port
vault_username                   | no           | **administrator**                                    | Vault username to perform registration
vault_password                   | yes          | None                                                 | Vault password to perform registration
secure_vault_password            | no           | None                                                 | Secure Vault password to perform registration
dr_vault_ip                      | no           | None                                                 | Vault DR IP address to perform registration
accept_eula                      | yes          | **No**                                               | Accepting EULA condition (Yes/No)
psmp_zip_file_path               | yes          | None                                                 | CyberArk PSMP installation Zip file package path

## Dependencies
None

## Usage
The role consists of a number of different tasks which can be enabled or disabled for the particular
run.

`psmp_prerequisites`

This task will run the PSMP pre-requisites steps.

`psmp_install`

This task will deploy the PSMP to required folder and validate successful deployment.

`psmp_postinstall`

This task will run the PSMP post installation steps.

`psmp_hardening`

This task will run the PSMP hardening process.

`psmp_registration`

This task will perform registration with active Vault.

`psmp_validateparameters`

This task will validate which PSMP steps have already occurred on the server to prevent repetition.

`psmp_clean`

This task will clean the configuration (inf) files from the installation, delete the
PSMP installation logs from the Temp folder and delete the cred files.


## Example Playbook
Below is an example of how you can incorporate this role into an Ansible playbook
to call the PSMP role with several parameters:

```
---
- include_role:
    name: psmp
  vars:
    - psmp_prerequisites: true
    - psmp_install: true
    - psmp_postinstall: true
    - psmp_hardening: true
    - ps_clean: true
```

## Running the playbook:
For an example of how to incorporate this role into a complete playbook, please see the
**[pas-orchestrator](https://github.com/cyberark/pas-orchestrator)** example.

## License
Apache License, Version 2.0
