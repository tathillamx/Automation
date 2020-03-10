#!/bin/bash

# Workaround to solves the `readlink -f` incompatibility issue on Mac OS.
portable_readlink() {
    [[ -z $1 ]] && { echo "Missing target file path argument. Usage: portable_readlink <file-path>"; exit 1; }
    local TARGET_FILE=$1

    cd `dirname $TARGET_FILE`
    local TARGET_FILE=`basename $TARGET_FILE`

    # Iterate down a (possible) chain of symlinks
    while [ -L "$TARGET_FILE" ]
    do
        TARGET_FILE=`readlink $TARGET_FILE`
        cd `dirname $TARGET_FILE`
        TARGET_FILE=`basename $TARGET_FILE`
    done

    # Compute the canonicalized name by finding the physical path 
    # for the directory we're in and appending the target file.
    local PHYS_DIR=`pwd -P`
    local RESULT=$PHYS_DIR/$TARGET_FILE

    echo $RESULT
}

while [[ $# -gt 0 ]]; do                                                       
case $1 in
  --help)
    echo ""
    echo "Execution options:"
    echo "=================="
    echo "--zone: the abbreviation that represents the country to be tested (za, do, ar...)"
    echo "--environment: the name of the environment that the tests should perform against from (sit, qa-dt1)"
    echo "--language: the abbreviation that represents the language to be tested (es-do, en-za...)"
    echo "--headless: if you want to test with no browser window (faster and useful for CI)"
    echo "Optionally you can pass all of the flags of the robot command that they will be bypassed to the script execution"
    echo ""
    exit 1
    ;;
  --zone)
    COUNTRY_ABBREVIATION="$2"
    shift # past argument                                   
    shift # past value                 
    ;;                   
  --environment)
    ENVIRONMENT=("$2")                             
    shift # past argument                                   
    shift # past value                 
    ;;    
  --language)
    LANGUAGE=("$2")                             
    shift # past argument                                   
    shift # past value                 
    ;;                  
  --headless)                                   
    shift # past argument
    HEADLESS='--variable HEADLESS:headless'                             
    ;;                                                
  *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later   
    shift # past value                                
    ;;                                                   
esac                                                                           
done   

[ -z $COUNTRY_ABBREVIATION ] && echo -e "\033[31m--zone flag is required. See --help for details\033[0m" && exit 1
[ -z $ENVIRONMENT ] && echo -e "\033[31m--environment flag is required. See --help for details\033[0m" && exit 1
[ -z $LANGUAGE ] && echo -e "\033[31m--language flag is required. See --help for details\033[0m" && exit 1

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(portable_readlink "$0")

# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")

REPORT_TITLE="B2B-$COUNTRY_ABBREVIATION"

REPORT_RESULT_DIR="$SCRIPTPATH/tmp/results/$REPORT_TITLE"

[[ -d "$REPORT_RESULT_DIR" ]] && rm -rf "$REPORT_RESULT_DIR"
[[ -d "$REPORT_RESULT_DIR" ]] || mkdir -p "$REPORT_RESULT_DIR"

CMD="robot \
--debugfile robot-debug.log \
--loglevel TRACE \
--critical basic \
--noncritical alternative \
-x xunit-output.xml \
--name "\"$REPORT_TITLE\"" \
--outputdir "\"$REPORT_RESULT_DIR\"" \
--variable COUNTRY_ABBREVIATION:$COUNTRY_ABBREVIATION \
--variable ENVIRONMENT:$ENVIRONMENT \
--variable LANGUAGE:$LANGUAGE \
$HEADLESS \
${POSITIONAL[@]} \
$SCRIPTPATH/tests/cucumber/e2e"

echo $CMD
eval $CMD