require 'net/http'

class ResponseCheck

  # This method will iterate over randomly generated response array.
  # And it will request to the url again again untill we receive success response.

  def self.run
    url = 'https://httpstat.us/'
    status_codes = Array.new(10) { [200, 500].sample }

    status_codes.each do |status|
      resp = Net::HTTP.get_response URI(url + status.to_s)

      puts resp.code + resp.message

      return if resp.code == '200'
    end

    puts 'There is no success response in 10 requests.'
  end
end

ResponseCheck.run
