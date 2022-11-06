DESCRIPTION = "Scripts to packet with the deployed images for flashing and updaing the SD card"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit systemd

SRC_URI = " \
    file://flash.sh \
"

S = "${WORKDIR}"

do_deploy() {
        install -d ${D}/${systemd_unitdir}/system
        install -m 0644 ${WORKDIR}/sync-scripts.service ${D}${systemd_unitdir}/system
        install -m 0644 ${WORKDIR}/sync-scripts.timer ${D}${systemd_unitdir}/system

        install -d ${D}/${bindir}
        install -m 0755 ${WORKDIR}/sync_* ${D}${bindir}
}


