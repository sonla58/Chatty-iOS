# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'Chatty' do

  use_frameworks!

  # Pods for Chatty

  pod 'Alamofire'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxGesture'
  pod 'NVActivityIndicatorView'
  pod 'IBAnimatable'
  pod 'IQKeyboardManagerSwift'
  pod 'SnapKit'
  pod 'EVReflection'
  pod 'SVProgressHUD'
  pod 'Kingfisher'
  pod 'Hero'
  pod 'SwiftDate'
  pod 'GoogleMaps'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.0'
            if config.name == 'Debug'
                config.build_settings['OTHER_SWIFT_FLAGS'] = '-DDebug'
                else
                config.build_settings['OTHER_SWIFT_FLAGS'] = ''
            end
        end
    end
end
