require 'clockwork'
require 'net/http'
require './config/boot'
require './config/environment'
module Clockwork

handler do |job|

  case job
    when 'weather_check'
      # Mydata.create degree: input_data
      # work sequence:
      # for all rules with weather_events event
      # check status with a request
      # create a notif if needed
      rules = Rule.where.not(:weather_events_id => nil)
      rules.each do |rule|
        ev = WeatherEvent.find(rule.weather_events_id)
        res = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{ev.city},#{ev.country}")
        if res.code == 200
          body = JSON.parse res.body
          # weather = JSON.parse body['weather']
          id = body['weather'][0]['id']
          id = Integer(id)
          if id < 803 and id >= 800 and ev.weather == 'sunny'
            rule.create_notif
          end
          if id < 650 and id >= 600 and ev.weather == 'snowy'
            rule.create_notif
          end
          if id < 550 and id >= 500 and ev.weather == 'rain'
            rule.create_notif
          end
          if id < 810 and id >= 803 and ev.weather == 'cloudy'
            rule.create_notif
          end
        end
      end
      # WeatherEvent.all
      puts "this shit is working man!"
    # when 'some_other_task'
    #   ...
    else
      puts "Couldn't find your job!"
  end

end

every(30.seconds, 'weather_check')
end