require_relative 'password_generator'
require_relative 'password_validator'

password_1 = PasswordGenerator.call
password_2 = PasswordGenerator.call

puts 'Here are the generated passwords'
puts password_1, password_2

puts 'validate first generated password'
puts PasswordValidator.call(password_1)

puts 'validate second generated password'
puts PasswordValidator.call(password_2)

puts 'validate random wrong password'
puts PasswordValidator.call('Hello123/')
