#!/bin/sh

adb connect 192.168.1.235

adb shell settings put global HIC_enable 0
adb shell settings put global activity_manager_constants max_cached_processes=16,power_check_max_cpu_1=50 # dumpsys activity settings
adb shell settings put global activity_starts_logging_enabled 0
adb shell settings put global adaptive_battery_management_enabled 1 #also (force_)app_standby_enabled 1
adb shell settings put global adb_enabled 1
adb shell settings put global always_finish_activities 1 # Don't use 1 if you want to use Widgets in custom Launcher!!!
adb shell settings put global animator_duration_scale 0.5 #leave some animation for spinners etc
adb shell settings put global app_auto_restriction_enabled 1
adb shell settings put global app_standby_enabled 1 #only if ADAPTIVE_BATTERY_MANAGEMENT_ENABLED 1
adb shell settings put global assisted_gps_enabled 0
adb shell settings put global job_scheduler_constants "fg_job_count=2,bg_normal_job_count=4,bg_moderate_job_count=2"
adb shell settings put global battery_saver_constants "force_all_apps_standby=true,launch_boost_disabled=false,animation_disabled=true" # dumpsys jobscheduler
adb shell settings put global battery_tip_constants app_restriction_enabled=true
adb shell settings put global ble_scan_always_enabled 0
adb shell settings put global ble_scan_background_mode 0 #0=low_power 1=balanced 2=low_latency 3=ambient_discovery
adb shell settings put global ble_scan_low_power_interval_ms 30000 #10240 now 30 sec, wifi/bt share antenna, after reboot goes back to 10240 (in framework res)
adb shell settings put global bluetooth_disabled_profiles 0
adb shell settings put global cached_apps_freezer enabled #A11
adb shell settings put global cell_on 0 #we have no ril
adb shell settings put global charging_vibration_enabled 0
adb shell settings put global connectivity_metrics_buffer_size 1000 #2000 max=10*2000
adb shell settings put global cpu_frequency_scaling_enabled 1 #only for MTK devices?
adb shell settings put global default_restrict_background_data 0
adb shell settings put global development_settings_enabled 1
adb shell settings put global digital_audio_format 2 # 0=pcm 1=manual 2=auto 3=spdif
adb shell settings put global digital_audio_subformat "5,6,7,8,9,10,14,17,18,19"  #5,6,7,10 (dolby might cause problems)
adb shell settings put global drc_mode 1 #0=off 1=line 2=rf 1/2=passthrough
adb shell settings put global dropbox_age_seconds 1
adb shell settings put global dropbox_max_files 1
adb shell settings put global enable_automatic_system_server_heap_dumps 0
adb shell settings put global enable_cellular_on_boot 0 #we have no ril
adb shell settings put global enable_diskstats_logging 0
adb shell settings put global enable_ephemeral_feature 0 # instant_apps
adb shell settings put global enable_freeform_support 0
adb shell settings put global encoded_surround_output 0 # 0=auto 1=never 2=always 3=manual (2/3 gives "not supported" box in Netflix)
adb shell settings put global encoded_surround_output_enabled_formats "5,6,7,8,9,10,14,17,18,19"  #5,6,7,10, cannot set if playing
adb shell settings put global external_surround_sound_enabled 0 #else problem with hbo max / SPDIF / Optical
adb shell settings put global fancy_ime_animations 0
adb shell settings put global force_resizable_activities 0
adb shell settings put global forced_app_standby_enabled 1
adb shell settings put global foreground_service_starts_logging_enabled 0
adb shell settings put global fstrim_mandatory_interval 604800000 #every week in ms
adb shell settings put global game_driver_all_apps 0 #0=def 1=gamedriver 2=syst graph driver
adb shell settings put global hdmi_control_auto_device_off_enabled 1
adb shell settings put global hdmi_control_auto_tv_off_enabled 1
adb shell settings put global hdmi_control_auto_wakeup_enabled 1
adb shell settings put global hdmi_control_one_touch_play_enabled 1
adb shell settings put global hdmi_control_send_standby_on_sleep broadcast
adb shell settings put global hdmi_control_volume_control_enabled 0 #if 1 no volume slider on some
adb shell settings put global hdmi_system_audio_control_enabled 1
adb shell settings put global hdmi_system_audio_status_enabled 1
adb shell settings put global heads_up_notifications_enabled 0
adb shell settings put global keep_profile_in_background 0 # also always finish activities 1
adb shell settings put global location_background_throttle_interval_ms 3600000 #600000 600x1000ms
adb shell settings put global mobile_data 0
adb shell settings put global mobile_data_always_on 0
adb shell settings put global netstats_enabled 0 # bandwidth control, some apps need this?
adb shell settings put global netstats_poll_interval 3600000 #def 30min 30*60*1000
adb shell settings put global network_avoid_bad_wifi 0
adb shell settings put global network_metered_multipath_preference 0 #(0 or 3) 1=handover 2=reliable 4=performance (5ghz) 3=1+2
adb shell settings put global network_recommendations_enabled -1  #-1=forced off 0=disabled 1=enabled
adb shell settings put global network_scoring_ui_enabled 0 #wifi_badging_thresholds
adb shell settings put global nrdp_external_surround_sound_enabled 0
adb shell settings put global nsd_on 1
adb shell settings put global ntp_server pool.ntp.org
adb shell settings put global ntp_timeout 60000 #def 5000, longer for network time
adb shell settings put global ota_disable_automatic_update 1 #system updates won't be automatically scheduled
adb shell settings put global private_dns_mode opportunistic # off / opportunistic / hostname(not for captive portal wifi connection)
adb shell settings put global read_external_storage_enforced_default 1
adb shell settings put global send_action_app_error 0 #is in secure?
adb shell settings put global shortcut_manager_constants "icon_quality=90"
adb shell settings put global show_hidden_icon_apps_enabled 1
adb shell settings put global show_temperature_warning 1
adb shell settings put global show_usb_temperature_alarm 1
adb shell settings put global stay_on_while_plugged_in 0
adb shell settings put global swap_enabled 1
adb shell settings put global sys_free_storage_log_interval 1440 # 1 day
adb shell settings put global sys_traced 0
adb shell settings put global sysui_powerui_enabled 1
adb shell settings put global system_fonts_name "Android Font" #dunno what other font is installed
adb shell settings put global tcp_default_init_rwnd 20 #60, kernel 4-20 MAJOR network speedup!
adb shell settings put global transition_animation_scale 0.0
adb shell settings put global unused_static_shared_lib_min_cache_period 300000 #2h 15min is 15*60*1000=900000 5m=300000
adb shell settings put global usb_mass_storage_enabled 1
adb shell settings put global use_external_surround_sound_flag 0 #SPDIF/optical
adb shell settings put global user_experience_enabled 0
adb shell settings put global user_switcher_enabled 0
adb shell settings put global warning_temperature 95 # is throttling down temp, cutoff is 120
adb shell settings put global webview_multiprocess 0 #1 might speed up but maybe crash
adb shell settings put global wifi_always_requested 1 #wifi always on
adb shell settings put global wifi_badging_thresholds "10:1000,20:2000,30:5000,40:10000,50:20000" #kb/s vs Wifi score (0-60)
adb shell settings put global wifi_country_code CN #Country and Channels here. 2 letter country codes here.
adb shell settings put global wifi_coverage_extend_feature_enabled 0
adb shell settings put global wifi_display_on 1 ### enable MIRACAST too !!! ### Windows 10 doesn't seem to work?
adb shell settings put global wifi_enhanced_auto_join 0
adb shell settings put global wifi_ephemeral_out_of_range_timeout_ms 60000 #60*1000 1min
adb shell settings put global wifi_framework_scan_interval_ms 0 #(10000) 5*60*1000 5min 0=don't scan when connected, we are stationary/screen on!
adb shell settings put global wifi_frequency_band 1 #0=auto 1=5 2=2.4
adb shell settings put global wifi_max_dhcp_retry_count 0 #0
adb shell settings put global wifi_network_show_rssi 0 #if verbose logging is on
adb shell settings put global wifi_networks_available_notification_on 0 #alert for open wifi networks
adb shell settings put global wifi_poor_connection_warning 0
adb shell settings put global wifi_scan_always_enabled 0
adb shell settings put global wifi_scan_throttle_enabled 0
adb shell settings put global wifi_score_params "rssi2=-95:-85:-73:-60,rssi5=-85:-82:-70:-57" #,nud=0,horizon=5
adb shell settings put global wifi_sleep_policy 2 # 0=def 1=never while plugged 2=never sleep
adb shell settings put global wifi_suspend_optimizations_enabled 0
adb shell settings put global wifi_supplicant_scan_interval_ms 5000 #15000 15sec search while connected for connect, roaming or open network, screen on, not wakeup scan
adb shell settings put global wifi_verbose_logging_enabled 1 #the cure for Wifi 5Ghz dropouts, more info in Wifi settings like RSSI and SCORE (0-60)
adb shell settings put global wifi_wakeup_available 0 #doesn't show, enable wifi at location
adb shell settings put global wifi_wakeup_enabled 0
adb shell settings put global wifi_watchdog_on 1 # needed for connection?
adb shell settings put global wifi_watchdog_poor_network_test_enabled 0 #still used?
adb shell settings put global window_animation_scale 0.0
adb shell settings put global zram_enabled 1
adb shell settings put global network_watchlist_enabled 0 #0
adb shell settings put global power_button_long_press 1 #0=nothing 1=normal 2=shutdown 3=noconfirm 4=voiceass 5=ass
adb shell settings put system advanced_settings 1 #google settings
adb shell settings put system auto_caps 0
adb shell settings put system auto_punctuate 0
adb shell settings put system auto_replace 0
adb shell settings put system bluetooth_discoverability 1 # 2=always 1=only connect 0=off, improve wifi!
adb shell settings put system bluetooth_discoverability_timeout 60 #120
adb shell settings delete system bluetooth_discoverable_timeout #wrong param
adb shell settings put system dk_desktop_pip -1 #-1  0...-1 how many PiP? FireOS
adb shell settings put system dk_log_level 0 #FireOS
adb shell settings put system font_scale 1.0
adb shell settings put system haptic_feedback_enabled 0
adb shell settings put system notification_light_pulse 0 #no notification led
adb shell settings put system pointer_speed 4 # -7 (0) +7
adb shell settings put system screen_off_timeout 300000 #900000=15 min, time to screensaver/dreams
adb shell settings put system show_touches 1
adb shell settings put system sound_effects_enabled 1
adb shell settings put system support_dolby 1  #also in /sys/class/amaudio/dolby_enable
adb shell settings put system time_12_24 24
adb shell settings put system user_log_enabled 0
adb shell settings put system vibrate_input_devices 0
adb shell settings put system volume_bluetooth_sco 15
adb shell settings put system volume_music_bt_a2dp 15
adb shell settings put system volume_music_hdmi 15
adb shell settings put system volume_system 12
adb shell settings put system volume_voice 12
adb shell settings put secure automatic_storage_manager_enabled 1 #1 if you want to clear cache
adb shell settings put secure automatic_storage_manager_days_to_retain 1 #(90) 10y don't touch my files, only cache
adb shell settings put secure backup_enabled 0
adb shell settings put secure bluetooth_name "M1" #shows message expected to de 'default'
adb shell settings put secure camera_gesture_disabled 1
adb shell settings put secure clock_seconds 0
adb shell settings put secure double_tap_to_wake 0
adb shell settings put secure doze_enabled 0
adb shell settings put secure immersive_mode_confirmations 0
adb shell settings put secure instant_apps_enabled 0 #no web apps engine
adb shell settings put secure location_mode 0 #no gps, AndrTV 0=off 1=on/gpsonly 2=on/nogps 3=on/high accuracy
adb shell settings put secure location_providers_allowed -gps,-wifi,-network #(gps,network)AndrTV, test wifi, but it is already in network in Andr9
adb shell settings put secure long_press_timeout 500
adb shell settings put secure mock_location 0 
adb shell settings put secure mount_ums_autostart 0 # mount usb mass storage doesn't work
adb shell settings put secure mount_ums_notify_enabled 0
adb shell settings put secure mount_ums_prompt 1
adb shell settings put secure multi_press_timeout 400
adb shell settings put secure night_display_activated 0
adb shell settings put secure night_display_auto_mode 0
adb shell settings put secure parental_control_enabled 0
adb shell settings put secure send_action_app_error 0 #is in secure
adb shell settings put secure show_ime_with_hard_keyboard 1
adb shell settings put secure sleep_timeout 3600000 # 1 hour auto off
adb shell settings put secure spell_checker_enabled 0
adb shell settings put secure system_navigation_keys_enabled 0 #n.a. for TV stick
adb shell settings put secure sysui_hwui_edge_bleed 0
adb shell settings put secure sysui_hwui_rounded_divider 0
adb shell settings put secure sysui_volume_down_silent 1
adb shell settings put secure sysui_volume_up_silent 1
adb shell settings put secure theme_mode 2 #0=auto 1=light 2=dark
adb shell settings put secure upload_debug_log_pref 0
adb shell settings put secure upload_log_pref 0
adb shell settings put secure ui_night_mode 2 #0=auto 1=light 2=dark, cmd uimode night no
adb shell settings put secure usb_audio_automatic_routing_disabled 1
adb shell settings put secure wake_gesture_enabled 0
adb shell settings put secure limit_ad_tracking 1 #Google TV 

