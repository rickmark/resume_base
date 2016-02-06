require 'spec_helper'

describe ResumeBase::Person do

  let(:default_options) do
    {
        first_name: 'Richard',
        last_name: 'Mark',
        email_address: 'rickmark@me.com',
        phone_number: '+1 (206) 913-3215'
    }
  end

  let(:default_person) { ResumeBase::Person.new default_options }

  describe '#initialize' do
    it 'should work with a valid set of options' do
      person = ResumeBase::Person.new default_options

      expect(person).to_not be nil
    end

    it 'should not be valid with empty options' do
      person = ResumeBase::Person.new {}

      expect(person.valid?).to be false
    end

    it 'should not be valid with a bad phone number' do
      options = default_options
      options[:phone_number] = '88-22293'

      person = ResumeBase::Person.new options

      expect(person.valid?).to be false
    end

    it 'should not be valid with a bad email address' do
      options = default_options
      options[:email_address] = 'not!an!email'

      person = ResumeBase::Person.new options

      expect(person.valid?).to be false
    end
  end

  describe '#to_s' do
    it 'should output Richard Mark for default options' do
      person = default_person

      expect(person.to_s).to eq 'Richard Mark'
    end
  end
end