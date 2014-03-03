Pod::Spec.new do |s|
  s.name         = "BOUI"
  s.version      = "0.0.1"
  s.summary      = "Shared UI components for Back Office apps."
  s.homepage     = "http://dpostigo.com"
  s.license      = 'BSD'
  s.author       = { "Dani Postigo" => "dani@firstperson.is" }
  s.source       = { :git => "https://github.com/dpostigo/BOUI.git", :tag => s.version.to_s }
  s.requires_arc = true


  # s.ios.deployment_target = '4.3'
  s.osx.deployment_target = '10.8'
  # s.osx.source_files = 'BOUI/osx/**.{h,m, xib}'
  # s.osx.resources = ["BOUI/osx/**/*.xib"]

  s.dependency   'BOAPI'
  s.dependency   'NSColor-Crayola'
  s.dependency   'DPKit'
  s.osx.dependency  'DPOutlineView'


  s.subspec 'Core' do |core|
    core.osx.source_files = 'BOUI/osx/core/**/*.{h,m}'
  end

  s.subspec 'Controllers' do |controllers|
    controllers.dependency  'BOUI/Core'
    controllers.osx.source_files = 'BOUI/osx/controllers/**/*.{h,m}'
    controllers.osx.resources = ["BOUI/osx/controllers/*.xib"]
  end

  s.subspec 'Components' do |components|
    components.dependency  'BOUI/Core'
    components.osx.source_files = 'BOUI/osx/components/**/*.{h,m}'
    components.osx.resources = ["BOUI/osx/components/*.xib"]
  end


end