adb shell appops set com.netflix.ninja RUN_IN_BACKGROUND ignore
adb shell appops set com.netflix.ninja RUN_ANY_IN_BACKGROUND ignore
adb shell appops set com.amazon.amazonvideo.livingroom RUN_IN_BACKGROUND ignore
adb shell appops set com.amazon.amazonvideo.livingroom RUN_ANY_IN_BACKGROUND ignore
adb shell appops reset com.feedr
adb shell appops reset com.weite_welt.urlimagewidget
adb shell appops reset tunein.player
adb shell appops reset com.weawow
adb shell appops write-settings


adb shell pm disable-user com.miui.tv.analytics
adb shell pm disable-user com.android.providers.calendar
adb shell pm disable-user com.google.android.syncadapters.calendar
adb shell pm disable-user mitv.service
adb shell pm disable-user com.spocky.projengmenu
adb shell pm disable-user com.mitv.tvhome.atv
adb shell pm disable-user mitv.tvhome.atv
adb shell pm disable-user android.autoinstalls.config.xioami.mibox3
adb shell pm disable-user com.xiaomi.mitv.updateservice
adb shell pm disable-user mitv.videoplayer
adb shell pm disable-user mitv.tvhome.michannel
adb shell pm disable-user mitv.dream
adb shell pm disable-user com.google.android.play.games
adb shell pm disable-user com.netflix.ninja
adb shell pm disable-user com.android.providers.contacts



