# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/pithos/pithos-1.0.0.ebuild,v 1.1 2014/09/22 18:20:08 chutzpah Exp $

EAPI=5
PYTHON_COMPAT=(python3_3)
inherit eutils distutils-r1

if [[ ${PV} =~ [9]{4,} ]]; then
	inherit git-2
	EGIT_REPO_URI="git://github.com/pithos/pithos.git
		https://github.com/pithos/pithos.git"
else
	SRC_URI="https://github.com/${PN}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Pandora.com client for the GNOME desktop"
HOMEPAGE="http://pithos.github.io/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="libnotify appindicator +keybinder"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}
	dev-python/dbus-python[${PYTHON_USEDEP}]
	dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/pylast[${PYTHON_USEDEP}]
	x11-libs/gtk+:3
	media-plugins/gst-plugins-meta:1.0[aac,http,mp3]
	libnotify? ( x11-libs/libnotify )
	appindicator? ( dev-libs/libappindicator:3 )
	keybinder? ( dev-libs/keybinder:3 )"

PATCHES=("${FILESDIR}/${P}-icons.patch")

python_test() {
	esetup.py test || die
}
