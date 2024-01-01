export EDITOR=vim
export ESLINT_D_LOCAL_ESLINT_ONLY=true

for file in ~/.{aliases,functions,secret}; do
  [ -r "$file" ] && source "$file"
done
unset file

# enable vi mode for shell
set -o vi

