# aliases
aliaspath=$DOTFILES/other/.aliasrc
if [ -f "$aliaspath" ]; then
    source "$aliaspath"
fi

in=${1:-$DOTFILES/other/output.txt}
envsubst < $DOTFILES/other/plugins.txt > $in
[ ! -f "$in" ] && { echo "$0 - File $in not found.";}
while read file ;
do
  source "$file"
    if [ -f "$file" ]; then
      source "$file"
    else 
      echo "${file##*/} not loaded"
    fi
done < "${in}"
rm -f $in > /dev/null