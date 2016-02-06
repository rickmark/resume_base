module ResumeBase
  # Person includes all the personal details of an individual
  class Person
    include ActiveModel::Model

    attr_reader :first_name
    attr_reader :last_name
    attr_reader :phone_number
    attr_reader :email_address

    validates_presence_of :first_name, :last_name, :phone_number, :email_address
    validates_format_of :phone_number, with: /\+1 \(\d{3}\) \d{3}-\d{4}/
    validates_format_of :email_address, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    def initialize(options = {})
      @first_name = options[:first_name]
      @last_name = options[:last_name]
      @phone_number = options[:phone_number]
      @email_address = options[:email_address]
    end

    def to_s
      "#{@first_name} #{@last_name}"
    end
  end
end
