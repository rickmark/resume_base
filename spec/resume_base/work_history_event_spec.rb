require 'spec_helper'

describe ResumeBase::WorkHistoryEvent do
  def default_options
    {
      name: 'Microsoft',
      start_date: Date.parse('04/10/2010'),
      location: 'Redmond, WA',
      title: 'Security Software Development Engineer II'
    }
  end

  describe '#initialize' do
    it 'should be initialized with defaults' do
      event = ResumeBase::WorkHistoryEvent.new

      expect(event.style).to eq ResumeBase::WorkHistoryEvent::STYLE_MONTH
      expect(event.name).to be nil
      expect(event.start_date).to be nil
    end

    it 'should be initialized with a option hash' do
      options = default_options.dup
      event = ResumeBase::WorkHistoryEvent.new options

      expect(event.name).to eq options[:name]
      expect(event.location).to eq options[:location]
      expect(event.title).to eq options[:title]
      expect(event.start_date).to be_an_instance_of Date
      expect(event.current?).to be_truthy
      expect(event.valid?).to be_truthy
    end

    it 'should parse string based dates' do
      options = default_options.dup
      options[:end_date] = '15/04/2015'

      event = ResumeBase::WorkHistoryEvent.new options

      expect(event.end_date).to be_kind_of Date
      expect(event.current?).to be_falsey
    end
  end

  describe '#date' do
    it 'should output a proper date range when current' do
      event = ResumeBase::WorkHistoryEvent.new default_options

      expect(event.date).to eq 'October 2010 - Current'
    end

    it 'should output a proper date range when current and month style' do
      event = ResumeBase::WorkHistoryEvent.new default_options
      event.style = ResumeBase::WorkHistoryEvent::STYLE_YEAR

      expect(event.date).to eq '2010 - Current'
    end

    it 'should output a proper date range when current and day style' do
      event = ResumeBase::WorkHistoryEvent.new default_options
      event.style = ResumeBase::WorkHistoryEvent::STYLE_DAY

      expect(event.date).to eq 'October 4 2010 - Current'
    end

    it 'should error when the style value is corrupt' do
      event = ResumeBase::WorkHistoryEvent.new default_options

      event.instance_eval do
        @style = :bad
      end

      expect { event.date }.to raise_error RangeError
    end

    it 'should output a proper date range when not current' do
      options = default_options.dup
      options[:end_date] = Date.parse('15/04/2015')

      event = ResumeBase::WorkHistoryEvent.new options

      expect(event.date).to eq 'October 2010 - April 2015'
    end
  end

  describe '#valid?' do
    it 'should be invalid if no name' do
      options = default_options.dup
      options[:name] = nil

      event = ResumeBase::WorkHistoryEvent.new options

      expect(event.valid?).to be false
    end
  end

  describe '#to_s' do
    it 'should output the name and title' do
      event = ResumeBase::WorkHistoryEvent.new default_options

      expect(event.to_s).to eq "#{default_options[:name]} - #{default_options[:title]}"
    end
  end
end
