# Bam : bash application manager
Golang style commands for Bash Scripts

If you are not familiar with Go : google is your best friend!


Since it is a little command line tool to manage bash scripts, it can almost install itself.

# Install

Create directories :
```
 mkdir -p anywhereYouLike/MyBashScriptDirectory/src/github.com/romainmenke/
```

I chose :
```
 mkdir -p $HOME/Bam/src/github.com/romainmenke/
```

Add to .bash_profile (or equivalent) :
```
 export BAMPATH=anywhereYouLike/MyBashScriptDirectory

 export PATH=$PATH:$BAMPATH/bin
```

I chose :
```
 export BAMPATH=$HOME/Bam
```

Run Commands :
```
source .bash_profile

git clone https://github.com/romainmenke/bam $BAMPATH/src/github.com/romainmenke/bam

bash $BAMPATH/src/github.com/romainmenke/bam/bam.sh install github.com/romainmenke/bam

```

You are good to go!


# Commands (bam)
```
 info || help

 create    :->   create empty bash script in src dir
 get       :->   clone git repo into BAMPATH/src/ and run bam install
 install   :->   install in BAMPATH
 run       :->   run executable from source
```

### Sub Commands

`$ bam get -d ...` don't install, only download
`$ bam get -u ...` update from remote

# Licence

Use it however you like
