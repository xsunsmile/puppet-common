# gem_path.rb
# does a DNS lookup and returns an array of strings of the results

require 'rubygems'

module Puppet::Parser::Functions
	newfunction(:gem_path, :type => :rvalue) do |args|
		return Gem.path.join(':')
	end
end
