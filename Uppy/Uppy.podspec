Pod::Spec.new do |spec|
  spec.name         = "Uppy"
  spec.version      = "1.0.0"
  spec.summary      = "Uppy iOS SDK allows provides api's to control forced and manual updates for your iOS app."
  spec.homepage     = "https://everli.com"
  spec.license      = { :type => 'Apache-2.0', :file => 'LICENSE' }
  spec.author       = { "Arpit Williams" => "arpitwilliams@yahoo.com" }
  spec.platform     = :ios, "9.3"
  spec.source       = { :http => "https://github.com/Supermercato24/uppy-ios-sdk/blob/master/Uppy/Framework/Uppy.zip" }
  spec.swift_version       = "5.0"
end
