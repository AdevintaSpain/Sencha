Pod::Spec.new do |s|

  s.name         = 'Sencha'
  s.version      = '1.0.0'
  s.summary      = 'The f̶r̶i̶e̶n̶d̶l̶y̶ other version of E̶a̶r̶l̶G̶r̶e̶y̶ KIF 🤷'

  s.description  = <<-DESC
                    Provides a set of tools to implement UI tests using KIF.
                   DESC

  s.homepage     = 'https://github.com/SchibstedSpain/Sencha'
  s.license      = { 'type' => 'Apache' }
  s.author       = 'Schibsted Spain'

  s.platform     = :ios, '9.0'

  s.source       = { :git => 'https://github.com/SchibstedSpain/Sencha.git', :tag => s.version.to_s }
  s.source_files  = 'Sencha/**/*.{swift,h,m}'
  
  s.framework = 'XCTest'

  s.dependency 'KIF'
  s.dependency 'KIF/IdentifierTests'
  s.dependency 'EarlGrey', '~> 1.16'

  s.swift_version = '5.0'

end
