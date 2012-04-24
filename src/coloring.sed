s/"([^\\"]|\\[^"]|[^\\]?(\\\\)*\\")*"/<span class="quote">&<\/span>/g
s/\/\/.*/<span class="comment">&<\/span>/g
s/\/\*.?([^\/]|[^*]\/)*\*\//<span class="comment">&<\/span>/g
s/^[ \t]*#[ \t]*[[:alnum:]]*/<span class="preprocessor">&<\/span>/g
s/(^|[^A-Za-z0-9_])(break|case|catch|class|const_cast|const|continue|default|delete|do|double|dynamic_cast|else[ \t]+if|else|enum|explicit|extern|for|friend|goto|if|inline|mutable|namespace|new|operator|private|protected|public|register|reinterpret_cast|return|sizeof|static_cast|static|struct|switch|template|this|throw|try|typedef|typeid|typename|union|using[ \t]+namespace|using|virtual|void|volatile|while)($|[^A-Za-z0-9_=])/\1<span class="keyword">\2<\/span>\3/g
s/(^|[^A-Za-z0-9_])(unsigned[ \t]+|signed[ \t]+)?(bool|char|double|float|int|short[ \t]+int|short|long[ \t]+long[ \t]+int|long[ \t]+long|long|size_t)($|[^A-Za-z0-9_])/\1<span class="builtintype">\2\3<\/span>\4/g
s/([^A-Za-z0-9_ \t])(cassert|cctype|cerrno|cfloat|ciso646|climits|clocale|cmath|csetjmp|csignal|cstdarg|cstddef|cstdio|cstdlib|cstring|ctime|assert.h|type.h|errno.h|float.h|iso646.h|limits.h|loale.h|math.h|setjmp.h|signal.h|stdarg.h|stddef.h|stdio.h|stdlib.h|string.h|time.h)([^A-Za-z0-9_ \t])/\1<span class="stdlib">\2<\/span>\3/g
s/(^|[^A-Za-z0-9_])(std[ \t]*::[ \t]*)?(i?o?stream|[io]?fstream|iomanip|[io]?stringstream|string|vector|list|deque|list|stack|priority_queue|queue|bitset|multiset|set|multimap|map|cin|cout|clog|endl)($|[^A-Za-z0-9_])/\1<span class="stdlib">\2\3<\/span>\4/g
s/'(\\[\\abfnrt'"]|[^'\\]|\\x[0-9a-fA-F]{2}|&(amp|lt|gt);)'/<span class="character">&<\/span>/g
s/([^A-Za-z0-9_])(0[Xx][0-9A-Fa-f]+|[0-9]+\.?[0-9]*|[0-9]*\.[0-9]+)((e[+-]?[0-9]+)?[Uu]?[LlFf]?[Ll]?[Uu]?)([^A-Za-z0-9_])/\1<span class="number">\2\3<\/span>\5/g
s/([^A-Za-z0-9_])(false|true)([^A-Za-z0-9_])/\1<span class="boolean">\2<\/span>\3/g
p
