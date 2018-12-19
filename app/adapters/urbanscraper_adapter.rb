class UrbanscraperAdapter

  def self.get_slang(search_term)
    split = search_term.split
    join = split.join("%20")

    response = RestClient.get("http://urbanscraper.herokuapp.com/define/#{join}")
    json_response = JSON.parse(response.body)
    return json_response
  end

end
