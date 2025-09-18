# **Alexander's Configs**

This is a online repistory with my config files for certain applications, along with package manger install scripts and other utility/installation scripts of my making.

In these files there will be some paths that I have set that will not exist on your machine. (Ex: Ps Drive Locations in the Powsershell Profile.)


# **System Info**

**Operating System: Windows 11**

**Shell: PowerShell**

# **Instructions**

1. Install the Chocolatey Package Manager from: https://community.chocolatey.org/
    * This will be required to run the **choco.ps1** installation script later. 
    
    * Run:

        ```ps
        sudo choco install git   
        ```

2. Configure Git:

    * Open Git Bash, and set your username with:
        ```sh
        git config --global user.name "Username goes Here"
        ```

    * In the same Git Bash window, set your email with:
        ```sh
        git config --global user.email "YOUR_EMAIL"
        ```

    * Open a **Administrator** Terminal then run:
        ```ps
        cd downloads
        ```
        After that then run:
        ```sh
        git clone https://github.com/Alexdoesvoices/configs 
        ```
        Then:
        ```ps
        cd .\configs\        
        ```

3. Now we are going to run the Install Scripts:

    ```ps
    cd '.\Powershell & Powershell Scripts\'
    ```

    * Now for the Chocolaty Packages Install script:
        * Type:
            ```ps
            .\choco.ps1
            ```



[a relative](https://github.com/Alexdoesvoices/configs/blob/master/Other%26Screenshots/Other_Installs.md)


