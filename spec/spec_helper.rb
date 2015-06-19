require 'rubygems'

require 'coveralls'
Coveralls.wear!

require 'pry'
require 'rspec'
require_relative '../lib/trace_files'
require_relative 'example_trace'

def expected_colors
  (<<-"CODE").strip.freeze
\e[32m  def self.run
\e[0m\e[32m    1 + 2
\e[0m\e[32m    three = lambda { 3 }
\e[0m\e[32m    val = 2.times { three.call }
\e[0m\e[32m    three = lambda { 3 }
\e[0m\e[32m    val = 2.times { three.call }
\e[0m\e[32m    three = lambda { 3 }
\e[0m\e[32m    val = 2.times { three.call }
\e[0m\e[32m    val * 4
\e[0m\e[32m    '5'
\e[0m\e[32m  end
\e[0m
  CODE
end

def expected_no_colors
  (<<-"CODE").freeze
  def self.run
    1 + 2
    three = lambda { 3 }
    val = 2.times { three.call }
    three = lambda { 3 }
    val = 2.times { three.call }
    three = lambda { 3 }
    val = 2.times { three.call }
    val * 4
    '5'
  end
  CODE
end
