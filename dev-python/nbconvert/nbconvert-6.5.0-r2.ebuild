# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Converting Jupyter Notebooks"
HOMEPAGE="
	https://nbconvert.readthedocs.io/
	https://github.com/jupyter/nbconvert/
	https://pypi.org/project/nbconvert/
"
SRC_URI="
	mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv ~s390 ~sparc ~x86"

RDEPEND="
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/bleach[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
	>=dev-python/entrypoints-0.2.2[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/jupyter_core[${PYTHON_USEDEP}]
	dev-python/jupyterlab_pygments[${PYTHON_USEDEP}]
	>=dev-python/markupsafe-2.0[${PYTHON_USEDEP}]
	>=dev-python/mistune-2.0.2[${PYTHON_USEDEP}]
	dev-python/nbclient[${PYTHON_USEDEP}]
	dev-python/nbformat[${PYTHON_USEDEP}]
	>=dev-python/pandocfilters-1.4.1[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/tinycss2[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5.1.1[${PYTHON_USEDEP}]
	dev-python/testpath[${PYTHON_USEDEP}]
	www-servers/tornado[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pebble[${PYTHON_USEDEP}]
		dev-python/ipykernel[${PYTHON_USEDEP}]
		dev-python/ipywidgets[${PYTHON_USEDEP}]
		>=dev-python/jupyter_client-4.2[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/${P}-mistune-2.patch
)

src_test() {
	mkdir -p "${HOME}/.local" || die
	cp -r share "${HOME}/.local/" || die
	distutils-r1_src_test
}

python_test() {
	local EPYTEST_DESELECT=(
		# Missing pyppeteer for now
		# TODO: Doesn't skip?
		nbconvert/exporters/tests/test_webpdf.py
		# Needs pyppeteer too
		'nbconvert/tests/test_nbconvertapp.py::TestNbConvertApp::test_webpdf_with_chromium'
	)

	epytest --pyargs nbconvert
}

pkg_postinst() {
	if ! has_version app-text/pandoc ; then
		einfo "Pandoc is required for converting to formats other than Python,"
		einfo "HTML, and Markdown. If you need this functionality, install"
		einfo "app-text/pandoc."
	fi
}
