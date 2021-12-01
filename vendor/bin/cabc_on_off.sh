#!/system/bin/sh

vmode=`getprop vendor.hwc.video_mode`
if [ "$vmode" == "0" ]; then
	    ./vendor/bin/hw/hidl_aal_client 0
else
	    ./vendor/bin/hw/hidl_aal_client 2
fi;
