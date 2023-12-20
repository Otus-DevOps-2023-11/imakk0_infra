# imakk0_infra
imakk0 Infra repository

### Connect to someinternalhost
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
