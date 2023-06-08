1. SSH into the Nexus Cluster
    - userid
    - submission nodes in format of: nexuscbcb[00,01].umiacs.umd.edu
    (EX) in Terminal or Command Prompt, type:
    ```
    ssh someuser68@nexuscbcb00.umiacs.umd.edu
    ```
    - will be propted to provide authentification
    - if connected on vpn, no extra step

2. Mounting remote directories into PC
    1. Downloading and Installing SSHFS https://osxfuse.github.io/
    (MacOS)
    https://github.com/winfsp/sshfs-win (Windows)
    2. Mounting drives in MACOS
    3. ```
        mkdir /users/someuser68-local/Mount
        sshfs someuser68@nexuscbcb00.umiacs.umd.edu:/fs/cbcb-scratch/someuser68/ Mount
        ```
    4. Mounting drives in Windows 
    - Map Network Drive option from "This PC"

3. Creating a conda environment
    ```
    module load conda
    conda create --prefix <path-to-installation/environment-name>
    e.g. conda create --prefix /fs/cbcb-scratch/someuser68/Minimap2
    source activate /fs/cbcb-scratch/someuser68/Minimap2
    conda install -c bioconda minimap2
    ```
4. Test data can ve found at
    ```/fs/cbcb-scratch/hsmurali/REU_2023/```
