class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email 
  validates_uniqueness_of :email 
  
  has_many :logs, dependent: :destroy
  has_many :projects, dependent: :destroy 
end
