class PasswordValidator
  PASSWORD_REGEX = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d.*\d)(?=.*[%?@+\-_€\\\/?.;><].*[%?@+\-_€\\\/?.;><]).{12,}$/

  def self.call(password)
    if PASSWORD_REGEX.match(password).nil?
      puts "Password: '#{password}' does not meet the requirement"
    else
      puts "Password: '#{password}' is valid"
    end
  end
end
