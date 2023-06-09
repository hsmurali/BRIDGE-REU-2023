## SSH into the Nexus Cluster:

1. userid
2. submission nodes: nexuscbcb[00,01].umiacs.umd.edu

    In Terminal or Command Prompt, type:

    ```
    ssh someuser68@nexuscbcb00.umiacs.umd.edu
    ```
3. will be propted to provide authentification
4. if connected on vpn, no extra step

## Mounting remote directories into PC

1. Download and Install SSHFS 
    - [MACOS](https://osxfuse.github.io/)
    - [WINDOWS](https://github.com/winfsp/sshfs-win)
2. Mounting drives in MACOS

    ```
    mkdir /users/someuser68-local/Mount
    sshfs someuser68@nexuscbcb00.umiacs.umd.edu:/fs/cbcb-scratch/someuser68/ Mount
    ```
3. Mounting drives in Windows 
    - Map Network Drive option from "This PC"

## Creating a conda environment

```
module load conda
conda create --prefix <path-to-installation/environment-name>  # e.g. conda create --prefix /fs/cbcb-scratch/someuser68/Minimap2
source activate /fs/cbcb-scratch/someuser68/Minimap2
conda install -c bioconda minimap2
```
    
## Test data can be found at

``` /fs/cbcb-scratch/hsmurali/REU_2023/ ```
