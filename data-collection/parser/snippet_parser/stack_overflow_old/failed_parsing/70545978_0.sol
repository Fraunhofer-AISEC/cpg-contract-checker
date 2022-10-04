Running setup.py install for cytoolz ... error
ERROR: Command errored out with exit status 1:
 command: /Library/Frameworks/Python.framework/Versions/3.10/bin/python3 -u -c 'import io, os, sys, setuptools, tokenize; sys.argv[0] = '"'"'/private/var/folders/yn/h863qv2164s67k4kz02099p80000gn/T/pip-install-2ichwuya/cytoolz_a5dcb1dc44ca4e459ea5e71445ed04f7/setup.py'"'"'; __file__='"'"'/private/var/folders/yn/h863qv2164s67k4kz02099p80000gn/T/pip-install-2ichwuya/cytoolz_a5dcb1dc44ca4e459ea5e71445ed04f7/setup.py'"'"';f = getattr(tokenize, '"'"'open'"'"', open)(__file__) if os.path.exists(__file__) else io.StringIO('"'"'from setuptools import setup; setup()'"'"');code = f.read().replace('"'"'\r\n'"'"', '"'"'\n'"'"');f.close();exec(compile(code, __file__, '"'"'exec'"'"'))' install --record /private/var/folders/yn/h863qv2164s67k4kz02099p80000gn/T/pip-record-ty348jbj/install-record.txt --single-version-externally-managed --compile --install-headers /Library/Frameworks/Python.framework/Versions/3.10/include/python3.10/cytoolz
     cwd: /private/var/folders/yn/h863qv2164s67k4kz02099p80000gn/T/pip-install-2ichwuya/cytoolz_a5dcb1dc44ca4e459ea5e71445ed04f7/
Complete output (75 lines):
ALERT: Cython not installed.  Building without Cython.
running install
running build
running build_py
creating build
creating build/lib.macosx-10.9-universal2-3.10
creating build/lib.macosx-10.9-universal2-3.10/cytoolz
copying cytoolz/compatibility.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz
copying cytoolz/utils_test.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz
copying cytoolz/_version.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz
copying cytoolz/__init__.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz
copying cytoolz/_signatures.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz
creating build/lib.macosx-10.9-universal2-3.10/cytoolz/curried
copying cytoolz/curried/operator.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/curried
copying cytoolz/curried/__init__.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/curried
copying cytoolz/curried/exceptions.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/curried
copying cytoolz/itertoolz.pyx -> build/lib.macosx-10.9-universal2-3.10/cytoolz
copying cytoolz/dicttoolz.pyx -> build/lib.macosx-10.9-universal2-3.10/cytoolz
copying cytoolz/functoolz.pyx -> build/lib.macosx-10.9-universal2-3.10/cytoolz
copying cytoolz/recipes.pyx -> build/lib.macosx-10.9-universal2-3.10/cytoolz
copying cytoolz/utils.pyx -> build/lib.macosx-10.9-universal2-3.10/cytoolz
copying cytoolz/utils.pxd -> build/lib.macosx-10.9-universal2-3.10/cytoolz
copying cytoolz/__init__.pxd -> build/lib.macosx-10.9-universal2-3.10/cytoolz
copying cytoolz/recipes.pxd -> build/lib.macosx-10.9-universal2-3.10/cytoolz
copying cytoolz/functoolz.pxd -> build/lib.macosx-10.9-universal2-3.10/cytoolz
copying cytoolz/dicttoolz.pxd -> build/lib.macosx-10.9-universal2-3.10/cytoolz
copying cytoolz/cpython.pxd -> build/lib.macosx-10.9-universal2-3.10/cytoolz
copying cytoolz/itertoolz.pxd -> build/lib.macosx-10.9-universal2-3.10/cytoolz
creating build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
copying cytoolz/tests/test_none_safe.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
copying cytoolz/tests/test_utils.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
copying cytoolz/tests/test_curried.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
copying cytoolz/tests/test_compatibility.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
copying cytoolz/tests/test_embedded_sigs.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
copying cytoolz/tests/test_functoolz.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
copying cytoolz/tests/test_inspect_args.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
copying cytoolz/tests/test_doctests.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
copying cytoolz/tests/test_tlz.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
copying cytoolz/tests/test_signatures.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
copying cytoolz/tests/dev_skip_test.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
copying cytoolz/tests/test_recipes.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
copying cytoolz/tests/test_docstrings.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
copying cytoolz/tests/test_dev_skip_test.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
copying cytoolz/tests/test_dicttoolz.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
copying cytoolz/tests/test_serialization.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
copying cytoolz/tests/test_curried_toolzlike.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
copying cytoolz/tests/test_itertoolz.py -> build/lib.macosx-10.9-universal2-3.10/cytoolz/tests
running build_ext
building 'cytoolz.dicttoolz' extension
creating build/temp.macosx-10.9-universal2-3.10
creating build/temp.macosx-10.9-universal2-3.10/cytoolz
clang -Wno-unused-result -Wsign-compare -Wunreachable-code -fno-common -dynamic -DNDEBUG -g -fwrapv -O3 -Wall -arch arm64 -arch x86_64 -g -I/Library/Frameworks/Python.framework/Versions/3.10/include/python3.10 -c cytoolz/dicttoolz.c -o build/temp.macosx-10.9-universal2-3.10/cytoolz/dicttoolz.o
clang -bundle -undefined dynamic_lookup -arch arm64 -arch x86_64 -g build/temp.macosx-10.9-universal2-3.10/cytoolz/dicttoolz.o -o build/lib.macosx-10.9-universal2-3.10/cytoolz/dicttoolz.cpython-310-darwin.so
building 'cytoolz.functoolz' extension
clang -Wno-unused-result -Wsign-compare -Wunreachable-code -fno-common -dynamic -DNDEBUG -g -fwrapv -O3 -Wall -arch arm64 -arch x86_64 -g -I/Library/Frameworks/Python.framework/Versions/3.10/include/python3.10 -c cytoolz/functoolz.c -o build/temp.macosx-10.9-universal2-3.10/cytoolz/functoolz.o
cytoolz/functoolz.c:23087:19: error: implicit declaration of function '_PyGen_Send' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
            ret = _PyGen_Send((PyGenObject*)yf, value == Py_None ? NULL : value);
                  ^
