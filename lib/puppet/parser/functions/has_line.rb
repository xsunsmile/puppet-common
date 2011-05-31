
module Puppet::Parser::Functions
  newfunction(:has_line, :type => :rvalue) do |args|
        filename, line = args[0], args[1]
        result = `grep -qFx #{line} #{filename}`.sub(/\n/,'')
        return result.size > 0
  end
end

