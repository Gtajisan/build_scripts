#!/bin/bash

rm -rf .repo/local_manifests/

repo init -u https://github.com/PixelOS-AOSP/manifest.git -b fourteen --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests -b Pixel-OS .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=FARHAN•xd
export BUILD_HOSTNAME=crave
export MITHORIUM_QCOM_HALS_DEFAULT_VARIANT=LA.UM.9.6.4.r1-05500-89xx.QSSI13.0
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch aosp_Mi439_4_19-ap2a-userdebug
make installclean
mka bacon