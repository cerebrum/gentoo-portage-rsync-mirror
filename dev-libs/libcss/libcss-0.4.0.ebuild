# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libcss/libcss-0.4.0.ebuild,v 1.2 2014/11/15 12:45:44 xmw Exp $

EAPI=5

NETSURF_BUILDSYSTEM=buildsystem-1.2
inherit netsurf

DESCRIPTION="CSS parser and selection engine, written in C"
HOMEPAGE="http://www.netsurf-browser.org/projects/libcss/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~m68k-mint"
IUSE="test"

RDEPEND=">=dev-libs/libparserutils-0.2.0-r1[static-libs?,${MULTILIB_USEDEP}]
	>=dev-libs/libwapcaplet-0.2.1-r1[static-libs?,${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	test? ( dev-lang/perl )"

PATCHES=( "${FILESDIR}"/${P}-glibc2.20.patch )
