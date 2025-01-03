#!/bin/sh

apt update && apt install curl wget android-tools-adb -y

wget https://github.com/nova-video-player/aos-AVP/releases/download/v6.3.15/org.courville.nova-2615316-6.3.15-20241221.1501-universal-release.apk -O nova.apk 
wget https://github.com/tailscale/tailscale-android/releases/download/1.78.0-tb06ec2696-ge8bd36bfd/tailscale-android-universal-1.78.0.apk -O tailscale.apk
wget https://github.com/rafae1cecilio/tv/raw/refs/heads/main/apps/mfc.apk -O mfc.apk
wget https://github.com/rafae1cecilio/tv/raw/refs/heads/main/apps/RedPlay_3.8.1.apk -O redtv.apk
wget https://github.com/jellyfin/jellyfin-android/releases/download/v2.6.2/jellyfin-android-v2.6.2-libre-release.apk -O jellyfin.apk
#wget https://github.com/spocky/miproja1/releases/download/4.54/ProjectivyLauncher-4.54-c70-xda-release.apk -O launcher.apk
wget https://dl.strem.io/android/v1.6.12-com.stremio.one/com.stremio.one-1.6.12-11049190-armeabi-v7a.apk -O stremio.apk
#wget https://syncler.net/d -O syncler.apk
#wget https://weyd.app/d -O weyd.apk

IP="192.168.1.167"

adb connect $IP

adb -s $IP install -r -d nova.apk 
adb -s $IP install -r -d tailscale.apk
adb -s $IP install -r -d mfc.apk
adb -s $IP install -r -d redtv.apk
adb -s $IP install -r -d jellyfin.apk
#adb -s $IP install -r -d launcher.apk
adb -s $IP install -r -d stremio.apk
#adb -s $IP install -r -d syncler.apk
#adb -s $IP install -r -d weyd.apk


adb -s $IP shell pm disable-user --user 0 com.google.android.onetimeinitializer
adb -s $IP shell pm disable-user --user 0 com.google.android.partnersetup
adb -s $IP shell pm disable-user --user 0 android.autoinstalls.config.soc.amlogic
adb -s $IP shell pm disable-user --user 0 com.disney.disneyplus
#adb -s $IP shell pm disable-user --user 0 com.droidlogic.launcher.provider
adb -s $IP shell pm disable-user --user 0 com.android.printspooler
adb -s $IP shell pm disable-user --user 0 com.amazon.amazonvideo.livingroom
adb -s $IP shell pm disable-user --user 0 com.google.android.play.games
adb -s $IP shell pm disable-user --user 0 com.netflix.ninja
adb -s $IP shell pm disable-user --user 0 com.disney.disneyplus
adb -s $IP shell pm disable-user --user 0 com.cbs.ca
adb -s $IP shell pm disable-user --user 0 com.google.android.youtube.tvmusic
adb -s $IP shell pm disable-user --user 0 ar.com.flow.androidtv
adb -s $IP shell pm disable-user --user 0 com.wbd.stream
adb -s $IP shell pm disable-user --user 0 com.google.android.videos

adb -s $IP shell appops set com.netflix.ninja RUN_IN_BACKGROUND ignore
adb -s $IP shell appops set com.netflix.ninja RUN_ANY_IN_BACKGROUND ignore
adb -s $IP shell appops set com.amazon.amazonvideo.livingroom RUN_IN_BACKGROUND ignore
adb -s $IP shell appops set com.amazon.amazonvideo.livingroom RUN_ANY_IN_BACKGROUND ignore
adb -s $IP shell appops write-settings

#adb -s $IP shell settings put global http_proxy 192.168.1.5:3128
#adb -s $IP shell settings put global global_http_proxy_host 192.168.1.5
#adb -s $IP shell settings put global global_http_proxy_port 3128

adb -s $IP shell settings put global private_dns_mode hostname
adb -s $IP shell settings put global private_dns_specifier ON--4K-c87e29.dns.nextdns.io

adb -s $IP shell settings put secure limit_ad_tracking 1 #Google TV 
adb -s $IP shell settings put secure bluetooth_name "ON-TV" #shows message expected to de 'default'

adb -s $IP shell settings put global wifi_max_dhcp_retry_count 0 #0
adb -s $IP shell settings put global wifi_network_show_rssi 0 #if verbose logging is on
adb -s $IP shell settings put global wifi_networks_available_notification_on 0 #alert for open wifi networks
adb -s $IP shell settings put global wifi_poor_connection_warning 0
adb -s $IP shell settings put global wifi_scan_always_enabled 0
adb -s $IP shell settings put global wifi_scan_throttle_enabled 0
adb -s $IP shell settings put global wifi_frequency_band 1 #0=auto 1=5 2=2.4
adb -s $IP shell settings put global wifi_framework_scan_interval_ms 0
adb -s $IP shell settings put global wifi_country_code US

