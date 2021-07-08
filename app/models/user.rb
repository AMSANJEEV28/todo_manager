class User < ApplicationRecord
  def to_user_list
    "#{id}. #{user}"
  end
end
