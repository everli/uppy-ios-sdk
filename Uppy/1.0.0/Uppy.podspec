Pod::Spec.new do |spec|
  spec.name         = "Uppy"
  spec.version      = "1.0.0"
  spec.summary      = "Uppy iOS SDK allows provides api's to control forced and manual updates for your iOS app."
  spec.homepage     = "https://github.com/awilliams88"
  spec.license      = { :type => 'MIT', :file => 'Uppy/MIT' }
  spec.author       = { "Arpit Williams" => "arpitwilliams@yahoo.com" }
  spec.platform     = :ios, "9.3"
  spec.source       = { :git => "https://github.com/Supermercato24/uppy-ios-sdk.git", :tag => spec.version.to_s }
  spec.ios.vendored_frameworks = "Uppy/build/Uppy.framework"
  spec.swift_version = "5.0"
end
