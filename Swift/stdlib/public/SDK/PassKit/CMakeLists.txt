add_swift_library(swiftPassKit IS_SDK_OVERLAY
  PassKit.swift
  TARGET_SDKS IOS IOS_SIMULATOR WATCHOS WATCHOS_SIMULATOR
  SWIFT_MODULE_DEPENDS Foundation UIKit Contacts
  SWIFT_COMPILE_FLAGS_WATCHOS -Xfrontend -disable-autolink-framework -Xfrontend CoreText
  FRAMEWORK_DEPENDS_WEAK PassKit
)
