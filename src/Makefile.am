bin_SCRIPTS                  = 7zcd                                          \
                               7zdec                                         \
                               7zenc                                         \
                               7zopen                                        \
                               7zpass

EXTRA_DIST                   = 7zcd.in                                       \
                               7zdec.in                                      \
                               7zenc.in                                      \
                               7zopen.in                                     \
                               7zpass.in

dist_man_MANS                = 7zcd.1                                        \
                               7zdec.1                                       \
                               7zenc.1                                       \
                               7zopen.1                                      \
                               7zpass.1

CLEANFILES                   = $(bin_SCRIPTS)

DISTCLEANFILES               = $(dist_man_MANS)

do_subst                     = sed -e 's,URL="",URL="$(PACKAGE_URL)",g'      \
                                   -e 's,PKGNAME="",PKGNAME="$(PACKAGE)",g'  \
                                   -e 's,VERSION="",VERSION="$(VERSION)",g'

7zcd: 7zcd.in Makefile
	$(do_subst) < $(srcdir)/7zcd.in > 7zcd
	chmod +x 7zcd

7zdec: 7zdec.in Makefile
	$(do_subst) < $(srcdir)/7zdec.in > 7zdec
	chmod +x 7zdec

7zenc: 7zenc.in Makefile
	$(do_subst) < $(srcdir)/7zenc.in > 7zenc
	chmod +x 7zenc

7zopen: 7zopen.in Makefile
	$(do_subst) < $(srcdir)/7zopen.in > 7zopen
	chmod +x 7zopen

7zpass: 7zpass.in Makefile
	$(do_subst) < $(srcdir)/7zpass.in > 7zpass
	chmod +x 7zpass

7zcd.1: 7zcd.in Makefile $(top_srcdir)/configure.ac
	-$(HELP2MAN) -n "7-Zip change directory" -N -o $@ $(builddir)/7zcd

7zdec.1: 7zdec.in Makefile $(top_srcdir)/configure.ac
	-$(HELP2MAN) -n "7-Zip decrypt" -N -o $@ $(builddir)/7zdec

7zenc.1: 7zenc.in Makefile $(top_srcdir)/configure.ac
	-$(HELP2MAN) -n "7-Zip encrypt" -N -o $@ $(builddir)/7zenc

7zopen.1: 7zopen.in Makefile $(top_srcdir)/configure.ac
	-$(HELP2MAN) -n "7-Zip open" -N -o $@ $(builddir)/7zopen

7zpass.1: 7zpass.in Makefile $(top_srcdir)/configure.ac
	-$(HELP2MAN) -n "7-Zip pass" -N -o $@ $(builddir)/7zpass

