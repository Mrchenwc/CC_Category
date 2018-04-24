Pod::Spec.new do |s|
s.name         = 'CC_Category'
s.version      = '0.0.6'
s.summary      = 'CC_Category'
s.homepage     = 'https://github.com/Mrchenwc/CC_Category'
s.license      = 'MIT'
s.authors      = {'Mrchenwc' => '547340423@qq.com'}
s.platform     = :ios, '6.0'
s.source       = {:git => 'https://github.com/Mrchenwc/CC_Category.git', :tag => s.version}
s.requires_arc = true

s.subspec 'Category' do |ss|
  ss.source_files = 'Classes/**/*'
end

end
