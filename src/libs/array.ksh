((_INCLUDED.src_libs_array++)) && return 0

# 对数组按照字典升序排序
function array_sort_dict {
    nameref target_arr=$1

    (( ${#target_arr[@]} )) || return 0

    # -s 选项会强制对本次传入 set 的所有参数进行字典序升序排序
    # -- 用于防范数组元素以减号开头时被误认为是 set 的控制选项
    set -s -- "${target_arr[@]}"

    # 将排好序后的位置参数（$1, $2, ...）重新打包赋回原数组
    target_arr=("$@")
}

