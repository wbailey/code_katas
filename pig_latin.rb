require 'kata'

kata "PigLatin" do
  requirement "Create a PigLatin class that is initialized with a string" do
    detail "The string is a list of words seperated by spaces: 'hello world'"
    detail "The string is accessed by a method named phrase"
    detail "The string can be reset at any time without re-initializing"
    example "PigLatin.new('hello world')"
  end

  context "Translate Method" do
    requirement "Create a translate method that translates the phrase from english to pig-latin." do
      detail "The method will return a string."
      detail "The empty string will return nil."
      example %q{"" translates to nil}
    end

    requirement "Translate words that start with vowels." do
      detail %q{Append "ay" to the word if it ends in a consonant.}
      example %q{"ask" translates to "askay"}
      detail %q{Append "yay" to the word if it ends with a vowel.}
      example %q{"apple" translates to "appleyay"}
      detail %q{Append "nay" to the word if it ends with "y".}
      example %q{"any" translates to "anynay"}
    end

    requirement "Translate a word that starts with a single consonant." do
      detail "Removing the consonant from the front of the word."
      detail "Add the consonant to the end of the word."
      detail "Append 'ay' to the resulting word."
      example %q{"hello" translates to "ellohay"}
      example %q{"world" translates to "orldway"}
    end

    requirement "Translate words that start with multiple consonants." do
      detail "Remove all leading consonants from the front of the word."
      detail "Add the consonants to the end of the word."
      detail "Append 'ay' to the resulting word."
      example %q{"known" translates to "ownknay"}
      example %q{"special" translates to "ecialspay"}
    end

    requirement "Support any number of words in the phrase." do
      example %q{"hello world" translates to "ellohay orldway"}
      detail "Each component of a hyphenated word is translated seperately."
      example %q{"well-being" translates to "ellway-eingbay"}
    end

    requirement "Support capital letters." do
      detail "If a word is captalized, the translated word should be capitalized."
      example %q{"Bill" translates to "Illbay"}
      example %q{"Andrew" translates to "Andreway"}
    end

    requirement "Retain punctuation." do
      detail "Punctuation marks should be retained from the source to the translated string"
      example %q{"fantastic!" tranlates to "anfasticfay!"}
      example %q{"Three things: one, two, three." translates to "Eethray ingsthay: oneyay, otway, eethray."}
    end
  end
end
