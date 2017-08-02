require "rest-client"

# Check for the response code, headers, and cookies of a Bing search.
class Bing
  def self.search(search_parameter)
    new(search_parameter).search
  end

  def initialize(search_parameter)
    @search_parameter = search_parameter
    @response = nil
  end

  def search
    get_response
    print_result
  end

  private

  def get_response
    @response = RestClient.get(
      "https://www.bing.com/search", params: { q: @search_parameter }
    )
  end

  def print_result
    system "clear" or system "cls"
    puts "Searching Bing for '#{@search_parameter}'"
    puts
    puts "------------"
    puts
    puts "Code: #{@response.code}"
    puts
    puts "------------"
    puts
    puts "Headers: #{@response.headers}"
    puts
    puts "------------"
    puts
    puts "Cookies: #{@response.cookies}"
    puts
    puts "------------"
    puts
  end
end

system "clear" or system "cls"
loop do
  begin
    puts "Introduce word to search on Bing:"
    print "> "
    Bing.search(gets.chomp)
  rescue Interrupt
    system "clear" or system "cls"
    puts "Thanks for trying it out. Hope you liked it."
    puts
    exit
  end
end
