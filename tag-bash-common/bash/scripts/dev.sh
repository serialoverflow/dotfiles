#!/usr/bin/env bash

# {{{ Navigation
alias cdb="cd ${HOME}/build"
alias cdc="cd ${HOME}/code"
# }}}


# {{{ Ruby
alias rb="ruby"
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export GEM_PATH="${GEM_HOME}"
# }}}                     /home/max/Dropbox/dev/demo

# {{{ Python
# { Basics
alias py="python"
alias py2="python2"
alias py3="python3"
alias ipy="ipython"
alias ipy2="ipython2"
alias ipy3="ipython3"
# }

# { PyPI
# See http://peterdowns.com/posts/first-time-with-pypi.html for a quick intro on how to use PyPI.
alias ppregister="python setup.py register -r pypi"
alias ppupload="python setup.py sdist upload -r pypi"
alias pptregister="python setup.py register -r pypitest"
alias pptupload="python setup.py sdist upload -r pypitest"
# }

# { Virtualenv
# Virtualenvwrapper workflow: mkvirtualenv foo, workon foo, deactivate, rmvirtualenv foo
# Other useful commands: lsvirtualenv (list all environments), cdvirtualenv (cd into one), cdsitepackages, lssitepackages
if [[ -x /usr/bin/virtualenvwrapper_lazy.sh ]]; then
    export PROJECT_HOME="${HOME}/code/python"
    export WORKON_HOME="${HOME}/build/python/venv"
    export VIRTUALENVWRAPPER_SCRIPT=/usr/bin/virtualenvwrapper.sh
    # Isolate new environments from system site packages. Opposite would be --system-site-packages.
    #export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
    source /usr/bin/virtualenvwrapper_lazy.sh
fi
# }
# }}}

# {{{ Utilities

# }}}

# {{{ Java
export JAVA_HOME="/usr/lib/jvm/default"
# }}}

# {{{ Kafka+Storm
ZOO="/usr/share/zookeeper"
alias cdzoo="cd ${ZOO}"
alias zoostart="${_SUDO} ${ZOO}/bin/zkServer.sh start"
alias zooconnect="${ZOO}/bin/zkCli.sh -server 127.0.0.1:2181"

STORM="/usr/share/storm"
alias cdstorm="cd ${STORM}"
alias stormnimbus="${_SUDO} ${STORM}/bin/storm nimbus"
alias stormsupervisor="${_SUDO} ${STORM}/bin/storm supervisor"
# The UI can be accessed by navigating your web browser to http://{ui host}:8080.
alias stormui="${_SUDO} ${STORM}/bin/storm ui"

KAFKA="/usr/share/kafka"
alias cdkafka="cd ${KAFKA}"
alias kafkastart="${_SUDO} ${KAFKA}/bin/kafka-server-start.sh"
alias kafkastop="${_SUDO} ${KAFKA}/bin/kafka-server-stop.sh"
# }}}