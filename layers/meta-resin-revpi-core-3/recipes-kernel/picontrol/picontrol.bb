SUMMARY = "Kunbus PiControl kernel module"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"

inherit module

# Linux-4.14
SRCREV_4_14 = "f3f4e463d0269d8e4ef2b0a8d599cbf759326427"
SRC_URI_4_14 = "git://github.com/RevolutionPi/piControl;branch=revpi-4.14 \
                file://0001-Use-modules_install-as-wanted-by-yocto.patch \
                file://0002-Search-config-file-in-mnt-boot.patch \
"


# Linux-4.9
SRCREV_4_9 = "ac30180b7af190beccd2becdb0c8a1766c598598"
SRC_URI_4_9 = "git://github.com/RevolutionPi/piControl;branch=skb \
               file://0001-Use-modules_install-as-wanted-by-yocto.patch \
               file://0002-Search-config-file-in-mnt-boot.patch \
"


SRCREV = "${@bb.utils.contains("PREFERRED_VERSION_linux-raspberrypi", "4.9.%", "${SRCREV_4_9}", "${SRCREV_4_14}", d)}"
SRC_URI = "${@bb.utils.contains("PREFERRED_VERSION_linux-raspberrypi", "4.9.%", "${SRC_URI_4_9}", "${SRC_URI_4_14}", d)}"

S = "${WORKDIR}/git"

EXTRA_OEMAKE_append = " KDIR=${STAGING_KERNEL_DIR}"
TARGET_CFLAGS_append = " -I${S} -D__KUNBUSPI_KERNEL__"
