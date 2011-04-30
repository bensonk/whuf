class Event < ActiveRecord::Base
  belongs_to :from_user, :class_name => "User"
  belongs_to :to_user, :class_name => "User"

  def self.to_user(u)
    where("to_user_id = #{u.id}")
  end

  def self.from_user(u)
    where("from_user_id = #{u.id}")
  end
end
