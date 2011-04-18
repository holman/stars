# coding: utf-8

require 'test/unit'

begin
  require 'rubygems'
  require 'redgreen'
  require 'leftright'
rescue LoadError
end

require 'mocha'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'stars'

def global_setup
    Stars::Config.any_instance.stubs(:config_path).
                  returns("test/examples/stars.yml")
end
