
Facter.add("gem_bin_path") do
	setcode do
		%x{gem env | grep "EXECUTABLE DIRECTORY" | awk -F: '{print $2}'}.chomp.gsub(/\s/,'')
	end
end
