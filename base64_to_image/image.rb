require 'base64'

class Image
  attr_reader :image64_string

  def initialize(file_path)
    @image64_string = File.open(file_path).read
  end

  def process
    decoded_image_string = Base64.decode64(image64_string.split(',').last)

    File.open(file_name, 'wb') do |file|
      file.write(decoded_image_string)
    end
  end

  def file_name
    "#{tmp_directory}/straiv.#{file_type}"
  end

  # I've used Regexp to substring the actual string where I can read image type easily. There are multiple other ways as well
  # like image64_string.split(':').last.split(';').first.split('/').last

  def file_type
    image64_string[/#{Regexp.escape(':')}(.*?)#{Regexp.escape(';')}/m, 1].split('/').last
  end

  # For Rails, we don't need to check either tmp directory exists or not.
  # We can just use "Rails.root.join('tmp', file_name)"

  def tmp_directory
    Dir.mkdir('tmp') unless Dir.exist?('tmp')

    'tmp'
  end
end

Image.new('base64.txt').process