adb shell pm trim-caches 4096G 

adb shell svc data disable
adb shell cmd shortcut reset-all-throttling
adb shell cmd stats write-to-disk
adb shell sm fstrim
adb shell sync
adb reboot



package:mitv.service
package:com.android.cts.priv.ctsshim
package:com.xiaomi.android.tvsetup.partnercustomizer
package:com.google.android.ext.services
package:com.google.android.apps.mediashell
package:com.google.android.katniss
package:com.android.dynsystem
package:com.android.providers.calendar
package:com.android.tv.settings
package:com.android.providers.media
package:com.google.android.onetimeinitializer
package:com.google.android.ext.shared
package:com.spocky.projengmenu
package:com.android.externalstorage
package:com.android.htmlviewer
package:com.android.companiondevicemanager
package:com.android.providers.downloads
package:com.android.providers.tv
package:com.android.networkstack.inprocess
package:com.google.android.backdrop
package:com.droidlogic
package:com.google.android.tungsten.setupwraith
package:android.autoinstalls.config.xioami.mibox3
package:com.xm.webcontent
package:com.google.android.overlay.modules.permissioncontroller
package:com.android.vending
package:com.android.pacprocessor
package:com.android.certinstaller
package:com.google.android.marvin.talkback
package:com.urbandroid.lux
package:android
package:com.android.mtp
package:com.mitv.tvhome.atv
package:com.android.backupconfirm
package:com.android.statementservice
package:com.waxrain.telnetd
package:com.android.settings.intelligence
package:com.google.android.permissioncontroller
package:com.mi.bluetooth
package:com.amazon.amazonvideo.livingroom
package:com.android.providers.settings
package:com.android.sharedstoragebackup
package:com.android.printspooler
package:com.xiaomi.mitv.updateservice
package:com.mitv.videoplayer
package:com.android.dreams.basic
package:com.google.android.overlay.modules.ext.services
package:com.android.se
package:com.android.inputdevices
package:com.google.android.tvrecommendations
package:com.xiaomi.mitv.smartshare
package:com.mm.droid.livetv.bluetv
package:com.google.android.modulemetadata
package:com.google.android.tvlauncher
package:com.google.android.webview
package:com.android.keychain
package:com.google.android.youtube.tvmusic
package:com.google.android.packageinstaller
package:com.google.android.gms
package:com.google.android.gsf
package:com.google.android.tts
package:com.android.wifi.resources
package:com.google.android.partnersetup
package:com.android.localtransport
package:com.android.networkstack.tethering.droidlogic
package:com.google.android.videos
package:com.xiaomo.tv.milegal
package:com.android.proxyhandler
package:com.google.android.overlay.modules.permissioncontroller.forframework
package:com.mitv.tvhome.mitvplus
package:com.google.android.feedback
package:com.google.android.syncadapters.calendar
package:com.android.soundpicker
package:com.android.networkstack.tethering.inprocess.droidlogic
package:com.miui.tv.analytics
package:com.xiaomi.wfdsinkhelperservice
package:com.android.networkstack.tethering.inprocess
package:com.android.networkstack.permissionconfig
package:com.xiaomi.statistic
package:com.google.android.sss.authbridge
package:com.android.cts.ctsshim
package:com.google.android.overlay.modules.modulemetadata.forframework
package:com.valor.mfc.droid.tvapp.generic
package:com.google.android.youtube.tv
package:com.android.vpndialogs
package:com.google.android.tv.frameworkpackagestubs
package:com.android.shell
package:com.android.wallpaperbackup
package:com.android.providers.userdictionary
package:com.android.providers.media.module
package:com.android.hotspot2.osulogin
package:com.google.android.tv.remote.service
package:com.android.location.fused
package:com.android.systemui
package:com.android.bluetoothmidiservice
package:com.mitv.dream
package:com.mitv.tvhome.michannel
package:com.google.android.play.games
package:com.netflix.ninja
package:com.android.bluetooth
package:com.android.providers.contacts
package:com.android.captiveportallogin
package:com.droidlogic.overlay
package:com.google.android.inputmethod.latin
