Gem::Specification.new do |s|
  s.name        = 'sa_detector'
  s.version     = '0.2.0'
  s.date        = '2011-12-09'
  s.summary     = "Stand Alone Detector"
  s.description = "Simple gem for searching and sorting data."
  s.authors     = ["Artem Kornienko"]
  s.email       = 'send.this.to.moff@gmail.com'

  s.files        = Dir["{lib,spec}/**/*", "[A-Z]*", "init.rb"] - ["Gemfile.lock"]
  s.require_path = "lib"

  s.homepage    = 'http://rubygems.org/gems/sa_detector'
end
