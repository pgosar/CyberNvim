# load in aliases
aliaspath=$DOTFILES/other/.aliasrc
if [ -f "$aliaspath" ]; then
    source "$aliaspath"
fi

# disable command not found message when loading in plugins
command_not_found_handle() {
    echo "I don't know what '$1' is." > /dev/null
    return 127;
}

# load in plugins
in=${1:-$HOME/output.txt}
# expand variables to full filepath into new txt
envsubst < $DOTFILES/other/plugins.txt > $in
[ ! -f "$in" ] && { echo "$0 - File $in not found.";}
while read file ;
do
  # run the file on each line of txt and load it in
  source "$file"
    if [ -f "$file" ]; then
      source "$file" &> /dev/null
    else 
      echo "${file##*/} not loaded"
    fi
done < "${in}"
# delete created txt file
rm -f $in > /dev/null

# reset command not found to its original (taken from ubuntu source code)
command_not_found_handle () 
{ 
    if [ -x /usr/lib/command-not-found ]; then
        /usr/lib/command-not-found -- "$1";
        return $?;
    else
        if [ -x /usr/share/command-not-found/command-not-found ]; then
            /usr/share/command-not-found/command-not-found -- "$1";
            return $?;
        else
            printf "%s: command not found\n" "$1" 1>&2;
            return 127;
        fi;
    fi
}
