# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-auth/rtkit/rtkit-0.11-r1.ebuild,v 1.10 2015/02/28 13:29:48 ago Exp $

EAPI=5
inherit eutils systemd user autotools

DESCRIPTION="Realtime Policy and Watchdog Daemon"
HOMEPAGE="http://0pointer.de/blog/projects/rtkit"
SRC_URI="http://0pointer.de/public/${P}.tar.xz"

LICENSE="GPL-3 BSD"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 ~sh sparc x86"
IUSE=""

RDEPEND="
	sys-apps/dbus
	sys-auth/polkit
	sys-libs/libcap
"
DEPEND="${DEPEND}
	app-arch/xz-utils
"

pkg_setup() {
	enewgroup rtkit
	enewuser rtkit -1 -1 -1 "rtkit"
}

src_prepare() {
	# Fedora patches
	epatch "${FILESDIR}"/${P}-polkit.patch
	epatch "${FILESDIR}"/${P}-gettime.patch
	epatch "${FILESDIR}"/${P}-controlgroup.patch
	eautoreconf
}

src_configure() {
	econf $(systemd_with_unitdir)
}

src_install() {
	default

	./rtkit-daemon --introspect > org.freedesktop.RealtimeKit1.xml
	insinto /usr/share/dbus-1/interfaces
	doins org.freedesktop.RealtimeKit1.xml
}
