#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Cryptfshw
TARGET_EXCLUDE_CRYPTFSHW := true

# Inherit from mithorium-common
$(call inherit-product, device/xiaomi/olives-common/olives.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Overlays
PRODUCT_PACKAGES += \
    xiaomi_pine_overlay \
    xiaomi_olive_overlay \
    xiaomi_olive_overlay_Snap \
    xiaomi_olive_overlay_SystemUI

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Boot animation
TARGET_SCREEN_HEIGHT := 1440
TARGET_SCREEN_WIDTH := 720

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_olive/android.hardware.fingerprint.xml

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.xiaomi_mi439 \
    android.hardware.biometrics.fingerprint@2.2

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-goodix.kl

# Rootdir
PRODUCT_PACKAGES += \
    init.xiaomi.device.rc \
    init.xiaomi.device.sh

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/pine___def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/pine___def_qcomdev.conf \
    $(LOCAL_PATH)/configs/sensors/olive__def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/olive__def_qcomdev.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from vendor blobs
$(call inherit-product, vendor/xiaomi/olives/mi439-vendor.mk)
