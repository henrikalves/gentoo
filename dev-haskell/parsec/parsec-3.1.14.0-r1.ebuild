# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.1.1.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour" # Circular depens: test-suite"
# break circular dependencies:
# https://github.com/gentoo-haskell/gentoo-haskell/issues/810
CABAL_FEATURES+=" nocabaldep"
inherit haskell-cabal

DESCRIPTION="Monadic parser combinators"
HOMEPAGE="https://github.com/haskell/parsec"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
# keep in sync with ghc-8.8
KEYWORDS="~amd64 ~ppc64 ~x86 ~amd64-linux ~x86-linux"

RESTRICT=test # circular dependencies: dev-haskell/base-orphans->cabal->parsec[test]->test-framework-hunit->test-framework->base-orphans

RDEPEND=">=dev-haskell/mtl-1.1.1:=[profile?] <dev-haskell/mtl-2.3:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	>=dev-haskell/text-0.11.3.1:=[profile?] <dev-haskell/text-1.3:=[profile?]
"
DEPEND="${RDEPEND}"

CABAL_CORE_LIB_GHC_PV="PM:8.8.4-r1 PM:8.10.4-r1 PM:8.10.5-r1 PM:8.10.6 PM:8.10.7 PM:9.0.1-r1 PM:9.0.2 PM:9.0.2-r1 PM:9999"

src_prepare() {
	default
	cabal_chdeps \
		'base       >= 4.5.0   && < 4.14' 'base       >= 4.5.0' \
		'bytestring >= 0.9.2.1 && < 0.11' 'bytestring >= 0.9.2.1' \
		'semigroups >= 0.18 && < 0.20' 'semigroups >= 0.18'
}
