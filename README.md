## SSH into the Nexus Cluster:

This step will show you how to access CBCB's cluster with ssh. To successfully log in, you must have a sponsored UMIACS account as well as multi-factor authentification set up. The command for ssh consists of the <user id>, followed by the host address. For CBCB, we use: nexuscbcb[00,01].umiacs.umd.edu.

In Terminal or Command Prompt, type:

    ssh someuser68@nexuscbcb00.umiacs.umd.edu

The prompt will ask for user's password, as well as Duo two-factor login information. (You should have Duo Push set up at this point.)
Alternatively, two-factor login step can be skipped if you're connected to UMIACS vpn.

## Mounting remote directories into PC

In addition to accessing the remote directories on your terminal, mounting them onto your local system can come in handy. We will be using SSHFS for this step. Specific instructions will differ based on your operating system.

1. Download and Install SSHFS 
    - [MACOS](https://osxfuse.github.io/)
    - [WINDOWS](https://github.com/winfsp/sshfs-win)
2. Mounting drives in MACOS

    ```
    mkdir /users/someuser68-local/Mount
    sshfs someuser68@nexuscbcb00.umiacs.umd.edu:/fs/cbcb-scratch/someuser68/ Mount
    ```
3. Mounting drives in Windows 
    1. Find "Map Network Drive" option from "This PC"

    <img src="https://github.com/hsmurali/BRIDGE-REU-2023/assets/53529173/f5af6938-a7f0-4e56-bff3-d39b990c9bb1" width=30%>

    2. Choose a letter for Drive and type in following for Folder: 
        ```
        \\sshfs\someuser68@nexuscbcb00.umiacs.umd.edu
        ```
        If you want to mount the scratch foler, use the following address instead:
        ```
        \\sshfs\someuser68@nexuscbcb00.umiacs.umd.edu/../../fs/nexus-scratch/someuser68
        ```
        Note that the actual address to the scratch folder uses a different syntax than that of Window's. Make sure the correct "slash" is used. 
    
    3. Check the box for "Connect using different credentials" then click "Finnish." 

    <img src="https://github.com/hsmurali/BRIDGE-REU-2023/assets/53529173/773342f4-7fdf-4e15-a917-b6e6714e20c7" width=45%>
    
    4. A prompt will pop up asking for credentials. Put your UMIACS id and password.
    
    <img src="https://github.com/hsmurali/BRIDGE-REU-2023/assets/53529173/e718006e-56e5-476c-8a8c-288007980941" width=45%>
    
## Creating a conda environment

The server already has many useful softwares installed and can be used by loading the specific module. You can see all the available modules with the following command:
    ```
    module avail
    ```
You can also check which modules are currently loaded with:
    ```
    module list
    ```
Often you will need to use some tools that are not listed as an available module, but can be managed via conda. Lukcily, conda is one of the preinstalled modules, so we will go ahead and create an environment to install one of the tools we will be using for the next steps.  
    
```
module load conda
conda create --prefix <path-to-installation/environment-name>  # e.g. conda create --prefix /fs/cbcb-scratch/someuser68/Minimap2
source activate /fs/cbcb-scratch/someuser68/Minimap2
conda install -c bioconda minimap2
```
> Note: Whenever you are creating a new environment, make sure you are installing it in your scratch, not home folder. Your home directory does not have a lot of space, and creating conda environment will quickly eat up the space. 

## Test data

Now that our environment is set up, we can try running some tools that are heavily used in bioinformatics pipelines. For this tutorial, we will be using data collected from cutibacterium and human skin metagenomic samples. You can find these dataset under:
    ```
    /fs/cbcb-scratch/hsmurali/REU_2023/ 
    ```
