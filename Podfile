# Uncomment the next line to define a global platform for your project
source 'https://github.com/CocoaPods/Specs.git'
# platform :ios, '10.0'

target 'UnderDog Prototype (iOS)' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for UnderDog Prototype (iOS)
  pod 'Firebase/Analytics'
  pod 'Firebase/Auth'
  pod 'Firebase/Database'
  pod 'Firebase/Firestore'
  pod 'FirebaseFirestoreSwift'
  pod 'Alamofire', '~> 5.2'
  
  post_install do |installer|
   installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
     config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
    end
   end
  end

end

target 'UnderDog Prototype (macOS)' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for UnderDog Prototype (macOS)

end
