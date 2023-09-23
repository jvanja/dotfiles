export EDITOR=vim
export ESLINT_D_LOCAL_ESLINT_ONLY=true

# init z   https://github.com/rupa/z
. ~/Applications/z/z.sh

for file in ~/.{aliases,functions,secret}; do
  [ -r "$file" ] && source "$file"
done
unset file

# enable vi mode for shell
set -o vi

