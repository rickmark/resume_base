require 'spec_helper'

describe ResumeBase::Hobby do
  def default_options
    {
      name: 'Soccer',
      description: 'Rain City soccer league member sense 2013'
    }
  end

  describe '#valid?' do
    it 'should be valid with default options' do
      hobby = ResumeBase::Hobby.new default_options

      expect(hobby.valid?).to be true
    end

    it 'should be invalid without a name' do
      hobby = ResumeBase::Hobby.new description: 'Some description'

      expect(hobby.valid?).to be false
    end
  end
end
