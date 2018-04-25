#!/bin/bash
#
export DISPLAY=:0.0
set +e
RED='\033[0;31m'
NC='\033[0m'
#
# Test skill with skill simulation
# i.e. ask.sh amzn1.ask.skill.123 "ask my skill to do something"
#

# set skill locale
#
locale="en-GB"

if [ $# -eq 0 ]
  then
    printf "${RED}No arguments supplied - use ask.sh amzn1.ask.skill.123 'ask my skill to do something'\n${NC}"
	exit 1
fi

if [ "$1" == "" ]
  then
    printf "${RED}No skill id supplied.\n${NC}"
	exit 1
fi

if [ "$2" == "" ]
  then
    printf "${RED}No text supplied.\n${NC}"
	exit 1
fi

skillid=$1
text=$2

docker exec -it dockeramazonaskcli_nodejs_1 ask simulate --skill-id $skillid --locale $locale --text "$text"
