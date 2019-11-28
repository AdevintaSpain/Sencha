Pod::Spec.new do |s|

  s.name         = 'Sencha'
  s.version      = '0.14.1'
  s.summary      = 'The friendly version of EarlGrey'

  s.description  = <<-DESC
                   Provides a set of tools to facilitate the UI tests using EarlGrey, with a more developer-friendly API.
                   DESC

  s.homepage     = 'https://github.com/SchibstedSpain/Sencha'
  s.license      = { 'type' => 'Apache' }
  s.author       = 'Schibsted Spain'

  s.platform     = :ios, '8.0'

  s.source       = { :git => 'https://github.com/SchibstedSpain/Sencha.git', :tag => s.version.to_s }
  s.source_files  = 'Sencha/**/*.{swift,h,m}'
  
  s.framework = 'XCTest'
  s.dependency 'EarlGrey', '~> 1.16.0'
  s.swift_version = '5.0'

end
