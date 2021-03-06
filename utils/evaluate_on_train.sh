#!/bin/bash

SCRIPTDIR=$(dirname $BASH_SOURCE)
cd $SCRIPTDIR

mkdir tmp
for f in ../../data/all_train/raw/*
do
    filename=$(basename $f)
    ../bin/tokenizer --split_camel_case $f > tmp/$filename
done
perl ../../data/empirist_training_cmc/tools/compare_tokenization.perl -e errors_train.txt tmp ../../data/all_train/tokenized
rm -r tmp/
