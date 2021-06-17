#source 'https://cdn.cocoapods.org'
use_frameworks! :linkage => :static
#use_modular_headers!
deployment_target = '9.0'
platform :ios, deployment_target
inhibit_all_warnings!
install! 'cocoapods',
:disable_input_output_paths => true,
:generate_multiple_pod_projects => true,
:preserve_pod_file_structure => true,
:warn_for_unused_master_specs_repo => false
#:modular_headers => true

target 'BAWKWebView-WebP' do
  pod 'SDWebImage'
  pod 'SDWebImageWebPCoder'
  
end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.build_configurations.each do |config|
        if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 9.0
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
        end
    end
    project.targets.each do |target|
      target.build_configurations.each do |config|
        if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 9.0
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
        end
      end
    end
  end
end
