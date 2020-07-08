class User < ApplicationRecord
    has_secure_password
    has_many :tasks
    has_many :volunteers
end
