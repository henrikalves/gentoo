# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.5.5
# hackport: flags: +split-base
CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Native wcwidth"
HOMEPAGE="https://github.com/solidsnack/wcwidth/"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~ppc64 ~x86"
IUSE="cli"

RDEPEND=">=dev-lang/ghc-7.4.1:=
	cli? ( >=dev-haskell/attoparsec-0.8.5:=[profile?]
		>=dev-haskell/setlocale-0.0.3:=[profile?]
		>=dev-haskell/utf8-string-0.3:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6.0
"

PATCHES=( "${FILESDIR}"/${P}-fix-build-failure.patch )

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag cli cli) \
		--flag=split-base
}
