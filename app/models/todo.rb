class Todo < ActiveRecord::Base
  belongs_to :user

  def due_today?
    due_date == Date.today
  end

  def self.overdue
    where("due_date < ?", Date.today)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.completed
    all.where(completed: true)
  end

  def self.show_list
    puts "My Todo-List\n\n\tOverdue\n\n"
    puts overdue.map { |todo| todo.to_displayable_string }
    puts "\n\tDue Today\n\n"
    puts due_today.map { |todo| todo.to_displayable_string }
    puts "\n\tDue Later\n\n"
    puts due_later.map { |todo| todo.to_displayable_string }
  end

  def self.mark_as_complete(id)
    todo = Todo.find(id)
    todo.completed = true
    todo.save
    todo
  end
end
