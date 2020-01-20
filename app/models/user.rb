class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email 
  validates_uniqueness_of :email 
  
  has_many :projects, dependent: :destroy 


  def logs 
    self.projects.map{|project| project.logs }.flatten()
  end 
end
