module ResumeBase
  # A resume object represents the complete description of an individual.
  class Resume
    include ActiveModel::Model

    attr_reader :person
    attr_reader :skills
    attr_reader :hobbies
    attr_reader :work_history_events

    validates_each :person, :skills, :hobbies, :work_history_events do |record, attribute, value|
      [*value].each do |item|
        record.errors.add attribute, "associated #{item.to_s} must be valid" unless item.valid?
      end
    end

    def initialize(options = {})
      @person = Person.new(options[:person])

      @skills = []
      @work_history_events = []
      @hobbies = []

      parse_items options[:skills], Skill
      parse_items options[:work_history_events], WorkHistoryEvent
      parse_items options[:hobbies], Hobby
    end

    private

    def parse_items(collection, klass)
      return unless collection

      collection.each do |skill|
        @skills << klass.new(skill)
      end
    end

  end
end
