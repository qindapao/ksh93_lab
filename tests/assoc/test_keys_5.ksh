#!/usr/bin/env ksh

function test_1 {
    typeset -a array=()
    typeset -A array[0]=()
    array[0]=( [i0]=1 [j0]=2 [k0]=3 )

    typeset -A array[2]=()
    array[2]=( [i2]=1 [j2]=2 [k2]=3 )

    typeset -A array[4]=()
    array[4]=( [i4]=1 [j4]=2 [k4]=3 )

    # print -v array
    typeset key skey

    for key in "${!array[@]}"; do
        echo "=== array[$key] ==="

        typeset -n sub="array[$key]"

        for skey in "${!sub[@]}"; do
            echo "  $skey = ${sub[$skey]}"
        done

        unset -n sub
    done
}

test_1

exit 0

