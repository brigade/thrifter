require 'bundler/setup'
require 'thrifter'
require 'thrifter/queueing'

root = File.expand_path '../..', __FILE__
$LOAD_PATH << "#{root}/vendor/gen-rb"

require 'test_service'

require 'sidekiq'
require 'sidekiq/testing'
require 'minitest/autorun'
require 'mocha/mini_test'

Sidekiq::Testing.fake!

class FakeTransport
  def initialize(*)

  end

  def open

  end

  def close

  end
end

class FakeProtocol
  def initialize(*)

  end
end

class NullStatsd
  def incr(*)

  end

  def time(*)
    yield
  end
end