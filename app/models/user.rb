class User < ActiveRecord::Base
	has_secure_password
  	validates :name, :length => { :minimum => 3, :message => "must be at least 3 characters, fool!" }
  	validates :email, :uniqueness => true, :format => /.+@.+\..+/ # imperfect, but okay
end
