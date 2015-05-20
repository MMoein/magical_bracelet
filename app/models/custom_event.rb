class CustomEvent < ActiveRecord::Base
  def generate_token
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    string = (0...50).map { o[rand(o.length)] }.join
    self.token = string
    self.save
    token
  end
end