adb -s $IP shell settings put secure doze_enabled 0
adb -s $IP shell settings put global swap_enabled 0
adb -s $IP shell settings put global zram_enabled 1

#adb -s $IP shell settings put global sys_free_storage_log_interval 1440 # 1 day
#adb -s $IP shell settings put global sys_traced 0
#adb -s $IP shell settings put global sysui_powerui_enabled 1
#adb -s $IP shell settings put global system_fonts_name "Android Font" #dunno what other font is installed
#adb -s $IP shell settings put global tcp_default_init_rwnd 20 #60, kernel 4-20 MAJOR network speedup!

adb -s $IP shell settings put global transition_animation_scale 0.2
adb -s $IP shell settings put global animator_duration_scale 0.5 #leave some animation for spinners etc
adb -s $IP shell settings put global window_animation_scale 0.2
adb -s $IP shell settings put global show_hidden_icon_apps_enabled 1

adb -s $IP shell settings put global ntp_server time.cloudflare.com
adb -s $IP shell settings put global ntp_timeout 60000 #def 5000, longer for network time


adb -s $IP shell settings put global mobile_data 0
adb -s $IP shell settings put global mobile_data_always_on 0

#adb -s $IP shell settings put global netstats_enabled 0 # bandwidth control, some apps need this?
#adb -s $IP shell settings put global netstats_poll_interval 3600000 #def 30min 30*60*1000

adb -s $IP shell settings put global network_avoid_bad_wifi 0
adb -s $IP shell settings put global network_metered_multipath_preference 0 #(0 or 3) 1=handover 2=reliable 4=performance (5ghz) 3=1+2
adb -s $IP shell settings put global network_recommendations_enabled -1  #-1=forced off 0=disabled 1=enabled
adb -s $IP shell settings put global network_scoring_ui_enabled 0 #wifi_badging_thresholds

adb -s $IP shell settings put global fstrim_mandatory_interval 604800000 #every week in ms
#adb -s $IP shell /system/bin/device_config put activity_manager max_cached_processes 16
#adb -s $IP shell /system/bin/device_config put activity_manager max_phantom_processes 32
#adb -s $IP shell /system/bin/device_config set_sync_disabled_for_tests persistent
#adb -s $IP shell cmd power set-fixed-performance-mode-enabled true

adb -s $IP shell settings put system rakuten_denwa 0
adb -s $IP shell settings put system send_security_reports 0
adb -s $IP shell settings put secure send_action_app_error 0
adb -s $IP shell settings put global activity_starts_logging_enabled 0
adb -s $IP shell settings put global disable_window_blurs 1
adb -s $IP shell settings put global accessibility_reduce_transparency 1

adb -s $IP shell setprop debug.force-opengl 1
adb -s $IP shell setprop debug.hwc.force_gpu_vsync 1
adb -s $IP shell settings put global ram_expand_size 0 default
adb -s $IP shell settings put system multicore_packet_scheduler 1
adb -s $IP shell settings put global sem_enhanced_cpu_responsiveness 1

adb -s $IP shell settings put secure long_press_timeout 250
adb -s $IP shell settings put secure multi_press_timeout 250
adb -s $IP shell settings put secure tap_duration_threshold 0.0
adb -s $IP shell settings put secure touch_blocking_period 0.0


adb -s $IP shell settings put system intelligent_sleep_mode 0
adb -s $IP shell settings put secure adaptive_sleep 0
adb -s $IP shell settings put global app_restriction_enabled true
#adb -s $IP shell settings put global automatic_power_save_mode 0
adb -s $IP shell settings put global sem_enhanced_cpu_responsiveness 0
adb -s $IP shell settings put global adaptive_battery_management_enabled 0

adb -s $IP shell settings put secure location_mode 0 #no gps, AndrTV 0=off 1=on/gpsonly 2=on/nogps 3=on/high accuracy
adb -s $IP shell settings put global location_background_throttle_interval_ms 3600000 #600000 600x1000ms

adb -s $IP shell settings put global ble_scan_always_enabled 0
adb -s $IP shell settings put global ble_scan_background_mode 0

adb -s $IP shell settings put secure automatic_storage_manager_enabled 1 #1 if you want to clear cache
adb -s $IP shell settings put secure automatic_storage_manager_days_to_retain 5 #(90) 10y don't touch my files, only cache

adb -s $IP shell pm trim-caches 4096G 

adb -s $IP shell svc data disable
adb -s $IP shell cmd shortcut reset-all-throttling
adb -s $IP shell cmd stats write-to-disk
adb -s $IP shell sm fstrim
adb -s $IP shell sync
adb -s $IP reboot
