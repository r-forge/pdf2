#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ(2.50)
AC_INIT()

if test -z "$R_INTERNAL_HEADER_DIR" ; then
  if test `uname` = "Darwin" ; then
    R_INTERNAL_HEADER_DIR=${R_HOME}/../PrivateHeaders
  else
    echo "Specify R_INTERNAL_HEADER_DIR, R internal header directory,"
    echo "which is in the R source directory you complied like"
    echo "R-2.7.0/src/include. That is, you need to extract and congure"
    echo "the R source."
    echo "example: ./configure R_INTERNAL_HEADER_DIR=/path/to/src/include"
    AC_MSG_ERROR([])
  fi
fi

AC_SUBST(R_INTERNAL_HEADER_DIR)

AC_OUTPUT(src/Makevars)
