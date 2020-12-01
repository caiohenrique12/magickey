user = User.new(email: ENV['EMAIL'], password: ENV['PASSWORD'])
user.save