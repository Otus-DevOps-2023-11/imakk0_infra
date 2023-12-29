yc compute instance create \
  --name reddit-vm1 \
  --network-interface subnet-id=e9btnsn4b16id32l3u1c,nat-ip-version=ipv4 \
  --create-boot-disk image-id=fd8q52s2eb3m3ff10alk,type=network-hdd,size=20 \
  --ssh-key ~/.ssh/yc-user.pub \
  --memory 2 \
  --cores 2 \
  --preemptible