cytoolz/functoolz.c:23087:17: warning: incompatible integer to pointer conversion assigning to 'PyObject *' (aka 'struct _object *') from 'int' [-Wint-conversion]
            ret = _PyGen_Send((PyGenObject*)yf, value == Py_None ? NULL : value);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cytoolz/functoolz.c:23092:19: error: implicit declaration of function '_PyGen_Send' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
            ret = _PyGen_Send((PyGenObject*)yf, value == Py_None ? NULL : value);
                  ^
cytoolz/functoolz.c:23092:17: warning: incompatible integer to pointer conversion assigning to 'PyObject *' (aka 'struct _object *') from 'int' [-Wint-conversion]
            ret = _PyGen_Send((PyGenObject*)yf, value == Py_None ? NULL : value);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cytoolz/functoolz.c:23176:19: error: implicit declaration of function '_PyGen_Send' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
            ret = _PyGen_Send((PyGenObject*)yf, NULL);
                  ^
cytoolz/functoolz.c:23176:17: warning: incompatible integer to pointer conversion assigning to 'PyObject *' (aka 'struct _object *') from 'int' [-Wint-conversion]
            ret = _PyGen_Send((PyGenObject*)yf, NULL);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
3 warnings and 3 errors generated.
error: command '/usr/bin/clang' failed with exit code 1
----------------------------------------
ERROR: Command errored out with exit status 1: /Library/Frameworks/Python.framework/Versions/3.10/bin/python3 -u -c 'import io, os, sys, setuptools, tokenize; sys.argv[0] = '"'"'/private/var/folders/yn/h863qv2164s67k4kz02099p80000gn/T/pip-install-2ichwuya/cytoolz_a5dcb1dc44ca4e459ea5e71445ed04f7/setup.py'"'"'; __file__='"'"'/private/var/folders/yn/h863qv2164s67k4kz02099p80000gn/T/pip-install-2ichwuya/cytoolz_a5dcb1dc44ca4e459ea5e71445ed04f7/setup.py'"'"';f = getattr(tokenize, '"'"'open'"'"', open)(__file__) if os.path.exists(__file__) else io.StringIO('"'"'from setuptools import setup; setup()'"'"');code = f.read().replace('"'"'\r\n'"'"', '"'"'\n'"'"');f.close();exec(compile(code, __file__, '"'"'exec'"'"'))' install --record /private/var/folders/yn/h863qv2164s67k4kz02099p80000gn/T/pip-record-ty348jbj/install-record.txt --single-version-externally-managed --compile --install-headers /Library/Frameworks/Python.framework/Versions/3.10/include/python3.10/cytoolz Check the logs for full command output.
