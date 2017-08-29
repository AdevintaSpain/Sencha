Pod::Spec.new do |s|

  s.name         = 'Matcha'
  s.version      = '0.2.0'
  s.summary      = 'The friendly version of EarlGrey'

  s.description  = <<-DESC
                   Provides a set of tools to facilitate the UI tests using EarlGrey, with a more developer-friendly API.
                   DESC

  s.homepage     = 'git@github.schibsted.io:scmspain/ios-common--lib-matcha.git'
  s.license      = { 'type' => 'Proprietary', 'text' => 'Copyright Schibsted All rights reserved.\n\n' }
  s.author       = 'Gil Serra'

  s.platform     = :ios, '8.0'

  s.source       = { :git => 'git@github.schibsted.io:scmspain/ios-common--lib-matcha.git', :tag => s.version.to_s }
  s.source_files  = 'Matcha/**/*.{swift,h,m}'
  
  s.framework = 'XCTest'
  s.dependency 'EarlGrey', '~> 1.9.0'
  s.requires_arc = true

end
