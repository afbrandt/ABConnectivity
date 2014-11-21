#
# Be sure to run `pod lib lint ABConnectivity.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ABConnectivity"
  s.version          = "0.1.0"
  s.summary          = "A simple iOS adhoc connection library."
  s.homepage         = "https://github.com/afbrandt/ABConnectivity"
  s.license          = 'MIT'
  s.author           = { "Andrew Brandt" => "abrandt@makeschool.com" }
  s.source           = { :git => "https://github.com/afbrandt/ABConnectivity.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.public_header_files = 'ABConnectivity/*.h'
  s.source_files = 'ABConnectivity/*.{h,m}'

  s.resource_bundles = {
    'ABConnectivity' => ['Pod/Assets/*.png']
  }

  s.frameworks = 'MultipeerConnectivity'
end
