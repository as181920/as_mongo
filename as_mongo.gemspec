# -*- encoding: utf-8 -*-
require File.expand_path('../lib/as_mongo/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andersen Fan"]
  gem.email         = ["as181920@hotmail.com"]
  gem.summary       = %q{addon for mongo-ruby-driver}
  gem.description   = %q{add some common usage feature to mongo driver, extend the mongo driver,do not use orm.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "as_mongo"
  gem.require_paths = ["lib"]
  gem.version       = AsMongo::VERSION

  gem.add_dependency 'bson'
  gem.add_dependency 'bson_ext'
  gem.add_dependency 'mongo'
  #gem.add_development_dependency 'sinatra'
end
