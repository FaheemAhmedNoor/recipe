class Chef < ApplicationRecord
  before_save { self.email = email.downcase }
  
  has_many :recipees

  validates :chefname, presence: true, length: { minimum: 3, maximum: 40 }
  VALIDATE_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 110 },
                                      uniqueness: { case_sensitive: false },
                                      format: { with: VALIDATE_EMAIL_REGEX }
end
