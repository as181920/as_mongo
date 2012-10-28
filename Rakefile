#!/usr/bin/env rake
require "bundler/gem_tasks"
require "rake/testtask"

task default: "test"

desc "Run tests"
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/**/test_*.rb'
  t.verbose = true
end

