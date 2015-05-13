require 'net/http'

class WeatherEventsController < ApplicationController
  def new
    @weather = WeatherEvent.new
    @types = ['sunny', 'rain', 'blah blah']
  end
  def create
    city= params[:City]
    country = params[:Country]
    success = nil
    # while success.nil?
        res = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{city},#{country}")
        body = JSON.parse res.body
        if body['cod'] == '404'
          # wrong city, country
          @sherv = 'oh boy!'
        else
          @sherv = "" + "#{res.code}" + res.body
        end
    render 'home/index1'
  end

  end
