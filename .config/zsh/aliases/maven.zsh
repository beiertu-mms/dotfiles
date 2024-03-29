#                                                        _   _
#   _ __ ___     __ _  __   __   ___   _ __       __ _  | | (_)   __ _   ___
#  | '_ ` _ \   / _` | \ \ / /  / _ \ | '_ \     / _` | | | | |  / _` | / __|
#  | | | | | | | (_| |  \ V /  |  __/ | | | |   | (_| | | | | | | (_| | \__ \
#  |_| |_| |_|  \__,_|   \_/    \___| |_| |_|    \__,_| |_| |_|  \__,_| |___/
#-------------------------------------------------------------------------------
alias m='mvn -ntp'
alias mc='mvn clean'
alias mci='mvn clean install'
alias mcv='mvn clean verify'
alias mcis='mvn clean install -DskipTests'
alias mciS='mvn clean install -Dmaven.test.skip=true'

alias md='mvnd -ntp'
alias mdc='mvnd clean'
alias mdci='mvnd clean install'
alias mdcv='mvnd clean verify'
alias mdcis='mvnd clean install -DskipTests'
alias mdciS='mvnd clean install -Dmaven.test.skip=true'
