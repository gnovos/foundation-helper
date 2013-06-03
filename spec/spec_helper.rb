$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'mobj'
require 'foundation_helper'

RSpec.configure do |config|
  config.mock_with     :rspec
  config.color_enabled = true
  config.formatter     = 'documentation'
end
