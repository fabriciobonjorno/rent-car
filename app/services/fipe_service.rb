require 'rest-client'
require 'json'

class FipeService
  def initialize(type, action, parameters)
    @type = type
    @action = action
    @parameters = parameters
  end

  def call
    begin
      value = get_api
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end

  private

  def get_api
    base_url = "http://fipeapi.appspot.com/api/1/#{@type}/#{@action}/#{@parameters}.json"
    res = RestClient.get base_url
    JSON.parse(res.body)['carros'][0]['veiculos'][0]
  end
end
