#!/usr/bin/env ksh

function test_1 {
    typeset -A a
    typeset -C a['][']=()

    a[']['].lev1=1
    typeset -p a
}

function test_2 {
    typeset -A a
    typeset -C a['[]']=()

    a['[]'].lev1=1
    typeset -p a
}

function test_3 {
    typeset -A a
    typeset -C a['[]]']=()

    a['[]]'].lev1=1
    typeset -p a
}

function test_4 {
    typeset -A a
    typeset -C a['\']=()

    a['\'].lev1=1
    typeset -p a
}

test_1
test_2
test_3
test_4

exit 0

