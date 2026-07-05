APP_NAME := ZhouliGenerator
BUILD_DIR := .build
APP_DIR := $(BUILD_DIR)/$(APP_NAME).app
BIN_DIR := $(APP_DIR)/Contents/MacOS
BIN := $(BIN_DIR)/$(APP_NAME)
DIST_DIR := dist
PACKAGE_STAMP := $(shell date +%Y%m%d-%H%M%S)
PACKAGE_ROOT := $(DIST_DIR)/$(APP_NAME)-$(PACKAGE_STAMP)
DMG := $(DIST_DIR)/$(APP_NAME)-$(PACKAGE_STAMP).dmg

.PHONY: build run rebuild-run sign package clean

build:
	mkdir -p "$(BIN_DIR)"
	mkdir -p "$(APP_DIR)/Contents/Resources"
	rm -rf "$(APP_DIR)/Contents/_CodeSignature"
	clang -fobjc-arc -ObjC -mmacosx-version-min=13.0 \
		-framework Cocoa -framework Carbon -framework ApplicationServices \
		Sources/ZhouliMac/main.m -o "$(BIN)"
	cp Sources/ZhouliMac/Info.plist "$(APP_DIR)/Contents/Info.plist"
	codesign --force --deep --sign - "$(APP_DIR)"

run:
	open "$(APP_DIR)"

rebuild-run: build
	open "$(APP_DIR)"

sign: build
	codesign --force --deep --sign - "$(APP_DIR)"

package: build
	mkdir -p "$(PACKAGE_ROOT)"
	cp -R "$(APP_DIR)" "$(PACKAGE_ROOT)/"
	cp Packaging/安装说明.txt "$(PACKAGE_ROOT)/"
	ln -s /Applications "$(PACKAGE_ROOT)/Applications"
	hdiutil create -volname "周礼生成器" -srcfolder "$(PACKAGE_ROOT)" -ov -format UDZO "$(DMG)"
	@echo "Package created: $(DMG)"

clean:
	rm -rf "$(BUILD_DIR)"
