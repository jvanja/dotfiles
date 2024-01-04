export EDITOR=vim
export ESLINT_D_LOCAL_ESLINT_ONLY=true

for file in ~/.{aliases,functions,secret}; do
  [ -r "$file" ] && source "$file"
done
unset file

if [ -f ~/.aliases.local ]; then
  source ~/.aliases.local
fi

# enable vi mode for shell
set -o vi

