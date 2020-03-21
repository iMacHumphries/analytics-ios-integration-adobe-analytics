
PROJECT := Segment-Adobe-Analytics

XC_ARGS := -workspace $(PROJECT).xcworkspace
IOS_XCARGS := $(XC_ARGS) -destination "platform=iOS Simulator,name=iPhone 11" -sdk iphonesimulator
TVOS_XCARGS := $(XC_ARGS) -destination "platform=tvOS Simulator,name=Apple TV"

install: Podfile $(PROJECT).podspec
	pod repo update
	pod install

lint:
	pod lib lint --allow-warnings --use-libraries

clean:
	set -o pipefail && xcodebuild $(XC_ARGS) clean | xcprettys

build:
	set -o pipefail && xcodebuild $(XC_ARGS) | xcpretty

test-ios:
	set -o pipefail && xcodebuild clean test $(IOS_XCARGS) -scheme $(PROJECT)Tests ONLY_ACTIVE_ARCH=NO | xcpretty --report junit

test-tvos:
	set -o pipefail && xcodebuild clean test $(TVOS_XCARGS) -scheme Segment_Adobe_AnalyticsTestsTVOS ONLY_ACTIVE_ARCH=NO | xcpretty --report junit

test: test-ios test-tvos

.PHONY: clean install build test
