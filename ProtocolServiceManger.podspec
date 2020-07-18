Pod::Spec.new do |s|
  s.name             = 'ProtocolServiceManger'
  s.version          = '1.0.0'
  s.summary          = 'A short description of ProtocolServiceManger.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/DevdragonLi/ProtocolServiceManger'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DevdragonLi' => 'dragonLi_52171@163.com' }
  s.source           = { :git => 'https://github.com/DevdragonLi/ProtocolServiceManger.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'ProtocolServiceManger/**/*'

end
