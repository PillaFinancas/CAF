#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint face_authenticator.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'face_authenticator'
  s.version          = '1.0.0'
  s.summary          = 'Flutter plugin for Combate à Fraudes FaceAuthenticator'
  s.homepage         = 'https://www.combateafraude.com/'
  s.license          = { :file => 'LICENSE' }
  s.author           = { 'frederico.gassen@combateafraude.com' => 'frederico.gassen@combateafraude.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  s.swift_version = '5.0'

  s.dependency 'Flutter'
  s.dependency 'FaceAuthenticator', '~> 1.3.0'
end
