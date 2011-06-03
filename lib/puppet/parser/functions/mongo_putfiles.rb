# mongo_putfiles.rb
# does a DNS lookup and returns an array of strings of the results
# args[0] => mongodb://127.0.0.1:12277/inters_debs/$arch/$filename

require 'rubygems'
require 'mongo'

module Puppet::Parser::Functions
	newfunction(:mongo_putfiles, :type => :rvalue) do |args|
		match_exp = /mongodb:\/\/(\d+.\d+.\d+.\d+):?(\d+)?\/([\w\-_]+)\/([\w\-_]+)\/(.+)/
		mongodb_host, port, file_db, collection_name, filename = \
			$1,$2,$3,$4,$5 if args[0] =~ /#{match_exp}/
		if filename =~ /^_/
			filebuckets = Dir.glob(filename.sub(/^_/,'')) || Array.new
		else
			filebuckets = [ filename ]
		end
		filebuckets.each do |filename|
			if File.exist?(filename)
				conn = Mongo::Connection.new(mongodb_host)
				db = conn.db(file_db)
				fs = Mongo::GridFileSystem.new(db)
				fs.open(filename, "w", :delete_old => true) do |f|
					f.write File.open(filename)
				end
			end
		end
		filebuckets.join(':')
	end
end
