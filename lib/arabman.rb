require "arabman/version"

module Arabman
  def self.included(klass)
    klass.send(:include, Arabman::InstanceMethods)
  end

  module InstanceMethods

    def to_roman
      begin
        unless (1..3999).include?(self)
          raise RangeError.new("Please enter a number between 1 and 3999.")
        end

        'M' * get_digit(4) <<
        Translator.execute(get_digit(3), 'C', 'D', 'M') <<
        Translator.execute(get_digit(2), 'X', 'L', 'C') <<
        Translator.execute(get_digit(1), 'I', 'V', 'X')

      rescue => errors
        errors
      end
    end

    private

    # 145.get_digit(2) => 4
    def get_digit(num)
      self % (10 ** num) / 10 ** (num - 1)
    end
  end

  module Translator

    # Converter.execute(8, 'I', 'V', 'X') => 'VIII'
    def self.execute(num, one, five, ten)
      if num <= 3
        one * num
      elsif num <= 5
        one * (5 - num) << five
      elsif num <= 8
        five << one * (num - 5)
      else
        one * (10 - num) << ten
      end
    end
  end
end

Fixnum.send :include, Arabman
