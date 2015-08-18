#
# Be sure to run `pod lib lint RMLStarReceiptPrinter.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "RMLStarReceiptPrinter"
  s.version          = "1.0.0"
  s.summary          = "Wrapper for StarIO SDK"
  s.description      = <<-DESC
                       RMLStarReceiptPrinter makes printing receipts a breeze!
                       DESC
  s.homepage         = "https://github.com/relishmedia/RMLStarReceiptPrinter"
  s.license          = 'MIT'
  s.author           = { "Pawel Decowski" => "pawel@relish.io" }
  s.source           = { :git => "https://github.com/relishmedia/RMLStarReceiptPrinter.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/relishmedia'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.vendored_frameworks = 'Pod/Frameworks/StarIO.framework'
  s.resource_bundles = {
    'RMLStarReceiptPrinter' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
