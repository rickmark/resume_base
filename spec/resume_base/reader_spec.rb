require 'spec_helper'

describe ResumeBase::Reader do
  let(:example_path) { File.join RSPEC_FIXTURE_PATH, 'example.yml' }

  it 'should read a YAML formatted resume' do
    resume = ResumeBase::Reader.read example_path

    expect(resume).to_not be nil
  end
end
