#
# Be sure to run `pod lib lint Lib2.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Lib2'
  s.version          = '0.1.0'
  s.summary          = '项目简介'
  s.description      = '项目描述 要不简介更长'
  s.homepage         = 'https://e.coding.net/xiaooojun/lib2.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xiaojun' => 'wy961721716@163.com' }
  s.source           = { :git => 'https://e.coding.net/xiaooojun/lib2.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'Lib2/Classes/**/*'
  
  #下面这一行为新添加的
  s.swift_version = '5.0'
 
end
