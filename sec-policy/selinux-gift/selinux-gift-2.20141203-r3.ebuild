# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-gift/selinux-gift-2.20141203-r3.ebuild,v 1.1 2015/01/29 09:52:17 perfinion Exp $
EAPI="5"

IUSE=""
MODS="gift"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for gift"

if [[ $PV == 9999* ]] ; then
	KEYWORDS=""
else
	KEYWORDS="~amd64 ~x86"
fi
