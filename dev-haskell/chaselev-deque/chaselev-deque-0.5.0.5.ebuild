# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Chase & Lev work-stealing lock-free double-ended queues (deques)"
HOMEPAGE="https://github.com/rrnewton/haskell-lockfree/wiki"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~ppc64 ~x86"
IUSE="debug"

PATCHES=( "${FILESDIR}/bd458b66e1b28c249628e282ff42e8468646c557.patch" )

RDEPEND=">=dev-haskell/abstract-deque-0.3:=[profile?] <dev-haskell/abstract-deque-0.4:=[profile?]
	>=dev-haskell/atomic-primops-0.5.0.2:=[profile?]
	dev-haskell/vector:=[profile?]
	>=dev-lang/ghc-7.8.2:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
	test? ( >=dev-haskell/abstract-deque-tests-0.3
		dev-haskell/hunit
		dev-haskell/test-framework
		dev-haskell/test-framework-hunit )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag debug debug)
}
