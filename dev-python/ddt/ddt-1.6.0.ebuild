# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} pypy3 )

inherit distutils-r1

DESCRIPTION="Data-Driven/Decorated Tests"
HOMEPAGE="
	https://pypi.org/project/ddt/
	https://github.com/datadriventests/ddt/
"
SRC_URI="
	https://github.com/datadriventests/ddt/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"

BDEPEND="
	test? (
		dev-python/six[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
