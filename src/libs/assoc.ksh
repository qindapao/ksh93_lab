((_INCLUDED.src_libs_assoc++)) && return 0

function assoc_test_keys {
    typeset -A assoc=( [']']=1 ['[']=1 ['\']=1 )

    {
        unset -v assoc[']']
        unset -v assoc['[']
        unset -v assoc['\']
    } >/dev/null 2>&1

    [[ "0" == "${#assoc[@]}" ]]
}

    if assoc_test_keys ; then

# Officially fixed: direct transparent transmission with zero overhead
assoc_unset () { unset -v "${ printf "%s" "$@"; }" ; }
    else

function assoc_unset_key {
    typeset part= key_q=
    typeset -i is_odd_param=1
    for part in "$@" ; do
        if ((is_odd_param)) ; then
            key_q+=$part
        else
            key_q+=${part//@(['[]\'])/\\\1}
        fi
        (( is_odd_param^=1 ))
    done
    printf "%s" "$key_q"
}

# There is no official fix: add \ before ][\ in the key
assoc_unset () { unset -v "${ assoc_unset_key "$@"; }" ; }
    fi

return 0

