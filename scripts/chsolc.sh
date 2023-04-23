#!/bin/bash
#change solc in config files for brownie plus all contracts in the contracts folter                                                                                                                                                         
export FF=`ls contracts/*.sol|head -n 1`
export SOLC_VERSION=`grep -ow '\\^[0-9]\\.[0-9]\\.[0-9]\{1,2\}' $FF|cut -c 2-`
export CFGFILES=brownie-config.yaml
if [ $1 ]
then
echo "changing solc $SOLC_VERSION changing to $1"
else
    echo "usage: chsolc.sh <solc-version>"
    echo "this script changes the solc version in brownie config and all contacts and libraries in contracts folder appear to be using $SOLC_VERSION.."
fi
export CHK=`echo $1|grep -ow '[0-9]\\.[0-9]\\.[0-9]\{1,2\}'`
if [ $CHK ] 
then
    sed -i "s/$SOLC_VERSION/$CHK/" $CFGFILES
    echo "change brownie"
    sed -i "s/pragma solidity \\^$SOLC_VERSION/pragma solidity \\^$CHK/" `find contracts/|grep \\.sol`
    echo "change contracts"
    #sed -i "s/pragma solidity \\^$SOLC_VERSION/pragma solidity \\^$CHK/" contracts/*/*.sol
    #echo "change libs"
    export CHKLIB=`cat contracts/*/*.sol contracts/*.sol $CFGFILES|grep $CHK|wc -l`
    export _COUNT=`ls contracts/*/*.sol contracts/*.sol $CFGFILES|wc -l`
    if [ $CHKLIB.eq.$_COUNT ]
    then
        echo "looks g2g, all files updated"
    else
        echo "$CHKLIB out of $_COUNT files changes"
    fi
else
    echo "$1 doesnt look right for a version number to me"
fi

