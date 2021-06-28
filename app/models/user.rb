class User < ActiveRecord::Base
  def to_user_list
    "#{id}. #{user}"
  end
end
