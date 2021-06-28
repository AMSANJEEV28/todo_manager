class User < ActiveRecord::Base
  def to_UserList
    "#{id}. #{name}"
  end
end
