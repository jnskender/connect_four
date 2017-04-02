require "bundler/setup"
require "connect_four"
require 'rspec/collection_matchers'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"
  config.fail_fast = true
  config.color = true
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
