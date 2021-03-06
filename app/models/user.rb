class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
  	 	 :omniauthable, :omniauth_providers => [:facebook]

  validates :karma, numericality: {only_integer: true}
  has_many :portals
  has_many :user_quests
  has_many :quests, through: :user_quests
  #belongs_to :current_quest, class_name: 'quest'
  
  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  		user.name = auth.info.name
  		user.image = auth.info.image
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.email = auth.info.email || "#{auth.info.name.split(" ").join}@facebook.com"
  		user.password = Devise.friendly_token[0,20]
  	end
  end

  def update_user_karma
    current_karma = 0
    self.quests.each do |q|
      current_karma += q.karma_impact
    end
    self.karma = current_karma
    self.save
  end


end
