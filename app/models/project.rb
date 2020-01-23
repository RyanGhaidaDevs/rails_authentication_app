class Project < ApplicationRecord
  belongs_to :user 
  has_many :logs, dependent: :destroy 
end
