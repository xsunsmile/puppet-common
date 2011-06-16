
Facter.add("vpn_ipaddress") do
	setcode do
		ipaddress = %x{/usr/bin/find /tmp/ -name host_settings.sh -exec grep vpn {} \\; | head -n1 | awk -F\\" '{print $2}'}
		ipaddress.chomp.gsub(/\s/,'') if ipaddress
	end
end
