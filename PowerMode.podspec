#
# Be sure to run `pod lib lint PowerMode.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PowerMode'
  s.version          = '0.9.1'
  s.summary          = 'PowerMode in iOS!'

  s.description = <<-DESCRIPTION
  PowerMode in iOS! Use PowerMode!!
        DESCRIPTION
  s.screenshots = [

  ]
  s.homepage         = 'https://github.com/younatics/PowerMode'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Seungyoun Yi" => "younatics@gmail.com" }
  s.social_media_url = 'https://twitter.com/younatics'

  s.source           = { 
    :git => 'https://github.com/younatics/PowerMode.git', 
    :tag => s.version.to_s }

  s.source_files     = 'PowerMode/*.swift'
  s.ios.deployment_target = '9.0'

  s.frameworks = 'UIKit'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
  s.requires_arc = true
end
