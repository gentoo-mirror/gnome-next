# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/rest/rest-0.7.90.ebuild,v 1.9 2013/12/08 19:27:15 pacho Exp $

EAPI="5"
GCONF_DEBUG="no"
GNOME2_LA_PUNT="yes"

inherit gnome2 virtualx

DESCRIPTION="Helper library for RESTful services"
HOMEPAGE="http://live.gnome.org/Librest"

LICENSE="LGPL-2.1"
SLOT="0.7"
IUSE="+gnome +introspection test"
KEYWORDS="~alpha amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc x86"

# Coverage testing should not be enabled
RDEPEND="app-misc/ca-certificates
	>=dev-libs/glib-2.24:2
	dev-libs/libxml2:2
	net-libs/libsoup:2.4
	gnome? ( >=net-libs/libsoup-2.45.90 )
	introspection? ( >=dev-libs/gobject-introspection-0.6.7 )"

DEPEND="${RDEPEND}
	>=dev-util/gtk-doc-am-1.13
	>=dev-util/intltool-0.40
	virtual/pkgconfig
	test? ( sys-apps/dbus )"

src_configure() {
	G2CONF="${G2CONF}
		--disable-static
		--disable-gcov
		--with-ca-certificates=${EPREFIX}/etc/ssl/certs/ca-certificates.crt
		$(use_with gnome)
		$(use_enable introspection)"
	gnome2_src_configure
}

src_test() {
	# Tests need dbus
	Xemake check || die
}
