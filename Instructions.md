# **Instructions**

1. Install the Chocolatey Package Manager from: https://community.chocolatey.org/
    * This will be required to run the **choco.ps1** installation script later. 
    
    2. Run 

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

    * Open a terminal, I recomend changing directory to downloads, then run:
        ```sh
        git clone https://github.com/Alexdoesvoices/configs 
        ```