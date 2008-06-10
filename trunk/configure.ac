#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ(2.61)
AC_INIT(FULL-PACKAGE-NAME, VERSION, BUG-REPORT-ADDRESS)
AC_CONFIG_SRCDIR([src/devPS.c])
AC_CONFIG_HEADER([src/include/config.h])

# Checks for programs.
AC_PROG_CC

# Checks for libraries.

# Checks for header files.
AC_FUNC_ALLOCA
AC_HEADER_STDC
AC_CHECK_HEADERS([float.h inttypes.h libintl.h limits.h stdint.h stdlib.h string.h sys/param.h unistd.h wchar.h wctype.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST
AC_TYPE_SIZE_T
AC_STRUCT_TM

# Checks for library functions.
AC_FUNC_ERROR_AT_LINE
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_CHECK_FUNCS([floor memset putenv strchr strdup strncasecmp strrchr])

#####

AC_TYPE_SIGNAL

AC_DEFINE(HAVE_ERRNO_H, 1)
AC_SUBST(HAVE_ERRNO_H)

AC_DEFINE(HAVE_ICONV, 1)
AC_SUBST(HAVE_ICONV)

AC_DEFINE(ICONV_LATIN1, 1)
AC_SUBST(ICONV_LATIN1)

case "${host_os}" in
  mingw*|windows*|winnt)
    AC_DEFINE(Win32, 1,
              [Define according to your operating system type.])
    R_OSTYPE="windows"
    ;;
  *)
    AC_DEFINE(Unix, 1,
              [Define according to your operating system type.])
    R_OSTYPE="unix"
   ;;
esac
AC_SUBST(R_OSTYPE)

AC_CHECK_TYPES([intptr_t, uintptr_t], , , [#ifdef HAVE_INTTYPES_H
#include <inttypes.h>
#endif
#ifdef HAVE_STDINT_H
#include <stdint.h>
#endif])

#####

AC_OUTPUT
