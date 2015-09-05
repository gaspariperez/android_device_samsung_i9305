#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk

-include device/samsung/smdk4412-common/BoardCommonConfig.mk
-include device/samsung/smdk4412-qcom-common/BoardCommonConfig.mk

LOCAL_PATH := device/samsung/i9305

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
  endif
endif

# Bionic
MALLOC_IMPL := dlmalloc

# RIL
COMMON_GLOBAL_CFLAGS += -DPROPERTY_PERMS_APPEND='{ "ril.ks.status", AID_SYSTEM, 0 },'

# Camera
COMMON_GLOBAL_CFLAGS += -DCAMERA_WITH_CITYID_PARAM

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/smdk4412
TARGET_KERNEL_CONFIG := custom_i9305_defconfig

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/i9305/rootdir/fstab.smdk4x12
RECOVERY_FSTAB_VERSION := 2

# assert
TARGET_OTA_ASSERT_DEVICE := m3,m3xx,i9305,GT-I9305

# inherit from the proprietary version
-include vendor/samsung/i9305/BoardConfigVendor.mk

# Selinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/i9305/selinux

BOARD_SEPOLICY_UNION += \
    bluetooth.te \
    radio.te \
    file_contexts \
    te_macros \
    device.te \
    dhcp.te \
    domain.te \
    file.te \
    init.te \
    kickstart.te \
    mediaserver.te \
    netd.te \
    netmgrd.te \
    nfc.te \
    qmiproxy.te \
    qmuxd.te \
    rild.te \
    secril.te \
    servicemanager.te \
    sysinit.te \
    system.te \
    system_app.te \
    system_server.te \
    time_daemon.te \
    ueventd.te \
    vold.te \
    wpa.te \
    wpa_supplicant.te \
    zygote.te
    
# TWRP
DEVICE_RESOLUTION := 720x1280

#RR
TARGET_TC_ROM := 5.1

TARGET_TC_KERNEL := 4.9

RROPTI := true

RR_O3 := true

RR_STRICT := false

RR_GRAPHITE := true

RR_KRAIT := false

RR_PIPE := true

TARGET_GCC_VERSION_EXP := $(TARGET_TC_ROM)

RR_KERNEL_CUSTOM_TOOLCHAIN := $(TARGET_TC_KERNEL)

WITH_LZMA_OTA := true
