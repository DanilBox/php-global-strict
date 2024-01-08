dnl config.m4 for extension global_strict

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary.

dnl If your extension references something external, use 'with':

dnl PHP_ARG_WITH([global_strict],
dnl   [for global_strict support],
dnl   [AS_HELP_STRING([--with-global_strict],
dnl     [Include global_strict support])])

dnl Otherwise use 'enable':

PHP_ARG_ENABLE([global_strict],
  [whether to enable global_strict support],
  [AS_HELP_STRING([--enable-global_strict],
    [Enable global_strict support])],
  [no])

if test "$PHP_GLOBAL_STRICT" != "no"; then
  dnl Write more examples of tests here...

  dnl Remove this code block if the library does not support pkg-config.
  dnl PKG_CHECK_MODULES([LIBFOO], [foo])
  dnl PHP_EVAL_INCLINE($LIBFOO_CFLAGS)
  dnl PHP_EVAL_LIBLINE($LIBFOO_LIBS, GLOBAL_STRICT_SHARED_LIBADD)

  dnl If you need to check for a particular library version using PKG_CHECK_MODULES,
  dnl you can use comparison operators. For example:
  dnl PKG_CHECK_MODULES([LIBFOO], [foo >= 1.2.3])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo < 3.4])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo = 1.2.3])

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-global_strict -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/global_strict.h"  # you most likely want to change this
  dnl if test -r $PHP_GLOBAL_STRICT/$SEARCH_FOR; then # path given as parameter
  dnl   GLOBAL_STRICT_DIR=$PHP_GLOBAL_STRICT
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for global_strict files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       GLOBAL_STRICT_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$GLOBAL_STRICT_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the global_strict distribution])
  dnl fi

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-global_strict -> add include path
  dnl PHP_ADD_INCLUDE($GLOBAL_STRICT_DIR/include)

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-global_strict -> check for lib and symbol presence
  dnl LIBNAME=GLOBAL_STRICT # you may want to change this
  dnl LIBSYMBOL=GLOBAL_STRICT # you most likely want to change this

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   AC_DEFINE(HAVE_GLOBAL_STRICT_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your global_strict library.])
  dnl ], [
  dnl   $LIBFOO_LIBS
  dnl ])

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are not using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $GLOBAL_STRICT_DIR/$PHP_LIBDIR, GLOBAL_STRICT_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_GLOBAL_STRICT_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your global_strict library.])
  dnl ],[
  dnl   -L$GLOBAL_STRICT_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(GLOBAL_STRICT_SHARED_LIBADD)

  dnl In case of no dependencies
  AC_DEFINE(HAVE_GLOBAL_STRICT, 1, [ Have global_strict support ])

  PHP_NEW_EXTENSION(global_strict, global_strict.c, $ext_shared)
fi
