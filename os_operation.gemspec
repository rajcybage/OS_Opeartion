require './lib/os_operation/version.rb'
Gem::Specification.new do |s|
  s.name        = 'os_operation'
  s.version     = OsOperation::VERSION
  s.date        = '2013-07-07'
  s.summary     = "OS Operation"
  s.description = "Operating system simple operation"
  s.authors     = ["Rajarshi Das"]
  s.email       = 'rdasarminus@gmail.com'
  s.files       = ["lib/os_operation.rb", "lib/os_operation/heroku.rb", "lib/os_operation/rvm.rb"]
  s.homepage    = ''
end