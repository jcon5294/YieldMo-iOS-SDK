#
#  Be sure to run `pod spec lint YieldMo-iOS-SDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "YieldMo-iOS-SDK"
  s.version      = "0.0.1"
  s.summary      = "A repo for the (private source) YieldMo iOS SDK framework, to allow integration using CocoaPods."

  s.description  = <<-DESC
                   A repo for the (private source) YieldMo iOS SDK framework, to allow integration using CocoaPods.
                   DESC

  s.homepage     = "https://github.com/jcon5294/YieldMo-iOS-SDK"
  s.author       = { "Joseph Constan" => "jcon5294@gmail.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/jcon5294/YieldMo-iOS-SDK.git", :tag => "0.0.1" }

  s.source_files =        'Framework/ym.framework/Headers/*.h'
  s.public_header_files = 'Framework/ym.framework/Headers/*.h'
  s.preserve_paths =      'Framework/ym.framework/ym'
  s.frameworks =          'Framework/ym.framework'

  s.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(PODS_ROOT)/YieldMo-iOS-SDK/Framework/' } 

end
