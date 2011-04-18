require 'helper'

module Kernel
  def system(s) ; end
  def puts(s)   ; end
end

class TestClient < Test::Unit::TestCase

  def setup
    global_setup
  end

  def test_add_service
    Stars.config.expects(:prompt_for_username).with('favstar').once
    Stars::Client.any_instance.stubs(:display)
    Stars::Client.any_instance.stubs(:star_loop)
    Stars::Client.new(%w(add favstar))
  end

  def test_show_only_one_service
    Stars::Favstar.expects(:posts).returns([])
    Stars::Client.any_instance.stubs(:star_loop)
    Stars::Client.new(['favstar'])
  end
end
