module ResumeBase
  # Hobby represents a interest that is outside the scope of relevant work
  # experience but helps create a better personal view of the individual.
  class Hobby
    include ActiveModel::Model

    validates_presence_of :name

    attr_reader :name
    attr_reader :description

    def initialize(options = {})
      @name        = options[:name]
      @description = options[:description]
    end
  end
end
