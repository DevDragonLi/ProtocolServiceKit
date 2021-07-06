Pod::Spec.new do |s|
  
  s.name             = 'ProtocolServiceKit'
  
  s.version          = '2.2.1'
  
  s.summary          = 'ProtocolServiceKit：The most efficient and concise iOS Component Middleware'

  s.description      = <<-DESC
    
    东半球最高效简洁的iOS组件中间件，支持Cache，Map机制。
    支持ObjC/Swift。
                       DESC

  s.homepage         = 'https://github.com/DevdragonLi/ProtocolServiceKit'
  
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  
  s.author           = { 'DevdragonLi' => 'dragonLi_52171@163.com' }
  
  s.source           = { :git => 'https://github.com/DevdragonLi/ProtocolServiceKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  
  s.swift_version = '5.0'

  s.default_subspec = 'ObjC'
  
  s.subspec 'Swift' do |ss|
    
    ss.source_files  = 'ProtocolServiceKit/**/*.{h,m,swift}'

  end

  s.subspec 'ObjC' do |ss|
    
    ss.source_files = 'ProtocolServiceKit/**/*.{h,m}'
  
    ss.public_header_files = 'ProtocolServiceKit/ProtocolServiceKit.h',
                             'ProtocolServiceKit/Core/*.h'
  end
                          
end
