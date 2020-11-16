# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'playground' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!
  pod "Texture", '~>2.7'
  pod "Resolver"
  pod "PINCache", "3.0.1"
  pod 'RxSwift', '~>5.0.0'
  pod 'RxCocoa', '~>5.0.0'
  pod 'RxCocoa-Texture', '3.1.0'

  # Pods for playground

  target 'playgroundTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'playgroundUITests' do
    # Pods for testing
  end

end
