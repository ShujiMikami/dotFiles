#export PATH=$PATH:/usr/local/devkitARM/bin
##
# Your previous /Users/user/.bash_profile file was backed up as /Users/user/.bash_profile.macports-saved_2014-08-10_at_17:55:20
##

# MacPorts Installer addition on 2014-08-10_at_17:55:20: adding an appropriate PATH variable for use with MacPorts.
#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi


# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
