((_INCLUDED.tests_libs_common++)) && return 0


# ==========================================
# 函数：assert_array_equals
# 用法：assert_array_equals "期望数组名" "实际数组名" ["断言描述说明"]
# ==========================================
function assert_array_equals {
    nameref exp=$1
    nameref act=$2
    typeset desc=${3:-"Array Comparison"}

    # 1. 检查总元素个数（长度）是否一致
    if (( ${#exp[@]} != ${#act[@]} )); then
        print -u2 "[FAIL] $desc: 数组长度不一致 (期望: ${#exp[@]}, 实际: ${#act[@]})"
        return 1
    fi

    # 2. 检查索引键（Keys）是否完全对齐
    typeset -a exp_keys=("${!exp[@]}")
    typeset -a act_keys=("${!act[@]}")

    if (( ${#exp_keys[@]} != ${#act_keys[@]} )); then
        print -u2 "[FAIL] $desc: 数组索引键不匹配"
        return 1
    fi

    # 3. 逐个下标比对对应的值
    typeset k q_k q_exp q_act
    for k in "${exp_keys[@]}"; do
        if [[ "${exp[$k]}" != "${act[$k]}" ]]; then
            printf -v q_k   "%q" "$k"
            printf -v q_exp "%q" "${exp[$k]}"
            printf -v q_act "%q" "${act[$k]}"

            print -r -u2 -- "[FAIL] $desc: 下标 [$q_k] 的值不匹配 -> 期望: $q_exp, 实际: $q_act"
            return 1
        fi
    done

    return 0
}

return 0

