#!/bin/bash
readonly OOISVER="1.1.0"
readonly OOIS="oOWeb-Install-Script $OOISVER"


### SET SOME DIRECTORIES ###
ACCOUNTNR=${USER##*\-}
ACCOUNTDIR=/www/htdocs/$ACCOUNTNR
### /SET SOME DIRECTORIES ###

clear

cd $ACCOUNTDIR

### INSTALL NVM ###
cp /.bashrc /.oo-backup-bashrc
LINESINBASHRC=$(wc -l < /.bashrc) # Find out how many lines .bashrc has and store in variable
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash # INSTALL NVM
tail /.bashrc --l=3 >> $ACCOUNTDIR/.user_bashrc # Move lines added by NVM to .user_bashrc
sed -i ''$LINESINBASHRC',$ {/NVM_DIR/d;} ' /.bashrc # Remove last lines containing "NVM_DIR" in /.bashrc
cd $ACCOUNTDIR
### /INSTALL NVM ###

### PUT SOME MORE ALIASES ###
echo "alias cls='clear'" >> $ACCOUNTDIR/.user_bashrc
echo "ln -sfv /usr/bin/php74 /usr/bin/php" >> $ACCOUNTDIR/.user_bashrc
### /PUT SOME MORE ALIASES ###

### MARK END TIME OF SCRIPT ###
ENDTIME=$(date)
echo "###" >> $ACCOUNTDIR/.user_bashrc
echo "### $OOIS finished at $ENDTIME" >> $ACCOUNTDIR/.user_bashrc
### / MARK END TIME OF SCRIPT ###


####################################
### THE END - no more logic here ###
####################################
echo
echo 
echo ====================================================
echo "Please restart Shell with command 'source /.bashrc'"
echo ====================================================
echo 
echo To use install nodejs/npm through nvm: 
echo "1. Run 'nvm install node' for latest stable release"
echo "2. Run 'nvm use --delete-prefix {installedversion}' to unset prefix option"
echo 
