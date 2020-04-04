#!/system/bin/sh

vmode=`getprop sys.hwc.video_mode`
if [ "$vmode" == "0" ]; then
	    dumpsys AAL --function 0
else
	    dumpsys AAL --function 2
fi;
