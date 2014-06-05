#!/bin/sh

files=$(ls .)


for file in ${files}
do
    if [ ! -L "$file" ]
    then

        for file2 in ${files}
        do
            if  [ ! -L "$file2" ]
            then


                if [ ! -L "$file" ]
                then
                    diff -q $file2 $file
                    rc=$?
                    if [ $rc = 0 ]
                    then
                        if [ "$file2" != "$file" ]
                        then
                            length1=${#file}
                            length2=${#file2}
                            if [ $length1 > $length2 ]
                            then
                                rm $file2
                                ln -s $file $file2
                            else
                                rm $file
                                ln -s $file2 $file1
                            fi

                        fi
                    fi
                fi
            fi
        done

    fi
done