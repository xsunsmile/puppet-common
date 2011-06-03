
Puppet::Type.newtype(:mongofile) do
    @doc = "Create new mongofile"
    ensurable
    newproperty(:host) do
        desc "The owner of the database."
    end
    newproperty(:port) do
        desc "The owner of the database."
    end
    newproperty(:filedb) do
        desc "The owner of the database."
    end
    newproperty(:collection) do
        desc "The owner of the database."
    end
    newproperty(:file) do
        desc "The owner of the database."
    end
end
