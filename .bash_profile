export PATH="/usr/local/mysql/bin:$PATH"

# add Spark and Java bins to path
export PATH="$PATH:$SPARK_HOME/bin:$JAVA_HOME/bin"

# added by Anaconda 2.2.0 installer
export PATH="/Users/emilyschuch/anaconda/bin:$PATH"
eval "$(pyenv virtualenv-init -)"

# set up color
PSpink='\n\[\033[0;35m\]\u@\h \w$VENV_NOTICE \d \t\[\033[00m\]\n\$ '
PS1=$PSpink

# Easily get IPython Notebook started up.
alias ipnb='ipython notebook'

# Easily start a simple local Python web server.
alias web='python -m SimpleHTTPServer'
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
