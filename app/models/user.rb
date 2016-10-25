class User < ApplicationRecord

  def self.from_omniauth(hash)
    user = User.find_or_create_by(uid: hash['uid'], provider: hash['provider'])
    user.name = hash['info']['name']
    user.nickname = hash['info']['nickname']
    user.image = hash['info']['image']
    user.location = hash['info']['location']
    user.save!
    user
  end

end
