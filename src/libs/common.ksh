
compound _INCLUDED
((_INCLUDED.src_libs_common++)) && return 0

[[ "$MSYSTEM_CHOST" == *w64-mingw32* ]] && {
    export PATH=/ucrt64/bin:/usr/bin:/usr/local/bin
}

# 锁死区域设置，确保多字节字符（如中文）长度统计正确
# export LC_ALL=C.UTF-8
# (注意：如果设置了 LC_ALL=C.UTF-8，前面提到的 sort 的字典序也会变成 UTF-8 的人类语言序。
# 如果既要 UTF-8 算字数，又要纯 ASCII 字节序排序，可以分项设置
export LC_CTYPE=C.UTF-8   # 管字符长度（中文算2）
export LC_COLLATE=C      # 管排序规则（纯 ASCII 字典序）
# 锁死数字格式，确保小数点永远是标准点号 (.)，防止跨环境浮点数或计算解析错乱
export LC_NUMERIC=C


return 0

