# Code kata for word wrap
#
# Take this kata with the "kata" gem.

require 'kata'

kata "WordWrap" do
  requirement %q{Create a "WordWrap" class that is initialized with an integer parameter} do
    detail "The parameter is the wrap column"
    example %q{WordWrap.new 4}
    detail "Non-integer parameters raise an exception"
    example %q{WordWrap.new raises an exception}
    example %q{WordWrap.new "foo" raises an exception}
  end

  context %q{"wrap" method} do
    requirement "Create a wrap method that takes a string parameter" do
      example %q{WordWrap.new(5).wrap "this is text"}
    end

    requirement "The method should raise an exception for non-string parameters" do
      example %q{WordWrap.new(4).wrap([1,2,3]) raises an exception}
    end

    requirement "It should wrap the empty string to an empty string" do
      example %q{WordWrap.new(4).wrap("") returns ""}
    end

    requirement "It should wrap two words at the word boundary" do
      example %q{WordWrap.new(5).wrap("word word") returns ""}
    end

    requirement "It should wrap one long word in the middle" do
      detail "Meaning words longer than the wrap length are broken"
      example %q{WordWrap.new(4).wrap("wordword") returns "word\nword"}
    end

    requirement "It should wrap three words at word boundaries" do
      example %q{WordWrap.new(5).wrap("word word word") returns "word\nword\nword"}
    end
  end
end
