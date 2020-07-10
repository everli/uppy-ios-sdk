Pod::Spec.new do |spec|
  spec.name         = "Uppy"
  spec.version      = "1.0.0"
  spec.summary      = "Uppy iOS SDK provides api's for controlling manual & forced updates for iOS app."
  spec.homepage     = "https://github.com/awilliams88"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { "Arpit Williams" => "arpitwilliams@yahoo.com" }
  spec.platform     = :ios, "9.3"
  spec.source       = { :git => "https://github.com/Supermercato24/uppy-ios-sdk.git", :tag => spec.version }
  spec.ios.vendored_frameworks = "build/Uppy.framework"
  spec.swift_version = "5.0"
end
