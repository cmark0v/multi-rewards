#!/bin/bash

export FF=`ls contracts/*.sol|head -n 1`
export VERSION=`grep -ow '\\^[0-9]\\.[0-9]\\.[0-9]\{1,2\}' $FF|cut -c 2-`
if [ $1 ]
then
echo "changing solc $VERSION changing to $1"
else
echo "usage: chsolc.sh <solc-version>"
echo "this script changes the solc version in brownie config and all contacts and libraries in contracts folder appear to be using $VERSION.."
fi
export CHK=`echo $1|grep -ow '[0-9]\\.[0-9]\\.[0-9]\{1,2\}'`
if [ $CHK ] 
then
    sed -i "s/$VERSION/$CHK/" brownie-config.yaml
    echo "change brownie"
    sed -i "s/pragma solidity \\^$VERSION/pragma solidity \\^$CHK/" contracts/*.sol
    echo "change contracts"
    sed -i "s/pragma solidity \\^$VERSION/pragma solidity \\^$CHK/" contracts/*/*.sol
    echo "change libs"
else
echo "$1 doesnt look right for a version number to me"
fi

