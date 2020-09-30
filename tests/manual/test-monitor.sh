#!/bin/bash
pushd ../.. > /dev/null

dir="$(dirname "$0")"
echo "$dir"
export PYTHONPATH=$PYTHONPATH.$dir/.$dir/lib/pymaker
echo "$PYTHONPATH"

while true
do
    # Just a simple transaction
    python3 ~/auction-keeper/tests/manual/mint_mkr.py 0.01 > /dev/null
    # Show change in surplus/debt as auctions run
    python3 ~/auction-keeper/tests/manual/print.py --balances
    sleep 13
done

popd > /dev/null

