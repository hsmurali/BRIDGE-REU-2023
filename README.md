1. SSH into the Nexus Cluster
- userid
- submission nodes in format of: nexuscbcb[00,01].umiacs.umd.edu

EX) in Terminal or Command Prompt, type:
```
ssh someuser68@nexuscbcb00.umiacs.umd.edu
```
- will be propted to provide authentification
- if connected on vpn, no extra step

2. Mounting remote directories into PC
    1. Downloading and Installing SSHFS
    (MacOS)
    https://github.com/winfsp/sshfs-win (Windows)
    2. Mounting drives in MACOS
    3. Mounting drives in Windows 
    - Map Network Drive option from "This PC"

3. Creating a conda environment