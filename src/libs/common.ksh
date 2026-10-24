
[[ "$MSYSTEM_CHOST" == *w64-mingw32* ]] && {
    export PATH=/ucrt64/bin:/usr/bin:/usr/local/bin
}
compound _INCLUDED

((_INCLUDED.src_libs_common++)) && return 0




return 0

