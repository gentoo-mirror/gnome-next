# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit gnome.org meson xdg python-single-r1

DESCRIPTION="An IRC client for Gnome"
HOMEPAGE="https://wiki.gnome.org/Apps/Polari"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

COMMON_DEPEND="
	>=x11-libs/gtk+-3.21.6:3[introspection]
	net-libs/telepathy-glib[introspection]
	>=dev-libs/glib-2.43.4:2
	>=dev-libs/gobject-introspection-1.50:=
	>=dev-libs/gjs-1.45.3
	x11-libs/gdk-pixbuf:2[introspection]
	>=app-text/gspell-1.4.0[introspection]
	x11-libs/pango[introspection]
	app-crypt/libsecret[introspection]
	net-libs/libsoup:2.4[introspection]
	net-im/telepathy-logger[introspection]
	>=gnome-base/gsettings-desktop-schemas-3.37.2
"
RDEPEND="${COMMON_DEPEND}
	>=net-irc/telepathy-idle-0.2
"
DEPEND="${COMMON_DEPEND}
	app-text/yelp-tools
	dev-libs/appstream-glib
	>=sys-devel/gettext-0.19.6
	virtual/pkgconfig
"
