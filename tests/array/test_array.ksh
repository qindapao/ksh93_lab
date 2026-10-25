#!/usr/bin/env ksh

source ../../src/libs/common.ksh
source ../../src/libs/array.ksh
source ../libs/common.ksh

function test_array_sort_dict {

    typeset -a target_arr=( "banana" "apple" "orange" "grape" "cherry" )
    typeset -a spec_arr=("apple" "banana" "cherry" "grape" "orange")

    array_sort_dict target_arr
    if assert_array_equals spec_arr target_arr ; then
        echo "test pass."
    else
        echo "test fail."
    fi

    typeset -A dict1=([$'\t\n ()$[]']=1 )
    typeset -A dict1_spec=([$'\t\n ()$[]']=1 )
    if assert_array_equals dict1 dict1_spec ; then
        echo "test pass."
    else
        echo "test fail."
    fi

}

test_array_sort_dict

exit 0

