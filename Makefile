web = chrome
physical_wifi_android = adb-18181FDF6004RW-pl0J83._adb-tls-connect._tcp
physical_wired_pixel = 18181FDF6004RW
physical_wired_xiaomi = 59ffc25f
virtual_android = emulator-5554
virtual_ios = F2BC7734-48AC-4C5C-8904-C85C92502418
local_ip = 192.168.1.104
web_port = 3000

run-web:		
	flutter run -d headless-server --web-port=8080 --device-id $(web)

run-web-local-network:
	flutter run -d web-server --web-hostname $(local_ip) --web-port $(web_port)

run-physical-wifi-android:
	flutter run --device-id $(physical_wifi_android)

run-physical-wired-pixel:
	flutter run --device-id $(physical_wired_pixel)

run-physical-wired-xiaomi:
	flutter run --device-id $(physical_wired_xiaomi)

run-virtual-android:
	flutter run --device-id $(virtual_android)

run-virtual-ios:
	flutter run --device-id $(virtual_android)