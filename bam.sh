#!/bin/bash

# credits to the interwebs, use as you please
# composed by R Menke

# INSTALL
if [ "$1" == "install" ]; then

  execName=$(basename $2);
  execPath=$BAMPATH/src/$2/$execName.sh;

  if [ -f "$execPath" ]; then
    cp $execPath $BAMPATH/bin/$execName
    chmod 700 $BAMPATH/bin/$execName
  else
    echo "$execPath not found.";
  fi

  # CREATE
elif [ "$1" == "create" ]; then

  mkdir -p $BAMPATH/src/$2;
  touch $BAMPATH/src/$2/$(basename $2).sh;
  echo "#!/bin/bash" >> $BAMPATH/src/$2/$(basename $2).sh;

  # GET
elif [ "$1" == "get" ]; then

  # flags
  if [ "$2" == "-u" ] || [ "$3" == "-u" ]; then
    update=true;
  fi

  if [ "$2" == "-d" ] || [ "$3" == "-d" ]; then
    downloadOnly=true;
  fi

  if [ "$update" == true ]; then
    shift;
  fi

  if [ "$downloadOnly" == true ]; then
    shift;
  fi
  #flags

  # clone if the dir doesnt exist
  if [ ! -d "$BAMPATH/src/$2" ]; then
    git clone https://$2 $BAMPATH/src/$2 ||
    { exit 1; };

    cd $BAMPATH/src/$2 &&
    {
      git checkout origin/master
    } &> /dev/null;
  fi

  # fetch/pull if update flag is set
  if [ "$update" == true ]; then
    cd $BAMPATH/src/$2 &&
    git fetch &&
    git pull origin master ||
    { exit 1; };

    {
      git checkout origin/master
    } &> /dev/null;
  fi

  # only install when -d flag isn't set
  if [ ! "$downloadOnly" == true  ]; then
    bam install $2;
  fi

  # RUN
elif [ "$1" == "run" ]; then

  execName=$(basename $2);
  execPath=$BAMPATH/src/$2/$execName.sh;
  bash $execPath ${@:3};

  # INFO
else

  echo "";
  echo "create    :->   create empty bash script in src dir";
  echo "get       :->   clone git repo into BAMPATH/src/";
  echo "install   :->   install in BAMPATH";
  echo "run       :->   run executable from src";
  echo ""

fi
