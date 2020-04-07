#!/usr/bin/env ruby

require 'net/http'
require 'minitest/autorun'
require 'socket'

class JenkinsSampleTest < MiniTest::Unit::TestCase
  def setup
    uri_params = {
      :host => ENV['TEST_IP_ADDRESS'] || 'localhost',
      :port => ('8080').to_i,
      :path => '/index.html'
    }
    @webpage = Net::HTTP.get(URI::HTTP.build(uri_params))
  end

  def test_congratulations
    assert(@webpage =~ /Congratulations/)
  end
end
