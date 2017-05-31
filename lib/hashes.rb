# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  Hash[arr_str = str.split(" ").collect{|x| [x,x.length] }]
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  hash.keys[hash.values.index(hash.values.max)]
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  older.each{|key, value|
    if newer.has_key?(key)
      older[key] = newer[key]
    end
  }
  newer.each{|key, value|
    unless older.has_key?(key)
      older[key] = value
    end }
  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  new_arr = word.split("")
  Hash[new_arr.collect{|x| [x,new_arr.count(x)]}]
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  new_hash = Hash[arr.collect{|x| [x,nil]}]
  new_hash.to_a.flatten.compact
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  counter_odd = 0
  counter_even = 0
  Hash[numbers.collect{|x|
    if x.odd?
      [:odd, counter_odd += 1]
    else
      [:even, counter_even += 1]
    end
  }]
end

# Define a method that, given a string, returns the most common vowel. If
# there's a tie, return the vowel that occurs earlier in the alphabet. Assume
# all letters are lower case.
def most_common_vowel(string)
  vowels = ["a","e","i","o","u"]
  new_arr = string.split("")
  new_hash = Hash[new_arr.collect{|x|
    if vowels.include?(x)
      [x,new_arr.count(x)]
    end
  }]
  if new_hash.values.count(new_hash.values.max) == 1
    return new_hash.sort_by{|w,v| v }.reverse[0][0]
  else
    return new_hash.sort_by{|w,v| w }[0][0]
  end
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  new_arr = []
  students.each{|key, value| new_arr << key if value >= 7}
  new_arr.combination(2).to_a
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  new_hash = Hash[specimens.collect{|x| [x,specimens.count(x)]}]
  new_hash.keys.length**2*new_hash.values.min/new_hash.values.max
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  normal_hash = character_count(normal_sign)
  vandalized_hash = character_count(vandalized_sign)
  vandalized_hash.each{|key, value|
    unless normal_hash.has_key?(key)
      return false
    else
      unless normal_hash[key] >= vandalized_hash[key]
        return false
      end
    end
  }
  return true
end

def character_count(str)
  new_arr = str.delete(" ").downcase.split("")
  Hash[new_arr.collect{|x| [x,new_arr.count(x)]}]
end
