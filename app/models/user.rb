class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	def is_liked(model)
 		if Like.where(:likeable => model ,:user_id => self.id).present?
 			Like.where(:likeable => model ,:user_id => self.id).last.like==true
 		end
 	end

 	def is_disliked(model)
 		if Like.where(:likeable => model ,:user_id => self.id).present?
 		Like.where(:likeable => model ,:user_id => self.id).last.like==false
 		end
 	end

 	def self.find_model(id, type)
 		model= type.constantize.find(id)
 		return model
 	end

end
