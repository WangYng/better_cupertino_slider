#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint better_cupertino_slider.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'better_cupertino_slider'
  s.version          = '0.0.2'
  s.summary          = 'Better cupertino slider.'
  s.description      = <<-DESC
Better cupertino slider.
                       DESC
  s.homepage         = 'https://github.com/WangYng/better_cupertino_slider'
  s.license          = { :file => '../LICENSE' }
  s.author           = { '汪洋' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
