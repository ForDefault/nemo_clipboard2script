# nemo_clipboard2script
Nemo context menu action: take script from your clipboard and run it where your nemo folder is open. Also provides a way to delete afterwards if desired.  



# Installation Guide: nemo_clipboard2script


*This nemo_action:* 
> Create and run a script which exists in your clipboard. 


- **Self-Cleaning**: Post-installation, the script engages in a thorough clean-up process, deleting the cloned repository from your home directory. This action ensures your workspace remains uncluttered, preserving the sanctity and available space of your home directory without leaving behind any residual files or folders.

## Quick Start
 ### SingleCommand Install

To install the Nemo action **on Linux Mint**, open a terminal and execute this **SingleCommand**:

```
REPO_URL="https://github.com/ForDefault/nemo_clipboard2script.git" && \
REPO_NAME=$(basename $REPO_URL .git) && \
git clone $REPO_URL && \
cd $REPO_NAME && \
full_path=$(pwd) && \
sudo apt-get update && sudo apt-get install -y xclip && \
sed -i "s|/home/\$USER|/home/$USER|g" $full_path/clipboard2script.nemo_action && \
sed -i "s|/home/\$USER|/home/$USER|g" $full_path/delete_clipboard2script.nemo_action && \
mv $full_path/clipboard2script.sh /home/$USER/.local/share/nemo/actions/ && \
mv $full_path/clipboard2script.nemo_action /home/$USER/.local/share/nemo/actions/ && \
mv $full_path/delete_clipboard2script.sh /home/$USER/.local/share/nemo/actions/ && \
mv $full_path/delete_clipboard2script.nemo_action /home/$USER/.local/share/nemo/actions/ && \
chmod +x /home/$USER/.local/share/nemo/actions/clipboard2script.sh && \
chmod +x /home/$USER/.local/share/nemo/actions/delete_clipboard2script.sh && \
chmod +x /home/$USER/.local/share/nemo/actions/clipboard2script.nemo_action && \
chmod +x /home/$USER/.local/share/nemo/actions/delete_clipboard2script.nemo_action && \
cd .. && rm -rf $REPO_NAME

```

## Usage

While in context menu from nemo. Select the clipboard2script and a script copied in your clipboard will go into the current direcotry, be made, chmod +x, and be launched. If you go into the context menu again you will see an option to delete that script. A terminal should launch and have you confirm that.  

#### My Other Nemo Actions:
- **[nemo_copy_folder_content_list](https://github.com/ForDefault/nemo_copy_folder_content_list)**
- [nemo_full_extension_path](https://github.com/ForDefault/nemo_full_extension_path)
- [nemo_contains_and_scroll](https://github.com/ForDefault/nemo_contains_and_scroll)


## Post-Installation

You might need to restart Nemo(I dont but you can). 
This command quits Nemo, and you can then reopen it normally.

```
nemo -q 
```



