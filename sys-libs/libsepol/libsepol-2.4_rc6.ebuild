# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-libs/libsepol/libsepol-2.4_rc6.ebuild,v 1.1 2014/11/14 19:15:41 swift Exp $

EAPI="4"

inherit multilib toolchain-funcs eutils multilib-minimal

MY_P="${P//_/-}"

DESCRIPTION="SELinux binary policy representation library"
HOMEPAGE="https://github.com/SELinuxProject/selinux/wiki"
SRC_URI="https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20140826/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${MY_P}"

# tests are not meant to be run outside of the
# full SELinux userland repo
RESTRICT="test"

src_prepare() {
	epatch_user
	multilib_copy_sources
}

multilib_src_compile() {
	tc-export RANLIB;
	LIBDIR="\$(PREFIX)/$(get_libdir)" SHLIBDIR="\$(DESTDIR)/$(get_libdir)" \
		emake AR="$(tc-getAR)" CC="$(tc-getCC)"
}

multilib_src_install() {
	LIBDIR="\$(PREFIX)/$(get_libdir)" SHLIBDIR="\$(DESTDIR)/$(get_libdir)" \
		emake DESTDIR="${D}" install
}
