# **Alexander's Configs**

This is a online repistory with my config files for certain applications, along with package manger install scripts and other utility/installation scripts of my making.

In these files there will be some paths that I have set that will not exist on your machine. (Ex: Ps Drive Locations in the Powsershell Profile.)


# **System Info**

**Operating System: Windows 11**

**Shell: PowerShell**

# **Instructions**

1. Install the Scoop Package Manager from: https://scoop.sh/
    * This will be required to run the **scoopfile.json** installation script later. 
    
    * In a terminal run:

        ```ps
        scoop install git   
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

    * Back in the terminal run:
        ```sh
        cd downloads
        ```
        After that then run:
        ```sh
        git clone https://github.com/Alexdoesvoices/configs 
        ```
		Now:
		```sh
		cd .\configs
		```
        Then:
        ```ps
        scoop import scoopfile.json      
        ```



# **Other Installs**

**[Link to 'Other_Installs.md'](https://github.com/Alexdoesvoices/configs/blob/v3/Other%26Screenshots/Other_Installs.md)**


asdsad