
Facter.add("vpn_ipaddress") do
	setcode do
		ipaddress = %x{/usr/bin/find /tmp/ -type f -name \"*env.sh\" -exec grep vpn_addr {} \\; | head -n1 | awk -F\\" '{print $2}'}
		ipaddress.chomp.gsub(/\s/,'') if ipaddress
	end
end
