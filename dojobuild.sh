#!/bin/bash
# http://mywiki.wooledge.org/BashFAQ/006

################################################################################
# Functions
################################################################################

BLACK="\033[1;30m"
NO_COLOUR="\033[0m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
GRAY="\033[1;30m"
CYAN="\033[0;36m"

LIGHT_GRAY="\033[0;37m"

LIGHT_CYAN="\033[1;36m"
MAGENTA="\033[1;35m"


function log_var {
	local variable="$1"
	local value=$variable
	echo -ne "${GRAY}"
	echo -ne "${variable}: "
	echo -ne "${CYAN}"
	echo -e "${!value}"
	
	tput sgr0
	#echo -e "\033[01;38;5;160m${variable}\033[39m : ${!value}"
}

function log_error {
	local msg="$1"
	echo -e "${RED}${msg}${NO_COLOUR}"
}

function log_info {
	local msg="$1"
	echo -e "${MAGENTA}${msg}${NO_COLOUR}"
}

function log_warn {
	local msg="$1"
	echo -e "${MAGENTA}${msg}${NO_COLOUR}"
}


################################################################################
# Config
################################################################################

BASEDIR=`pwd`
DOJO_DIR="${BASEDIR}/Libraries"
DOJO_RELEASE_VERSION="1.5.0"
DOJO_SRC_DIR="${DOJO_DIR}/dojo-release-${DOJO_RELEASE_VERSION}-src" # dojo-release-1.4.2-src
DOJO_PROFILES_DIR="${BASEDIR}/Config"

# http://docs.dojocampus.org/build/index
# http://stackoverflow.com/questions/1343422/dojo-vs-dijit-files-to-include-or-reference
DOJO_PROFILE_NAME="dojo.profile.js"

DOJO_PROFILE_FILE="${DOJO_PROFILES_DIR}/${DOJO_PROFILE_NAME}"

DOJO_RELEASE_OUT_DIR="${BASEDIR}/Deploy/Resources"

DOJO_ARGS="action=clean,release action=release optimize=shrinksafe mini=true cssOptimize=comments releaseDir=${DOJO_RELEASE_OUT_DIR} profileFile=${DOJO_PROFILE_FILE} log=1"


################################################################################

BUILD_CMD="java -classpath ../shrinksafe/js.jar:../shrinksafe/shrinksafe.jar:$JAVA_CP org.mozilla.javascript.tools.shell.Main build.js $DOJO_ARGS"

################################################################################
# Compile
################################################################################

log_info "*********************************************************************"
log_info "*  New DOJO BUILD "
log_info "*********************************************************************"



log_info "Settings  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo ""

log_var "BUILD_ENV"
log_var "BASEDIR"
log_var "DOJO_SRC_DIR"
log_var "DOJO_RELEASE_VERSION"
log_var "DOJO_PROFILES_DIR"
log_var "DOJO_PROFILE_NAME"
log_var "DOJO_PROFILE_FILE"
log_var "DOJO_ARGS"
log_var "JAVA_CP"
log_var "DOJO_RELEASE_OUT_DIR"
log_var "BUILD_CMD"
log_var "RHINO_CP"

if ! [ -d $DOJO_SRC_DIR ]; then
	log_error "Error: Dojo source not found: ${DOJO_SRC_DIR}"
	exit 1
fi

if ! [ -e $DOJO_PROFILE_FILE ]; then
	log_error "Error: Dojo profile file not found: ${DOJO_PROFILE_FILE}"
	exit 1
fi

if ! [ -w $DOJO_RELEASE_OUT_DIR ]; then
	log_error "Error: Dojo release dir not found or not writable: ${DOJO_RELEASE_OUT_DIR}"
	exit 1
fi

# exit 0

cd "${DOJO_SRC_DIR}/util/buildscripts"

log_info "Building ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

$BUILD_CMD
    