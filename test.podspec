Pod::Spec.new do |s|
  s.name         = "test"
  s.version      = "0.2.0"
  s.summary      = "test"

  s.description  = <<-DESC
                   A longer description of test in Markdown 
                   DESC

  s.homepage     = "http://www.baidu.com"

  s.license      = "MIT"

  s.author             = { "knight" => "huangbin911@gmial.com" }

   s.platform     = :ios, "7.0"


  s.source       = { :git => "https://github.com/knighthb/HBCustomView.git", :tag => "0.2.0" }

  s.source_files  =  "HBCustomView/Controllers/Define.h"


   s.requires_arc = true

  s.dependency 'MJRefresh', '~> 2.0.1'

end
