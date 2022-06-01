web = chrome
physical_android = adb-18181FDF6004RW-pl0J83._adb-tls-connect._tcp
virtual_android = emulator-5554

run-web:
	flutter run --device-id $(web)

run-physical-android:
	flutter run --device-id $(physical_android)

run-virtual-android:
	flutter run --device-id $(virtual_android)