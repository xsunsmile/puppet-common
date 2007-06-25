# common/manifests/init.pp - Define common infrastructure for modules
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# See LICENSE for the full license granted to you.

file {
	# Module programmers can use /var/lib/puppet/modules/$modulename to save
	# module-local data, e.g. for constructing config files
	"/var/lib/puppet/modules":
		ensure => directory,
		mode => 0755, owner => root, group => root;
	# prepare directories to drop various puppet enhancements
	[ "$rubysitedir/puppet", "$rubysitedir/facter" ]:
		ensure => directory, 
		mode => 0755, owner => root, group => root;
}

import "defines/*.pp"
import "classes/*.pp"