export XDG_RUNTIME_DIR=/run/user/$UID
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
sudo /etc/init.d/dbus start &> /dev/null
export DISPLAY=:1;

~/.extra/z.sh

alias batch="cmd.exe /c batch.bat"
alias ls="ls --color=auto"
alias sl="ls"
alias rm="rm -i"