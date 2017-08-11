require 'byebug'

#time complexity O(n!)
def first_anagram?(string, match_string)
  string_perms = string.chars.permutation(string.length).to_a
  string_perms.include?(match_string.chars)
end

#time complexity O(n**2)
def second_anagram?(string, match_string)
  # debugger
  string_array = string.chars
  match_array = match_string.chars
  string_array.each_with_index do |ch, idx1|
    match_array.each_with_index do |ch2, idx2|
      if ch == ch2
        string_array[idx1] = ""
        match_array[idx2] = ""
        break
      end
    end
  end
  string_array.join.empty? && match_array.join.empty?
end

#O(nlogn)
def third_anagram?(string,match_string)
  string.chars.sort == match_string.chars.sort
end

#O(n)
def fourth_anagram?(string, match_string)
  string_letters = Hash.new(0)
  match_letters = Hash.new(0)

  string.each_char do |ch|
    string_letters[ch] += 1
  end

  match_string.each_char do |ch|
    match_letters[ch] += 1
  end

  string_letters == match_letters
end

def bonus_anagram?(string, match_string)
  string_letters = Hash.new(0)

  string.each_char do |ch|
    string_letters[ch] += 1
  end

  match_string.each_char do |ch|
    string_letters[ch] -= 1
  end

  string_letters.values.all? {|x| x == 0}
end
