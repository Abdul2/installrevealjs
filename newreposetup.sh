

#!/bin/sh

#make this script excutable
chmod +x createnewrepo.sh

#create workspace
sudo mkdir workspace


#install git and curl
sudo apt-get install git curl

#create keys  if  they dont exist
cd ~/.ssh/
ssh-keygen  -t rsa -b 4096   -q -N "" -C  "abdulrashid2@gmail.com"
pub_key=$(cat ~/.ssh/id_rsa.pub)
echo $pub_key

cd ~/

#tell github who you are
git config user.email "abdulrashid2@gmail.com"
git config user.name "Abdul2"

#curl --user "caspyin" https://api.github.com/users/caspyin
curl --user "user=Abdul2&login=$password&token=$new_repo" -X POST --data '{"title":"key_installrevealjs","key":"$pub_key"}' https://api.github.com/user/keys/ #this will require you to  enter password
#curl --data "title=new_key&&key=$pub_key&&read_only=true"  /repos/:owner/:repo/keys

#cat ~/.ssh/id_*.pub | ssh Abdul2@github.com 'cat > .ssh/authorized_keys'


# create a new repo and  upload this script into the new repo
curl -u 'Abdul2' https://api.github.com/user/repos -d '{"name":"installrevealjs"}'

#create local repo
cd ~/workspace 
sudo mkdir  reveal.js
cd reveal.js
sudo cp ~/createnewrepo.sh  ./newreposetup.sh
sudo git init
sudo git add  newreposetup.sh
sudo git commit -m 'first'

sudo git remote add origin  https://github.com/Abdul2/installrevealjs.git 
sudo git push origin master
