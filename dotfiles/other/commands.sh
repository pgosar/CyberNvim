gadd () {
  git add $1 && git status
}

# simulates typing
typesim () {
  echo "$1" | pv -qL 12
}

# cd directly into new directory
mkcd () {
  mkdir "$1" && cd "$1"
}

# ls right after z command
zl () {
  z "$1" && ls
}

# ls right after cd
cl () {
  cd "$@" && ls
}

# go up directories
up (){
  DEEP=$1;
  [ -z "${DEEP}" ] && { DEEP=1; };
  for i in $(seq 1 ${DEEP});
    do cd ../;
  done;
}

imagePDF () {
  for i in `find . -type d`
    do
      convert "${i}/*jpg" "${i}/*png" ${i}.pdf > /dev/null 2>&1
  done
}

mostused () {
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

grip () {
  python3 ~/grip/grip/__main__.py "$1"
}
