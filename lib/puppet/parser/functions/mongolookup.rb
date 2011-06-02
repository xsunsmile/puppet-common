# mongolookup.rb
# does a DNS lookup and returns an array of strings of the results
# args[0] => mongodb://127.0.0.1:12277/inters_hosts/hosts/kuruwa11/arch

require 'rubygems'
require 'mongo'

module Puppet::Parser::Functions
	newfunction(:mongolookup, :type => :rvalue) do |args|
		result = ''
		match_exp = /mongodb:\/\/(\d+.\d+.\d+.\d+):?(\d+)?\/(\w+)\/(\w+)\/(\w+)\/(\w+)/
		mongodb_host, port, hosts_db, collection_name, hostname, prop = \
			$1,$2,$3,$4,$5,$6 if args[0] =~ /#{match_exp}/
		conn = Mongo::Connection.new(mongodb_host)
		db = conn.db(hosts_db)
		hosts_coll = db.collection(collection_name)
		host_info = hosts_coll.find_one("name" => hostname)
		result = host_info["#{prop}"] if host_info
		puts result
	end
end
