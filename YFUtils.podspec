#
# Be sure to run `pod lib lint YFUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YFUtils'
  s.version          = '1.0.4'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.summary          = 'iOS common utilities'
  s.homepage         = 'https://github.com/yfben/YFUtils'
  s.author           = { 'yfben' => 'benxyz.chen@gmail.com' }
  s.source           = { :git => 'https://github.com/yfben/YFUtils.git', :tag => s.version.to_s }
  

  s.ios.deployment_target = '9.0'

  s.source_files = 'YFUtils/Classes/**/*.swift'
  s.resource = 'YFUtils/Resources/YFUtils.bundle'
  s.dependency 'Localize-Swift', '~> 2.0'
end
