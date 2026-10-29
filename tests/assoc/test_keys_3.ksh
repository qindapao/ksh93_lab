#!/usr/bin/env ksh

source ../../src/libs/common.ksh
source ../../src/libs/assoc.ksh
source ../libs/common.ksh

function test_1 {
    echo '============ Add `()` initialization to each level of the associative array ====='
    typeset -C test_db
    typeset -C test_db.lev1
    typeset -C test_db.lev1.lev2
    typeset -A test_db.lev1.lev2.lev3

    # It seems that reference protection can be obtained by
    # adding assignment statements when defining.！
    typeset -A test_db.lev1.lev2.lev3['\']=()
    typeset -A test_db.lev1.lev2.lev3['\']['[]]']=()
    typeset -A test_db.lev1.lev2.lev3['\']['[]]']['][']=()

    test_db.lev1.lev2.lev3['\']['[]]'][']['][key1]=1
    print -v test_db

}

function test_2 {
    echo '============ Do not initialize each level of the associative array with () ====='
    echo '============ but add a backslash before dangerous characters. ====='
    typeset -C test_db
    typeset -C test_db.lev1
    typeset -C test_db.lev1.lev2
    typeset -A test_db.lev1.lev2.lev3

    # There is no assignment statement when defining, so reference protection
    # cannot be obtained. The quotes are stripped off and passed directly to typeset?
    # So we manually add backslash protection
    typeset -A test_db.lev1.lev2.lev3['\\']
    typeset -A test_db.lev1.lev2.lev3['\\']['\[\]\]']
    typeset -A test_db.lev1.lev2.lev3['\\']['\[\]\]']['\]\[']

    # Cannot add backslashes when assigning values here.
    test_db.lev1.lev2.lev3['\']['[]]'][']['][key1]=1
    print -v test_db

}

function test_3 {
    echo '============= Add `()` to initialize the composite variable after the complex key. ================='
    typeset -A test_db
    typeset -C test_db['][']=()
    test_db[']['].lev1=1
    print -v test_db
}

function test_4 {
    echo '============= Composite variables hanging after complex keys are not ================='
    echo '============= initialized with (), but the keys are protected with backslashes. ================='
    typeset -A test_db
    typeset -C test_db['\]\[']
    test_db[']['].lev1=1
    print -v test_db
}

test_1
test_2
test_3
test_4

exit 0

