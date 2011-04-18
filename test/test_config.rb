require 'helper'

class TestConfig < Test::Unit::TestCase

  def setup
    global_setup
    @config = Stars::Config.new
  end

  def test_yaml_load
    assert_equal 'holman', @config.username('favstar')
  end

  def test_prompt_for_username_existing_service
    @config.keep.stubs(:present?).returns(true)
    Keep.any_instance.expects(:get)
    @config.prompt_for_username("favstar")
  end

  def test_add_username_to_nonexistent_service
    Stars::Config.any_instance.expects(:exit)
    @config.prompt_for_username("trololol")
  end

  def test_config_path
    assert @config.config_path.kind_of?(String)
  end

end
