require 'spec_helper'

describe ResumeBase::Resume do
  let(:example_path) { File.join RSPEC_FIXTURE_PATH, 'example.yml' }
  let(:invalid_example_path) { File.join RSPEC_FIXTURE_PATH, 'example_invalid.yml' }

  let(:resume) { ResumeBase::Reader.read example_path }

  describe '#person' do
    it 'should have a person' do
      expect(resume.person).to_not be nil
    end
  end

  describe '#hobbies' do
    it 'should have a list of hobbies' do
      expect(resume.hobbies).to be_an Array
    end
  end

  describe '#skills' do
    it 'should have a list of skills' do
      expect(resume.skills).to be_an Array
    end
  end

  describe '#work_history_events' do
    it 'should have a list of skills' do
      expect(resume.work_history_events).to be_an Array
    end
  end

  describe '#valid?' do
    it 'should be valid with valid data' do
      expect(resume.valid?).to be(true), resume.errors.full_messages.join(", ")
    end

    it 'should be invalid with invalid data' do
      resume = ResumeBase::Reader.read invalid_example_path

      expect(resume.valid?).to be false
    end
  end
end
