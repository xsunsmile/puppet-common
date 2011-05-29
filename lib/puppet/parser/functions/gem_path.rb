# gem_path.rb
# does a DNS lookup and returns an array of strings of the results

require 'rubygems'

module Puppet::Parser::Functions
	newfunction(:gem_path, :type => :rvalue) do |args|
		result = ''
		Gem.path.each {|it| result += "#{it}/bin:" }
		return result.sub(/:$/,'')
	end
end
