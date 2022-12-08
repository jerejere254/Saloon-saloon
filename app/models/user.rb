class User < ApplicationRecord
    has_many :appointments
    has_secure_password
validates :username, presence: true
validates :password, length: {in: 3...8}

end
