# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR=/opt/homebrew/bin/nvim

export ESLINT_D_LOCAL_ESLINT_ONLY=true

#########################################
#
# ZSH and Oh My ZSH configuration below
#
#########################################
# Path to your oh-my-zsh installation.
export ZSH=/Users/vanjajelic/.oh-my-zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n] confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
ZSH_THEME="powerlevel10k/powerlevel10k"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-fzf-history-search brew)

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}

zle -N zle-line-init

# finally, source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# this fixes the c-R not working
source ~/.oh-my-zsh/custom/plugins/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#########################################
#
# End Oh My ZSH configuration
#
#########################################

KEYTIMEOUT=1

# If set, Homebrew will not auto-update before running `brew install`, `brew upgrade` or `brew tap`.
export HOMEBREW_NO_AUTO_UPDATE=1

export PATH="/Users/vanjajelic/.composer/vendor/bin:$PATH"
export PATH="/Applications/MAMP/htdocs/evinyl-cms/vendor/bin:$PATH"


# Custom aliases and functions
for file in ~/.{aliases,functions,secret}; do
  [ -r "$file" ] && source "$file"
done
unset file

if [ -f ~/.aliases.local ]; then
  source ~/.aliases.local
fi

# enable vi mode for shell. This has to be done after the oh-my-zsh config
set -o vi

# init zoxide
eval "$(zoxide init zsh)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  # bun completions
[ -s "/Users/vanjajelic/.bun/_bun" ] && source "/Users/vanjajelic/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Herd injected PHP binary.
export PATH="/Users/vanjajelic/Library/Application Support/Herd/bin/":$PATH

# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/vanjajelic/Library/Application Support/Herd/config/php/82/"
