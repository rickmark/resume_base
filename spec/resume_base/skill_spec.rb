require 'spec_helper'

describe ResumeBase::Skill do
  def default_options
    {
      name: 'Skill',
      score: 4
    }
  end

  describe '#valid?' do
    it 'should be valid with default options' do
      skill = ResumeBase::Skill.new default_options

      expect(skill.valid?).to be true
    end

    it 'should validate score is a number' do
      options = default_options.dup
      options[:score] = 'Some Text'

      skill = ResumeBase::Skill.new options

      expect(skill.valid?).to be false
    end

    it 'should validate score is in the range 0 to 4' do
      options = default_options.dup
      options[:score] = 10

      skill = ResumeBase::Skill.new options

      expect(skill.valid?).to be false
    end

    it 'should require a name' do
      options = { score: 3 }

      skill = ResumeBase::Skill.new options

      expect(skill.valid?).to be false
    end
  end
end
