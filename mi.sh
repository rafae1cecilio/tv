#!/bin/sh

adb connect 192.168.1.208 #Wifi5 or  192.168.1.235 #cable

adb shell /system/bin/device_config put activity_manager max_cached_processes 1
adb shell cmd power set-fixed-performance-mode-enabled true
adb shell settings put global fstrim_mandatory_interval 3600000
adb shell settings put global private_dns_mode hostname
adb shell settings put global private_dns_specifier Mi1--TLS-253919.dns.nextdns.io
adb shell settings put global swap_enabled 0
adb shell settings put global zram_enabled 0
adb shell settings put global sys_free_storage_log_interval 1440
adb shell settings put global tcp_default_init_rwnd 20
adb shell settings put global wifi_country_code US
adb shell settings put secure limit_ad_tracking 1
adb shell settings put system advanced_settings 1
adb shell settings put secure automatic_storage_manager_enabled 1
adb shell settings put secure bluetooth_name "M1"
adb shell settings put global connectivity_metrics_buffer_size 1000
adb shell settings put global unused_static_shared_lib_min_cache_period 300000
adb shell settings put global window_animation_scale 0.5
adb shell settings put global animator_duration_scale 0.5
adb shell settings put global transition_animation_scale 0.5

adb shell appops set com.netflix.ninja RUN_ANY_IN_BACKGROUND ignore
adb shell appops set com.netflix.ninja RUN_IN_BACKGROUND ignore
adb shell pm disable-user android.autoinstalls.config.xioami.mibox3
adb shell pm disable-user com.xiaomi.android.tvsetup.partnercustomizer
adb shell pm disable-user com.mitv.tvhome.michannel
adb shell pm disable-user com.miui.tv.analytics
adb shell pm disable-user com.xiaomo.tv.milegal
adb shell pm disable-user com.mitv.tvhome.mitvplus
adb shell pm disable-user com.google.android.tvrecommendations
adb shell pm disable-user com.xiaomi.statistic

adb shell pm trim-caches 4096G 

adb shell svc data disable
adb shell cmd shortcut reset-all-throttling
adb shell cmd stats write-to-disk
adb shell sm fstrim
adb shell sync
adb reboot
