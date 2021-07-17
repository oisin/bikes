require 'simplecov'

SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter

SimpleCov.start do
  add_filter '/test/'
end

require 'minitest/autorun'
require 'webmock/minitest'
require_relative '../lib/bikes'

def test_data(name)
  File.new(File.expand_path(File.dirname(__FILE__) + "/data/#{name.to_s}.json"))
end
