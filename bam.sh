#!/bin/bash

# credits to the interwebs, use as you please
# composed by R Menke

# INSTALL
if [ "$1" == "install" ]; then

  execName=$(basename $2)
  execPath=$BAMPATH/src/$2/$execName.sh

  if [ -f "$execPath" ]
  then
    cp $execPath /usr/local/bin/
    mv /usr/local/bin/$execName.sh $BAMPATH/bin/$execName
    chmod 700 $BAMPATH/bin/$execName
  else
    echo "$execPath not found."
  fi

# CREATE
elif [ "$1" == "create" ]; then

  mkdir -p $BAMPATH/src/$2
  touch $BAMPATH/src/$2/$(basename $2).sh
  echo "#!/bin/bash" >> $BAMPATH/src/$2/$(basename $2).sh

# GET
elif [ "$1" == "get" ]; then

  git clone https://$2 $BAMPATH/src/$2
  bam install $2

# RUN
elif [ "$1" == "run" ]; then

  execName=$(basename $2)
  execPath=$BAMPATH/src/$2/$execName.sh
  bash $execPath ${@:3}

# INFO
elif [ "$1" == "help" ] || [ "$1" == "info" ]; then

  echo ""
  echo "create    :->   create empty bash script in src dir"
  echo "get       :->   clone git repo into BAMPATH/src/"
  echo "install   :->   install in BAMPATH"
  echo "run       :->   run executable from src"
  echo ""

fi




# # PUT
# elif [ "$1" == "put" ]; then
#
#   repo=$(basename $2)
#   gitUser=$(basename $(dirName $2))
#   gitProvider=$(dirName $(dirName $2))
#   repoUrl="https://$gitUser@$gitProvider/$gitUser/$repo"
#
#   echo "Repo: $repo"
#   echo "User: $gitUser"
#   echo "Provider: $gitProvider"
#
#   tempPWD=$pwd
#   cd $BAMPATH/src/$2
#
#   if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
#     git init
#   fi
#
#   # echo "password:"
#   # read -s gitPassword
#
#   if git ls-remote "$repoUrl" &> /dev/null; then
#     echo "There is already a repository named $repo for $gitProvider/$gitUser"
#   else
#     echo "NOT FOUND"
#   fi
#
#
#   cd $tempPWD
