module ResumeBase
  # <tt>ResumeBase::WorkHistoryEvent</tt> represents a period of time in which
  # the resume owner worked at a particular position.  It includes relevant
  # metadata such as the location, title, company, start and end dates.
  class WorkHistoryEvent
    include ActiveModel::Model

    STYLE_DAY   = :day
    STYLE_MONTH = :month
    STYLE_YEAR  = :year

    STYLES = [STYLE_DAY, STYLE_MONTH, STYLE_YEAR]

    attr_reader :name
    attr_reader :start_date
    attr_reader :end_date
    attr_reader :location
    attr_reader :title
    attr_reader :style

    validates_presence_of :name, :start_date, :location, :title

    def initialize(options = {})
      @style      = options[:style] || STYLE_MONTH
      @name       = options[:name]
      @start_date = parse_date options[:start_date]
      @end_date   = parse_date options[:end_date]
      @title      = options[:title]
      @location   = options[:location]
    end

    def style=(style)
      raise ArgumentError.new "#{style} is an invalid style" unless STYLES.include? style

      @style = style
    end

    def date
      date_formatter = date_label_proc

      start_label = date_formatter.call start_date
      end_label = end_date ? date_formatter.call(end_date) : 'Current'

      "#{start_label} - #{end_label}"
    end

    def current?
      end_date.nil?
    end

    def to_s
      "#{name} - #{title}"
    end

    private

    def date_label_proc
      case @style
      when STYLE_DAY
        ->(date) { date.strftime '%B %-d %Y' }
      when STYLE_MONTH
        ->(date) { date.strftime '%B %Y' }
      when STYLE_YEAR
        ->(date) { date.strftime '%Y' }
      else
        raise RangeError.new "#{@style} is an invalid date style."
      end
    end

    def parse_date(date)
      date.kind_of?(String) ? Date.parse(date) : date
    end
  end
end
