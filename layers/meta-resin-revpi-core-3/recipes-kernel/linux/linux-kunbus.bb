FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

LINUX_VERSION = "4.14.44"

SRCREV = "116b34682888cd607178e50dfae2c5431c6d75cb"
SRC_URI = " \
	git://github.com/RevolutionPi/linux;branch=revpi-4.14 \
"

require linux-raspberrypi.inc
