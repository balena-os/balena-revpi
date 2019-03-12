inherit kernel-resin

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	file://0001-Add-kunbus-overlay.patch \
	"

# Set console accordingly to build type
DEBUG_CMDLINE = "dwc_otg.lpm_enable=0 console=tty1 console=serial0,115200 root=LABEL=resin-rootA rootfstype=ext4 rootwait"
PRODUCTION_CMDLINE = "dwc_otg.lpm_enable=0 console=null root=LABEL=resin-rootA rootfstype=ext4 rootwait vt.global_cursor_default=0"
CMDLINE = "${@bb.utils.contains('DISTRO_FEATURES','development-image',"${DEBUG_CMDLINE}","${PRODUCTION_CMDLINE}",d)}"
CMDLINE_DEBUG = ""

RESIN_CONFIGS_append = " fbtft"
RESIN_CONFIGS[fbtft] = " \
    CONFIG_STAGING=y \
    CONFIG_FB_TFT=m \
    CONFIG_FB_TFT_AGM1264K_FL=m \
    CONFIG_FB_TFT_BD663474=m \
    CONFIG_FB_TFT_HX8340BN=m \
    CONFIG_FB_TFT_HX8347D=m \
    CONFIG_FB_TFT_HX8353D=m \
    CONFIG_FB_TFT_ILI9163=m \
    CONFIG_FB_TFT_ILI9320=m \
    CONFIG_FB_TFT_ILI9325=m \
    CONFIG_FB_TFT_ILI9340=m \
    CONFIG_FB_TFT_ILI9341=m \
    CONFIG_FB_TFT_ILI9481=m \
    CONFIG_FB_TFT_ILI9486=m \
    CONFIG_FB_TFT_PCD8544=m \
    CONFIG_FB_TFT_RA8875=m \
    CONFIG_FB_TFT_S6D02A1=m \
    CONFIG_FB_TFT_S6D1121=m \
    CONFIG_FB_TFT_SSD1289=m \
    CONFIG_FB_TFT_SSD1306=m \
    CONFIG_FB_TFT_SSD1331=m \
    CONFIG_FB_TFT_SSD1351=m \
    CONFIG_FB_TFT_ST7735R=m \
    CONFIG_FB_TFT_TINYLCD=m \
    CONFIG_FB_TFT_TLS8204=m \
    CONFIG_FB_TFT_UC1701=m \
    CONFIG_FB_TFT_UPD161704=m \
    CONFIG_FB_TFT_WATTEROTT=m \
    CONFIG_FB_FLEX=m \
    CONFIG_FB_TFT_FBTFT_DEVICE=m \
    "

RESIN_CONFIGS_append = " pca955_gpio_expander"
RESIN_CONFIGS[pca955_gpio_expander] = " \
    CONFIG_GPIO_PCA953X=y \
    CONFIG_GPIO_PCA953X_IRQ=y \
    "

do_configure_prepend_revpi-core-3() {
    # Configure for Balena OS
    kernel_configure_variable PREEMPT_RT_FULL=y
	kernel_configure_variable DEBUG_PREEMPT=n
	kernel_configure_variable SECURITY=y	        # for ptrace_scope
	kernel_configure_variable SECURITY_YAMA=y	    # for ptrace_scope
	kernel_configure_variable INTEGRITY=n	        # for ptrace_scope
	kernel_configure_variable SUSPEND=y	            # suspend testing
	kernel_configure_variable PM_WAKELOCKS=y	    # suspend testing
	kernel_configure_variable RTC_HCTOSYS=y	        # sync from rtc on boot
	kernel_configure_variable RTC_DRV_PCF2127=y     # sync from rtc on boot
	kernel_configure_variable I2C_BCM2708=y	        # sync from rtc on boot
	kernel_configure_variable I2C_BCM2835=y	        # sync from rtc on boot
	kernel_configure_variable CGROUP_PIDS=y	        # amazon greengrass
	kernel_configure_variable KS8851=m		        # revpi compact eth1
	kernel_configure_variable GPIO_74X164=m	        # revpi compact dout
	kernel_configure_variable TI_DAC082S085=m	    # revpi compact aout
	kernel_configure_variable MULTIPLEXER=m	        # revpi compact ain mux
	kernel_configure_variable MUX_GPIO=m	        # revpi compact ain mux
	kernel_configure_variable IIO_MUX=m	            # revpi compact ain mux
	kernel_configure_variable CAN_HI311X=m	        # revpi con can
	kernel_configure_variable USB_DWC2=y	        # alternative to dwc_otg
	kernel_configure_variable RTL8XXXU_UNTESTED=y	# edimax ew-7811un
}

RESIN_CONFIGS_append = " max3191x"
RESIN_CONFIGS[max3191x] = " \
    CONFIG_GPIO_MAX3191X=y \
"

KERNEL_MODULE_PROBECONF += "rtl8192cu"
module_conf_rtl8192cu = "blacklist rtl8192cu"
