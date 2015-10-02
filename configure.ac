AC_INIT([7zetools], [0.1], [kristofer.berggren@gmail.com], [], 
        [https://github.com/d99kris/7zetools])
AM_INIT_AUTOMAKE([foreign])
AC_CHECK_PROG([SEVENZIP], [7z], [7z])
test -z "$SEVENZIP" && AC_MSG_ERROR(Required tool 7z not found.)
AC_CHECK_PROG([REALPATH], [realpath], [realpath])
test -z "$REALPATH" && AC_MSG_ERROR(Required tool realpath not found.)
AC_CHECK_PROG([HELP2MAN], [help2man], [help2man])
test -z "$HELP2MAN" && AC_MSG_ERROR(Required tool help2man not found.)
AC_CONFIG_FILES(Makefile src/Makefile)
AC_OUTPUT
