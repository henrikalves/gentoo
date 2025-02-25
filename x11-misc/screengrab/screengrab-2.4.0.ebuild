# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg-utils

DESCRIPTION="Qt GUI Screenshot Utility"
HOMEPAGE="https://lxqt.github.io/"
SRC_URI="https://github.com/lxqt/${PN}/releases/download/${PV}/${P}.tar.xz"

LICENSE="GPL-2 GPL-2+ LGPL-2.1+"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 ~riscv x86"
IUSE=""

BDEPEND="dev-qt/linguist-tools:5"
DEPEND="
	>=dev-libs/libqtxdg-3.9.0
	>=dev-qt/qtcore-5.15:5
	>=dev-qt/qtdbus-5.15:5
	>=dev-qt/qtgui-5.15:5
	>=dev-qt/qtnetwork-5.15:5
	>=dev-qt/qtwidgets-5.15:5
	>=dev-qt/qtx11extras-5.15:5
	kde-frameworks/kwindowsystem:5[X]
	x11-libs/libX11
	x11-libs/libxcb:=
"
RDEPEND="${DEPEND}"

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
