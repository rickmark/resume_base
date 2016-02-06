module ResumeBase
  # <tt>ResumeBase::Reader</tt> loads a resume object in from a YAML
  # serialization of that data.  This can come from either a .yml file
  # on disk or from some other data source.
  class Reader
    def self.load(data)
      yaml = YAML.load data

      yaml.deep_symbolize_keys!

      ResumeBase::Resume.new yaml
    end

    def self.read(path)
      load File.read path
    end
  end
end
