export PATH=/SDK/android-sdk-macosx/platform-tools:$PATH

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# init z   https://github.com/rupa/z
. ~/Applications/z/z.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

##
# Your previous /Users/vanjajelic/.bash_profile file was backed up as /Users/vanjajelic/.bash_profile.macports-saved_2013-06-05_at_10:30:37
##

# MacPorts Installer addition on 2013-06-05_at_10:30:37: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

#drush
export PATH=$PATH:/usr/local/drush
export PATH="/Applications/MAMP/Library/bin:/Applications/MAMP/bin/php5.4/bin:$PATH"

# mongoDB
export PATH=/usr/local/mongodb/bin:$PATH

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
