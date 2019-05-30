#!/bin/bash
echo "Compile the QRL blockchain"
cat ~/QRL-Nightly-Chain/splitState/QRL_state.tar.gz* | tar -xzvf -
echo "The /state directory will move to the ~/.qrl/data/ directory"
echo "Move the directory!"
mkdir --parents ~/.qrl/data/
mv ./state ~/.qrl/data/

echo "----------------------------"
echo "DEFAULT QRL DIR CONTAINS"
echo `ls ~/.qrl/data/state`
echo "----------------------------"
echo "Make sure the qrl user has rights to the files in ~/.qrl"

