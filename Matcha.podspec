Pod::Spec.new do |s|

  s.name         = "Matcha"
  s.version      = "0.1.0"
  s.summary      = "The friendly version of EarlGrey"

  s.description  = <<-DESC
                   Provides a set of tools to facilitate the UI tests using EarlGrey, with a more developer-friendly API.
                   DESC

  s.homepage     = "https://github.schibsted.io/gil-serra/ios-common--lib-matcha"
  s.license      = { "type" => "Proprietary", "text" => "Copyright Schibsted All rights reserved.\n\n" }
  s.author       = "Gil Serra"

  s.platform     = :ios, "8.0"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }

  s.source       = { :git => "https://github.schibsted.io/gil-serra/ios-common--lib-matcha" }
  s.source_files  = "Matcha/**/*.swift"
  
  s.frameworks 'XCTest'
  s.dependency 'EarlGrey', '~> 1.9.2'

end
