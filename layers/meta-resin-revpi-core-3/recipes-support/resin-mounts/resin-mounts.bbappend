FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "\
	file://resin-boot.conf \
"

do_install_append() {
	install -d ${D}${sysconfdir}/systemd/system/resin-boot.service.d
	install -m 0644 resin-boot.conf ${D}${sysconfdir}/systemd/system/resin-boot.service.d/
}
