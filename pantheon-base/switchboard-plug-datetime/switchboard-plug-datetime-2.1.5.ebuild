# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

VALA_MIN_API_VERSION=0.22

inherit meson vala

DESCRIPTION="Configure the date & time of the user"
HOMEPAGE="https://github.com/elementary/switchboard-plug-datetime"
SRC_URI="https://github.com/elementary/switchboard-plug-datetime/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="nls"

DEPEND="${RDEPEND}
	$(vala_depend)
	nls? ( sys-devel/gettext )
	virtual/pkgconfig
"

RDEPEND="${DEPEND}
	dev-libs/glib:2
	dev-libs/granite
	pantheon-base/switchboard
	x11-libs/gtk+:3
"

src_prepare() {
	eapply_user

	vala_src_prepare
}

