class User < ApplicationRecord
  after_create :set_profile, :set_cart

  # Validations
  #-------------------------------------------------#
  validates :email, presence: true
  validates :username, presence: true
  validates :mobile, presence: true, length: { maximum:10}
  validates_presence_of :mobile, unless: -> { from_omniauth? }
  #-------------------------------------------------#


  #Associations
  #-------------------------------------------------#
    has_one :profile
    has_many :books
    has_one :cart
    has_one :order
  #-------------------------------------------------#

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable,  :rememberable, :validatable ,:omniauthable, :omniauth_providers => [:google_oauth2,:facebook],
         authentication_keys: [:login]

    def login
      @login || self.username || self.mobile || self.email
    end

    def email_required?
      false
    end

    def set_profile
      self.create_profile(name: $name)
    end

    def set_cart
      self.create_cart()
    end 
    
    def from_omniauth?
       provider && uid
    end

    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
        if login = conditions.delete(:login)
          where(conditions.to_h).where(["lower(mobile) = :value OR lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
        elsif conditions.has_key?(:email) || conditions.has_key?(:mobile) || conditions.has_key?(:username)
          where(conditions.to_h).first
        end
    end

    def self.from_omniauth(access_token)
      data = access_token.info
      user = User.find_by(email: data['email'])
      unless user
        $name = data.name
        user = User.create(
        email: data['email'],
        password: Devise.friendly_token[0,20]
       )
      end
      user.uid = access_token.uid
      user.provider = access_token.provider
      user.save
      user
    end


  
end

