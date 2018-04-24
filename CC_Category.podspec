Pod::Spec.new do |s|
s.name         = 'CC_Category'
s.version      = '0.0.2'
s.summary      = 'CC_Category'
s.homepage     = 'https://github.com/Mrchenwc/CC_Category'
s.license      = 'MIT'
s.authors      = {'Mrchenwc' => '547340423@qq.com'}
s.platform     = :ios, '6.0'
s.source       = {:git => 'https://github.com/Mrchenwc/CC_Category.git', :tag => s.version}
s.source_files  = "Classes/**/*"
s.requires_arc = true
end
