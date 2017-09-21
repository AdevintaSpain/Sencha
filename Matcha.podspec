Pod::Spec.new do |s|

  s.name         = 'Matcha'
  s.version      = '0.3.0'
  s.summary      = 'The friendly version of EarlGrey'

  s.description  = <<-DESC
                   Provides a set of tools to facilitate the UI tests using EarlGrey, with a more developer-friendly API.
                   DESC

  s.homepage     = 'https://github.com/SchibstedSpain/Matcha.git'
  s.license      = { 'type' => 'Apache' }
  s.author       = 'Schibsted Spain'

  s.platform     = :ios, '8.0'

  s.source       = { :git => 'https://github.com/SchibstedSpain/Matcha.git', :tag => s.version.to_s }
  s.source_files  = 'Matcha/**/*.{swift,h,m}'
  
  s.framework = 'XCTest'
  s.dependency 'EarlGrey', '~> 1.12.1'
  s.requires_arc = true

end
