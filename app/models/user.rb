class User < ActiveRecord::Base
   validates :username, :password, :email,  presence: true
  
   scope :find_username, -> (username){ where(username: username) }
   scope :authenticate, -> (password){ where(password: password) }
end
