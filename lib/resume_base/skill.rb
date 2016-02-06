module ResumeBase
  # A skill object represents a work relevant skill and a subjective ranking
  # of overall ability with that particular skill allowing one to showcase
  # areas where some familiarity vs deep knowledge.
  class Skill
    include ActiveModel::Model

    attr_reader :name
    attr_reader :score

    validates_presence_of :name
    validates_numericality_of :score, less_than_or_equal_to: 4

    def initialize(skill = {})
      @name = skill[:name]
      @score = skill[:score] || 0
    end

    def to_s
      "#{name} (#{score})"
    end
  end
end
