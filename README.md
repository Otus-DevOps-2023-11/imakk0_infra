# imakk0_infra
imakk0 Infra repository

### Connect to someinternalhost from bastion
##### Always actions need to configure on **bastion** host (VM with a public IP)

1. Execute ```man ssh```
2. ```ssh -A``` is the key for forwarding, but we can describe the same behavor via config file
3. Add file ```echo > ~/.ssh/config```
4. Add follow params in ```~/.ssh/config``` use vim:
```
Host someinternalhost
		HostName <someinternalhost_IP>
		User appuser
		Port 22
 		IdentityFile ~/.ssh/appuser
```

5. Create ```~/.ssh/appuser```
6. Add "OPEN SSH PRIVATE KEY" to ```~/.ssh/appuser``` from localhost same key-file
7. Configure read-only permissions for key-file: ```chmod 0400 appuser```
8. Execute ``` ssh appuser@someinternalhost```
9. ...PROFIT!

### Virtual machines addresses

bastion_IP: 51.250.87.149

someinternalhost_IP: 10.128.0.8

### Reddit testapp

testapp_IP = 51.250.94.217

testapp_port = 9292

### Yandex Cloud CLI
#### Create instance with post-install config-cloud scripts on OS Windows 11

My exemple uses directives ```packages:``` and ```runcmd``` for exectute scripts

1. CLI:
```yc compute instance create --name imakk0-sandbox --hostname imakk0-sandbox --memory=4 --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 --metadata-from-file user-data=C:\Users\mkukolev\UnWork\imakk0_config.yml --metadata serial-port-enable=1```

2. Must change path from ```--metadata-from-file user-data=C:\Users\mkukolev\UnWork\imakk0_config.yml```  to yor file path ```imakk0_config.yml``` to execution scenario
3. File ```imakk0_config.yml``` is located at ```./``` of this repository
4. After above steps, your cloud-config for VM be look like:
```
#cloud-config
package_update: true
packages:
 - ruby-full
 - ruby-bundler
 - build-essential
 - mongodb
 - git
runcmd:
 - sudo systemctl start mongodb
 - sudo systemctl enable mongodb
 - sudo git clone -b monolith https://github.com/express42/reddit.git /home/yc-user/reddit
 - sudo chmod 655 /home/yc-user/reddit/*
 - cd /home/yc-user/reddit && bundle install
 - puma -d

datasource:
 Ec2:
  strict_id: false
ssh_pwauth: no
users:
- name: yc-user
  sudo: ALL=(ALL) NOPASSWD:ALL
  shell: /bin/bash
  ssh_authorized_keys: <rsa_authorized_keys>

- ssh-rsa: <public_rsa_key>
```
5. After creating instance you need to wait 1-2 minutes for post-install scripts execution


### Packer base
 - Scripts [deploy.sh](https://github.com/Otus-DevOps-2023-11/imakk0_infra/blob/packer-base/config-scripts/deploy.sh), [install_mongodb.sh](https://github.com/Otus-DevOps-2023-11/imakk0_infra/blob/packer-base/config-scripts/install_mongodb.sh), [install_ruby.sh](https://github.com/Otus-DevOps-2023-11/imakk0_infra/blob/packer-base/config-scripts/install_ruby.sh) were moved to [config-scripts](https://github.com/Otus-DevOps-2023-11/imakk0_infra/tree/packer-base/config-scripts)
 - Created template [immutable.json](https://github.com/Otus-DevOps-2023-11/imakk0_infra/blob/packer-base/packer/immutable.json) for creating image with a ```packer```
 - Created ```.gitignore``` file, which ignoring actions for ```packer/variables.json```
 - Created script [create-reddit-vm.sh](https://github.com/Otus-DevOps-2023-11/imakk0_infra/blob/packer-base/config-scripts/create-reddit-vm.sh) for creating instance VM in Yandex Cloud with use image
 - Created [variables.json.examples](https://github.com/Otus-DevOps-2023-11/imakk0_infra/blob/packer-base/packer/files/variables.json.examples) for variables list.
 - Created [imakk0-reddit.service](https://github.com/Otus-DevOps-2023-11/imakk0_infra/blob/packer-base/packer/files/imakk0-reddit.service) for systemd unit launch
