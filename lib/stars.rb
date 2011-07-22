$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require 'date'
require 'fileutils'
require 'httparty'
require 'keep'
require 'nokogiri'
require 'open-uri'
require 'terminal-table/import'

require 'stars/client'
require 'stars/config'
require 'stars/post'

require 'stars/core_ext/string'

require 'stars/services/service'
require 'stars/services/convore'
require 'stars/services/favstar'

module Stars
  VERSION = '0.5.3'

  def self.config
    @config ||= Config.new
  end

  def self.services
    %w(favstar convore)
  end

  def self.installed_services
    config.keep.keys
  end

  def self.uninstalled_services
    services - installed_services
  end
end
