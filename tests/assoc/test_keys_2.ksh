#!/usr/bin/env ksh

source ../../src/libs/common.ksh
source ../../src/libs/assoc.ksh
source ../libs/common.ksh

function test_1 {
    echo '============ test with special key:`][`  compound with assoc ======='
    typeset -A test_db

    echo '---- `][` key cannot be recognized correctly ----'
    typeset -C test_db['][']

    test_db[']['].lev1=1

    print -v test_db

    echo '---- testing whether a backslash can improve the situation ----'
    typeset -A test_db2
    typeset -C test_db2['\]\[']
    test_db2['\]\['].lev1=1

    print -v test_db2

    echo '---- The print results indicate that the backslash did not improve the situation. ----'

}

function test_2 {
    echo '============ test with special key:`[]`  compound with assoc ======='
    typeset -A test_db

    echo '---- `[]` key is correctly recognized ----'
    typeset -C test_db['[]']

    test_db['[]'].lev1=1

    print -v test_db
}

function test_3 {
    echo '============ test with special key:`[]` and `][`  in only nested assoc ====='
    typeset -A test_db1
    typeset -A test_db1['[]']=()

    echo '---- Defining it without adding the step of initializing it to `()` does not meet expectations. ----'
    typeset -A test_db1['[]']['][']
    echo "---- test_db1 ----"
    print -v test_db1

    typeset -A test_db2
    typeset -A test_db2['[]']=()

    echo '---- When defining, add initialization to `()` meet expectations. ----'
    typeset -A test_db2['[]']['][']=()
    test_db2['[]'][']['][key1]=1
    echo "---- test_db2----"
    print -v test_db2
}

function test_4 {
    echo '============ test with special key:`[]` and `][` in scenario where the composite variable is in the front and the associative array is in the back ====='
    typeset -C test_db
    typeset -C test_db.lev1
    typeset -C test_db.lev1.lev2
    typeset -A test_db.lev1.lev2.lev3
    typeset -A test_db.lev1.lev2.lev3['[]']=()
    typeset -A test_db.lev1.lev2.lev3['[]']['][']=()
    nameref ref=test_db.lev1.lev2.lev3['\[\]']['\]\[']
    ref[key1]=2
    print -v test_db

}

test_1
test_2
test_3
test_4

exit 0

