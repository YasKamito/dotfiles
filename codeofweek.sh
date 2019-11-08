#!/bin/sh
#set -x

CMDNAME=$(basename $0)
RC_OK=0
RC_ERROR=1
RC_CANCEL=2

# Set default value
AUTHER='YasKamito'

###############################
# version
###############################
version() {
    echo "${CMDNAME} version 0.0.1 "
}

###############################
# usage
###############################
usage() 
{
cat << EOF
${CMDNAME} is a tool for ... 
Usage:
    ${CMDNAME} yyyy-mm-dd [--auther <auther name>]
Options:
    --auther, -a        auther's name
    --version, -v       version info
    --help, -h          show usage

EOF
}

###############################
# get options
###############################
get_options()
{

    # param check
    if [ $# -eq 0 ]; then 
        echo "Error occurred : illegal params"
        usage
        return ${RC_ERROR}
    fi

    # get options
    while [ $# -gt 0 ];
    do
        case ${1} in

            --auther|-a)
                AUTHER=${2}
                shift
            ;;
            
            --version|-v)
                version
                return ${RC_CANCEL}
            ;;
            
            --help|-h)
                usage
                return ${RC_CANCEL}
            ;;

            *)
                START_DATE=${1}
                SINCE=${START_DATE}
                END_DATE=$(date -v+7d -j -f "%Y-%m-%d" "${START_DATE}" +"%Y-%m-%d" 2> /dev/null)
                if [ $RC_OK -ne $? ]; then
                    echo "Error occurred : illegal params \$1 $START_DATE"
                    usage
                    return ${RC_ERROR}
                fi

        esac
        shift
    done

}

###############################
#
# main
#
###############################

###############################
# Call get_options
###############################
get_options $@
RC=${?}
[ ${RC} -ne ${RC_OK} ] && exit ${RC}

cnt=0
while [ 1 ] ;do
    UNTIL=$(date -v+1d -j -f "%Y-%m-%d" "${SINCE}" +"%Y-%m-%d")
    CODENUM=$(git log --numstat --pretty="%H" --author="${AUTHER}" --since="${SINCE}" --until="${UNTIL}" --no-merges | awk 'NF==3 {plus+=$1; minus+=$2} END {printf("%d (+%d,-%d)\n", plus+minus, plus, minus)}')
    WEEKDAY=$(date -v+0d -j -f "%Y-%m-%d" "${SINCE}" +"%Y-%m-%d(%a)")
    echo ${WEEKDAY} ${CODENUM}

    SINCE=${UNTIL}
    [ ${SINCE} == ${END_DATE} ] && break

    let cnt=$cnt+1
done
