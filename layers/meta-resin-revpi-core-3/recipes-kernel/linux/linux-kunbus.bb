FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"


# revpi-4.14
LINUX_VERSION_4_14 = "4.14.44"

SRCREV_4_14 = "e12040d15a0e7c5f3eb40ee8631878ee8e904767"
SRC_URI_4_14 = " \
    git://github.com/RevolutionPi/linux;branch=revpi-4.14 \
 	file://0001-Revert-cgroup-Disable-cgroup-memory-by-default.patch \
    "



# Linux-4.9-skb
LINUX_VERSION_4_9 = "4.9.76"

SRCREV_4_9 = "550f08be6c209d05181a3dbecae06f0719ce82f0"
SRC_URI_4_9 = " \
	git://github.com/RevolutionPi/linux;branch=revpi-4.9-skb \
"


SRCREV = "${@bb.utils.contains("PREFERRED_VERSION_linux-raspberrypi", "4.9.%", "${SRCREV_4_9}", "${SRCREV_4_14}", d)}"
SRC_URI = "${@bb.utils.contains("PREFERRED_VERSION_linux-raspberrypi", "4.9.%", "${SRC_URI_4_9}", "${SRC_URI_4_14}", d)}"
LINUX_VERSION = "${@bb.utils.contains("PREFERRED_VERSION_linux-raspberrypi", "4.9.%", "${LINUX_VERSION_4_9}", "${LINUX_VERSION_4_14}", d)}"

LINUX_KERNEL_TYPE = "preempt-rt"

require linux-raspberrypi.inc
