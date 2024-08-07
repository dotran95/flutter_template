# aliases
f=fvm flutter
d=fvm dart
RELEASE_VERSION_NAME ?= 1.1.0
BUILD_NUMBER ?= $(shell date +%s)
IOS_EXPORT_OPTION_PATH=./script/ExportOptions_adhoc.Plist

#Setup
setup: 
	make inst
	make gen

inst: 
	$f pub get 

gen:
	$d run build_runner build

doctor:
	$f doctor

#Run
dev:
	$f run --flavor dev -t lib/main.dart

stg:
	$f run --flavor stg -t lib/main.dart

prod:
	$f run --flavor product -t lib/main.dart

#Build

build/ios/dev:
	make inst
	$f build ipa --flavor dev -t lib/main.dart --build-number=$(BUILD_NUMBER) --export-options-plist=$(IOS_EXPORT_OPTION_PATH)

build/ios/stg: update_pubspec_version
	make inst
	$f build ipa --flavor stg -t lib/main.dart --build-number=$(BUILD_NUMBER) --export-options-plist=$(IOS_EXPORT_OPTION_PATH)

update_pubspec_version:
	yq -i '.version = "$(RELEASE_VERSION_NAME)+$(BUILD_NUMBER)"' pubspec.yaml
