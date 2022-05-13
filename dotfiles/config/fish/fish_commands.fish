function gadd
  git add $argv && git status
end

# simulates typing
function typesim
  echo $argv | pv -qL 12
end

# cd directly into new directory
function mkcd
  mkdir $argv && cd $argv
end

# ls right after z command
function zl
  z $argv && ls
end

# ls right after cd
function cl
  cd $argv && ls
end

# go up directories
function up
  set DEEP $argv
  for i in (seq 1 $DEEP)
    cd ../
  end
end

function mostused
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
end

function extract
  set ext (echo $argv[1] | awk -F. '{print $NF}')
  switch $ext
    case tar  # non-compressed, just bundled
      tar -xvf $argv[1]
    case gz
      if test (echo $argv[1] | awk -F. '{print $(NF-1)}') = tar  # tar bundle compressed with gzip
        tar -zxvf $argv[1]
      else  # single gzip
        gunzip $argv[1]
      end
    case tgz  # same as tar.gz
      tar -zxvf $argv[1]
    case bz2  # tar compressed with bzip2
      tar -jxvf $argv[1]
    case rar
      unrar x $argv[1]
    case zip
      unzip $argv[1]
    case '*'
      echo "unknown extension"
  end
end