class PasswordGenerator
  LOWER_CASE_LETTERS = ('a'..'z').to_a
  UPPER_CASE_LETTERS = ('A'..'Z').to_a
  NUMBERS = (0..9).to_a
  SPECIAL_CHARACTERS = '%?@+-_€\\/?.;><'.split('')

  def self.call
    password = LOWER_CASE_LETTERS.sample
    password += UPPER_CASE_LETTERS.sample
    password += NUMBERS.sample(2).join('')
    password += SPECIAL_CHARACTERS.sample(2).join('')
    password += (LOWER_CASE_LETTERS + UPPER_CASE_LETTERS + NUMBERS + SPECIAL_CHARACTERS).sample(rand(6..15)).join('')
    password.chars.shuffle.join('')
  end
end
