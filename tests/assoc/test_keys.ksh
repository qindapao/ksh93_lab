#!/usr/bin/env ksh

source ../../src/libs/common.ksh
source ../../src/libs/assoc.ksh
source ../libs/common.ksh

function test_1 {
    echo "============ test with special key:][  test_db1 ==================="
    typeset -A test_db1
    typeset -A test_db1['].[]\\\l ev2.[']=([x]=1 [y]=2 ['][ .\\\[]][]']=3)
    typeset -A test_db1['a b']=2

    key1='].[]\\\l ev2.['
    key2='][ .\\\[]][]'

    assoc_unset test_db1[ "$key1" ][ "$key2" ]
    assoc_unset test_db1[ 'a b' ]

    # The assignment here will fail
    typeset test_db1['][']=(
        lev1=1
        lev2_2=(
            typeset -A dict2=(['\']=1)
        )
    )

    print -v test_db1

}

test_1

exit 0

