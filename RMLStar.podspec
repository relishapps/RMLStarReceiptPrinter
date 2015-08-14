#
# Be sure to run `pod lib lint RMLStar.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "RMLStar"
  s.version          = "0.1.0"
  s.summary          = "An iOS wrapper for Star Micronics Receipt Printers."
  s.description      = <<-DESC
                       An iOS wrapper for Star Micronics Receipt Printers.

                       * Works with SM220i printer
                       DESC
  s.homepage         = "https://github.com/dansinclair25/RMLStar"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Dan Sinclair" => "dansinclair@me.com" }
  s.source           = { :git => "https://github.com/dansinclair25/RMLStar.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'RMLStar' => ['Pod/Assets/*.png']
  }

  s.vendored_frameworks = 'Pod/Frameworks/StarIO.framework'
  s.public_header_files = 'Pod/Classes/**/*.h', 'Pod/Frameworks/StarIO.framework/Headers/*h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'Pod/Frameworks/StarIO.framework'
end
