EAPI=7

DESCRIPTION="A minimalistic mpc-like CLI for mpv"
HOMEPAGE="https://github.com/gmt4/mpvc"
SRC_URI="https://github.com/gmt4/mpvc/archive/refs/tags/1.5-jukebox.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="fzf
	tui"

DEPEND=""
RDEPEND="media-video/mpv
		net-misc/socat
		app-alternatives/awk
		sys-apps/sed
		app-misc/jq
		x11-libs/libnotify
		fzf? ( app-shells/fzf net-misc/curl net-misc/yt-dlp )
		tui? ( app-misc/rlwrap )"

S="${WORKDIR}/${PN}-1.5-jukebox"

src_install() {
	einstalldocs
	exeinto /usr/bin
	doexe mpvc

	if use fzf; then
		doexe extras/mpvc-fzf
	fi
	if use tui; then
		doexe extras/mpvc-tui
	fi
}
