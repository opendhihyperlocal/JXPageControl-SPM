#
# Be sure to run `pod lib lint JXPageControl.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JXPageControl'
  s.version          = '1.0.0'
  s.summary          = 'Custom UIPageControl: supports multiple animations, layouts'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Custom UIPageControl: a most complete PageControl framework that supports multiple animations and layouts.'

  s.homepage         = 'https://github.com/abhishekpundir-arch/JXPageControl-SPM'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Code-TanJX' => 'Code_TanJX@163.com' }
  s.source           = { :git => 'https://github.com/abhishekpundir-arch/JXPageControl-SPM.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'

  s.subspec 'Common' do |ss|
      ss.source_files = 'Sources/JXPageControl/Common/**/*.swift'
  end

  s.subspec 'Jump' do |ss|
      ss.source_files = 'Sources/JXPageControl/Jump/**/*.swift'
      ss.dependency 'JXPageControl/Common'
  end

  s.subspec 'Transform' do |ss|
      ss.source_files = 'Sources/JXPageControl/Transform/**/*.swift'
      ss.dependency 'JXPageControl/Common'
  end
  

end
