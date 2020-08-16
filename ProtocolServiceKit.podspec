Pod::Spec.new do |s|
  s.name             = 'ProtocolServiceKit'
  s.version          = '1.1.0'
  s.summary          = '东半球最高效简洁的iOS组件中间件：ProtocolServiceKit'

  s.description      = <<-DESC
  东半球最高效简洁的iOS组件中间件1.1.0.
                       DESC

  s.homepage         = 'https://github.com/DevdragonLi/ProtocolServiceKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DevdragonLi' => 'dragonLi_52171@163.com' }
  s.source           = { :git => 'https://github.com/DevdragonLi/ProtocolServiceKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'ProtocolServiceKit/**/*.{h,m}'
  s.public_header_files = 'ProtocolServiceKit/Classes/ProtocolServiceKit.h','ProtocolServiceKit/Classes/Core/*.h'

end
