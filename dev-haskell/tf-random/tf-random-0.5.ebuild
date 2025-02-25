# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.4.9999

CABAL_FEATURES="lib profile" # non-ASCII in .cabal: haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="High-quality splittable pseudorandom number generator"
HOMEPAGE="https://hackage.haskell.org/package/tf-random"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~ppc64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/primitive-0.3:=[profile?]
	dev-haskell/random:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
"
