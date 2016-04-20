# rmbash
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
 mkdir -p $HOME/RMBash/src/github.com/romainmenke/
```
 
Add to .bash_profile :
```
 export RMBASHPATH=anywhereYouLike/MyBashScriptDirectory
 export Path="$Path:RMBASHPATH/bin"
```

I chose : 
```
 export RMBASHPATH=$HOME/RMBash
 export Path="$Path:RMBASHPATH/bin"
```

Run Commands :
```
source .bash_profile

git clone https://github.com/romainmenke/rmbash $RMBASHPATH/src/github.com/romainmenke/rmbash

chmod 700 $RMBASHPATH/src/github.com/romainmenke/rmbash/rmbash.sh

$RMBASHPATH/src/github.com/romainmenke/rmbash/rmbash.sh install github.com/romainmenke/rmbash

```

You are good to go!


# Commands (rmbash)
```
 info || help 

 create    :->   create empty bash script in src dir
 get       :->   clone git repo into RMBASHPATH/src/
 install   :->   install in /usr/local/bin/
 uninstall :->   remove from /usr/local/bin/
 build     :->   install in RMBASHPATH and make script executable from rmbash
 run       :->   run executable from RMBASHPATH/bin
```

# Tools

[rmswift](https://github.com/romainmenke/rmswift) : golang style get command for Swift
```
rmbash get github.com/romainmenke/rmswift
```

[rmcloak](https://github.com/romainmenke/rmcloak) : easy hide/show hidden files on mac
```
rmbash get github.com/romainmenke/rmcloak
```

# Licence

Use it however you like

# Notes

I was contemplating a "put" command but decided not to as it would promote username and password login, which is not ideal and it would have made this tool not-simple. 

The "get" command is just sugar for "git clone". It is not perfect.
